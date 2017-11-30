function [Vx2,theta,x2,params] = main(L1,L2,y2,haz_dibujo)

%clear; close all; clc;

% Si queremos ver la simuación cinemática del mecanismo debemos introducir
% haz_dibujo=1;
% haz_dibujo = 0;

% parametros fijos del mecanismo
params = struct();
params.L1 = L1; % cm
params.L2 = L2; % cm
params.y2=y2;
params.omega = 1; % rad/s
params.alpha = 0; % rad/s^2

% Introducimos las coordenadas iniciales del vector posición (valores
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
% % Escribimos los resultados
% fprintf('En el instante inicial:\n')
% fprintf('Vector posición inicial:\n x1=%f, y1=%f, x2=%f, theta=%f\n',q(1),q(2),q(3),q(4))
% fprintf('Vector velocidad inicial:\n vx1=%f, vy1=%f, vx2=%f, omega=%f\n',v(1),v(2),v(3),v(4))
% fprintf('Vector aceleración inicial:\n ax1=%f, ay1=%f, ax2=%f, alpha=%f\n',a(1),a(2),a(3),a(4))



% Para la simulación cinemática, definimos como antes el tiempo=0,005 s
if (haz_dibujo)
    figure
    xlim([-20,10])
    ylim([-20,10])
    grid minor;
end
At = 0.005;
% inicializamos un vector columna de las coordenadas que varían
N = 250;
x1=zeros(N,1); y1=zeros(N,1); x2=zeros(N,1); theta=zeros(N,1); t=zeros(N,1);

Vx2=zeros(N,1); %Creamos la matriz de tendrá las velocidades del punto 2


%iteramos para representar el mecanismo
%secuencia_theta=load('nombre.txt');
secuencia_theta=linspace(0,2*pi,N);
for i=1:length(secuencia_theta),
    th = secuencia_theta(i);
    q(4)=th;
    q = ProbPosicion(q,params);
    v = probvelocidad(q,params);
    %a = probaceleracion(v,q,params);
    if (haz_dibujo)
        cla
        Dibujomecanismo(q,params)
        title('Simulacion cinematica')
        drawnow
    end
    x1(i)=q(1); y1(i)=q(2); x2(i)=q(3); theta(i)=q(4); t(i)=(i-1)*At;
    Vx2(i)=v(3);
end
% % Hacemos una gráfica doble con la evolucion de las coordenadas del punto 1
% figure;
% plot(t,x1,t,y1,t,theta);
% legend('x_1','y_1','theta');
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
% fprintf('x1=%f, y1=%f, x2=%f, theta=%f\n',q(1),q(2),q(3),q(4))
% fprintf('vx1=%f, vy1=%f, vx2=%f, omega=%f\n',v(1),v(2),v(3),v(4))
% fprintf('ax1=%f, ay1=%f, ax2=%f, alpha=%f\n',a(1),a(2),a(3),a(4))
% 
% 
% %Vamos a realizar las gráficas necesarias
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
