function [Vx2,theta,x2,params,par,acx1,acy1,acx2,actheta] = main(L1,L2,y2,haz_dibujo)

%clear; close all; clc;

% Si queremos ver la simuación cinemática del mecanismo debemos introducir
% haz_dibujo=1;
% haz_dibujo = 0;

% parametros fijos del mecanismo
params = struct();
params.L1 = L1; % cm
params.L2 = L2; % cm
params.y2=y2;
params.omega = 5; % rad/s
params.alpha = 0; % rad/s^2

%Hay que definir correctamente el valor de t, Aqui o dentro del bucle?
%No se puede poner antes del bucle por que main primero resuelve el
%problema inicial y al llamar a restricciones no conoce a params.t
%por lo que hace params.t dentro del bucle, es valor que se va actualizando

params.t = 0.005; %inicializamos

% Introducimos las coordenadas iniciales del vector posicion (valores
% aleatorios aunque elegidos con cierto criterio)
x1 = params.L1;
y1 = params.L1*0.05;
x2 = params.L1-params.L2;
theta = 0;

% Formamos el vector de coordenadas generalizadas
q = [x1; y1; x2; theta];

% Hacemos los problemas de velocidad y aceleracion iniciales
v = probvelocidad(q,params);
a = probaceleracion(v,q,params);
% Escribimos los resultados
% fprintf('En el instante inicial:\n')
% fprintf('Vector posicion inicial:\n x1=%f cm, y1=%f cm, x2=%f cm, theta=%f cm\n',q(1),q(2),q(3),q(4))
% fprintf('Vector velocidad inicial:\n vx1=%f cm/s, vy1=%f cm/s, vx2=%f cm/s, omega=%f cm/s\n',v(1),v(2),v(3),v(4))
% fprintf('Vector aceleracion inicial:\n ax1=%f cm/s2, ay1=%f cm/s2, ax2=%f cm/s2, alpha=%f cm/s2\n',a(1),a(2),a(3),a(4))



% Para la simulacion cinematica, definimos como antes el tiempo=0,005 s
if (haz_dibujo)
    figure
    xlim([-20,10])
    ylim([-20,10])
    grid minor;
end

At = 0.005;
% inicializamos un vector columna de las coordenadas que varian
N = 360;
x1=zeros(N,1); y1=zeros(N,1); x2=zeros(N,1); theta=zeros(N,1); t=zeros(N,1);

Vx2=zeros(N,1); %Creamos la matriz de tendra las velocidades del punto 2
acx1=zeros(N,1); acy1=zeros(N,1); acx2=zeros(N,1); actheta=zeros(N,1);
lambda1 =zeros(N,1); lambda2=zeros(N,1); lambda3=zeros(N,1); par=zeros(N,1);

%iteramos para representar el mecanismo
%secuencia_theta=load('nombre.txt');
secuencia_theta=linspace(0,2*pi,N);
for i=1:length(secuencia_theta),
    th = secuencia_theta(i);
    q(4)=th;
    ti = th / (2*pi*params.omega); % tiempo
    params.t = ti;
    q = ProbPosicion(q,params);
    v = probvelocidad(q,params);
    %a = probaceleracion(v,q,params);
    J = jacob(q,params);
    Jd = jacobderivado(v,q,params);
    [a, lambda] = probDinamico(q,v,params,J,Jd);
        %Al llamar a esta funcion obtenemos el vector que nos dar� las
        %aceleraciones para poder compararlo con lo que obtenemos en el
        %cinematico y ademas el par con lambda
    
    if (haz_dibujo)
        cla
        Dibujomecanismo(q,params)
        title('Simulacion cinematica')
        drawnow
    end
    x1(i)=q(1); y1(i)=q(2); x2(i)=q(3); theta(i)=q(4); t(i)=(i-1)*At;
    Vx2(i)=v(3);
    
    %Para la dinamica par habra que sacar que sacar tambien las lambdas
    %para poder plotearlas
    %ya tenemos que a es una matriz de 4x1 y lambda igual
    
    acx1(i) = a(1) ; acy1(i)= a(2) ; acx2(i)= a(3) ; actheta(i) = a(4);
    lambda1(i) = lambda(1);lambda2(i) = lambda(2); lambda3(i) = lambda(3);
    parmalo(i) = lambda(4);
    
    par (i) = parmalo(i)/(100^2); %esto lo hacemos para tener el par en N.m ya que hemos
    %introducido kg, cm y s2, para pasar kg.cm/s^2 a N dividimos por 100 y
    %para pasar el otro cm a m volvemos a dividir por 100
    
end
% % Hacemos una grafica doble con la evolucion de las coordenadas del punto 1
% figure;
% plot(t,x1,t,y1,t,theta);
% legend('x_1 (cm)','y_1 (cm)','theta (rad)');
% xlabel('t (s)'); ylabel('pos (m)');
% title('Evolucion de las coordenadas del punto 1')
% % Hacemos una gráfica doble con la evolucion de las coordenadas del punto 2
% figure;
% plot(rad2deg(secuencia_theta),x2);
% legend('x_2');
% xlabel('th (deg)'); ylabel('pos (cm)');
% title('Evolucion de las coordenadas del punto 2')
% % Escribimos los vectores finales
% fprintf('En el instante final,\n')
% fprintf('x1=%f cm, y1=%f cm, x2=%f cm, theta=%f cm\n',q(1),q(2),q(3),q(4))
% fprintf('vx1=%f cm/s, vy1=%f cm/s, vx2=%f cm/s, omega=%f cm/s\n',v(1),v(2),v(3),v(4))
% fprintf('ax1=%f cm/s2, ay1=%f cm/s2, ax2=%f cm/s2, alpha=%f cm/s2\n',a(1),a(2),a(3),a(4))
% 
% 
% %Vamos a realizar las graficas necesarias
% 
% %En este caso tenemos la velocidaddex2/omega frente a theta
% figure;
% plot(rad2deg(secuencia_theta),(Vx2/params.omega));
% legend('Vx_2/w');
% xlabel('th (deg)'); ylabel('Vx2/w (cm)');
% title('Velocidad del punto 2/ omega frente a theta')
% 
% figure;
% plot(rad2deg(secuencia_theta),(abs(Vx2)/params.omega));
% legend('Vx_2/w');
% xlabel('th (deg)'); ylabel('Vx2/w (cm)');
% title('Valor absoluto de la Velocidad del punto 2/ omega frente a theta')
% 
% 
% 
% %theta frente al tiempo
% figure;
% plot(t,theta);
% legend('theta/w');
% xlabel('t(s)'); ylabel('theta(rad)');
% title('theta frente al tiempo')

end 
