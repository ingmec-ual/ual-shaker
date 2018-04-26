function [Vx2,theta,x2,params,par,acx1,acy1,acx2,actheta] = main(L1,L2,y2,haz_dibujo,dinamica)

% parametros fijos del mecanismo
params = struct();
params.L1 = L1; % cm
params.L2 = L2; % cm
params.y2=y2; % cm
params.omega = 5; % rad/s
params.alpha = 0; % rad/s^2


params.t = 0.005; %inicializamos

% Introducimos las coordenadas iniciales del vector posicion (valores
% aleatorios aunque elegidos con cierto criterio)

x1 = params.L1;
y1 = params.L1*0.05;
x2 = params.L1-params.L2;
theta = 0;

%Aqu� metemos un if, para que haga si vale 1, el problema de din�mica
%utilizando restriccionesdinamica y si vale 0 cuando llame utilice los que
%restricciones

if (dinamica = 0)

% Formamos el vector de coordenadas generalizadas
q = [x1; y1; x2; theta];

% Hacemos los problemas de velocidad y aceleracion iniciales
v = probvelocidad(q,params);
a = probaceleracion(v,q,params);
% Escribimos los resultados
fprintf('En el instante inicial:\n')
fprintf('Vector posicion inicial:\n x1=%f cm, y1=%f cm, x2=%f cm, theta=%f cm\n',q(1),q(2),q(3),q(4))
fprintf('Vector velocidad inicial:\n vx1=%f cm/s, vy1=%f cm/s, vx2=%f cm/s, omega=%f cm/s\n',v(1),v(2),v(3),v(4))
fprintf('Vector aceleracion inicial:\n ax1=%f cm/s2, ay1=%f cm/s2, ax2=%f cm/s2, alpha=%f cm/s2\n',a(1),a(2),a(3),a(4))



% Para la simulacion cinematica, definimos como antes el tiempo=0,005 s
if (haz_dibujo)
    figure
    xlim([-12,6])
    ylim([-10,10])
    grid minor;
end
At = 0.005;
% inicializamos un vector columna de las coordenadas que varían
N = 360;
x1=zeros(N,1); y1=zeros(N,1); x2=zeros(N,1); theta=zeros(N,1); t=zeros(N,1);
ax1=zeros(N,1); ax2=zeros(N,1);
Vx2=zeros(N,1); %Creamos la matriz de tendrá las velocidades del punto 2


%iteramos para representar el mecanismo
%secuencia_theta=load('nombre.txt');
secuencia_theta=linspace(0,2*pi,N);
for i=1:length(secuencia_theta),
    th = secuencia_theta(i);
    q(4)=th;
    q = ProbPosicion(q,params);
    v = probvelocidad(q,params);
    a = probaceleracion(v,q,params);
    if (haz_dibujo)
        cla
        Dibujomecanismo(q,params)
        title('Simulaci�n cinem�tica')
        drawnow
    end
    %pause
    x1(i)=q(1); y1(i)=q(2); x2(i)=q(3); theta(i)=q(4); t(i)=(i-1)*At;
    Vx2(i)=v(3); Vx1(i)=v(1); Vy1(i)=v(2);
    ax1(i) = a(1); ax2(i) = a(3); ay1(i) = a(2);
    
end
% Hacemos una grafica doble con la evolucion de las coordenadas del punto 1
figure;
plot(theta,x1,theta,y1);
legend('x_1 (cm)','y_1 (cm)');
xlabel('theta (rad)'); ylabel('pos (cm)');
title('Evoluci�n de las coordenadas del punto 1')

% Hacemos una gráfica doble con la evolucion de las coordenadas del punto 2
figure;
plot(theta,x2); %rad2deg(secuencia_theta)
legend('x_2 (cm)');
xlabel('theta (rad)'); ylabel('pos (cm)');
title('Evoluci�n de las coordenadas del punto 2')

figure;
plot(theta,Vx1,theta,Vy1); %rad2deg(secuencia_theta)
legend('Vx_1','Vy_1');
xlabel('theta (rad)'); ylabel('Velocidad (cm/s)');
title('Velocidad del punto 1')

figure
plot(theta,ax1,theta,ay1)
legend('ax_1','ay_1');
xlabel('theta (rad)'); ylabel('aceleraci�n (cm/s^2)');
title('Aceleraci�n del punto 1')

figure
plot(theta,ax2)
legend('ax_2');
xlabel('theta (rad)'); ylabel('aceleraci�n (cm/s^2)');
title('Aceleraci�n del punto 2')

% Escribimos los vectores finales
fprintf('En el instante final,\n')
fprintf('x1=%f cm, y1=%f cm, x2=%f cm, theta=%f cm\n',q(1),q(2),q(3),q(4))
fprintf('vx1=%f cm/s, vy1=%f cm/s, vx2=%f cm/s, omega=%f cm/s\n',v(1),v(2),v(3),v(4))
fprintf('ax1=%f cm/s2, ay1=%f cm/s2, ax2=%f cm/s2, alpha=%f cm/s2\n',a(1),a(2),a(3),a(4))


%Vamos a realizar las graficas necesarias

%En este caso tenemos la velocidaddex2/omega frente a theta
figure;
plot(rad2deg(secuencia_theta),(Vx2/params.omega));
legend('Vx_2/w');
xlabel('th (deg)'); ylabel('Vx2/w (cm)');
title('Velocidad del punto 2/ omega frente a theta')

figure;
plot(rad2deg(secuencia_theta),(abs(Vx2)/params.omega));
legend('Vx_2/w');
xlabel('th (deg)'); ylabel('Vx2/w (cm)');
title('Valor absoluto de la Velocidad del punto 2/ omega frente a theta')



%theta frente al tiempo
figure;
plot(t,theta);
legend('theta/w');
xlabel('t(s)'); ylabel('theta(rad)');
title('theta frente al tiempo')


else
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



end %fin del if



end %fin de main
