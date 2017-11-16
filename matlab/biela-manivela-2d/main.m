clear; close all; clc;
% Introducimos las coordenadas iniciales del vector posici�n
x1 = -5/2;
y1 = 5*sqrt(3)/2;
x2 = -(5+5*sqrt(13))/2;
y2=0;
theta = 2*pi/3;

% Formamos el vector de coordenadas generalizadas
q = [x1; y1; x2; theta];

% Hacemos los problemas de velocidad y aceleracion iniciales
v = probvelocidad(q);
a = probaceleracion(v,q);
% % Escribimos los resultados
% fprintf('En el instante inicial:\n')
% fprintf('Vector posici�n inicial:\n x1=%f, y1=%f, x2=%f, theta=%f\n',q(1),q(2),q(3),q(4))
% fprintf('Vector velocidad inicial:\n vx1=%f, vy1=%f, vx2=%f, omega=%f\n',v(1),v(2),v(3),v(4))
% fprintf('Vector aceleraci�n inicial:\n ax1=%f, ay1=%f, ax2=%f, alpha=%f\n',a(1),a(2),a(3),a(4))



% Para la simulaci�n cinem�tica, definimos como antes el tiempo=0,005 s
figure
xlim([-20,10])
ylim([-20,10])
At = 0.005;
% inicializamos un vector columna de las coordenadas que var�an
x1=zeros(100,1); y1=zeros(100,1); x2=zeros(100,1); theta=zeros(100,1); t=zeros(100,1);
%iteramos para representar el mecanismo
% secuencia_theta=load('nombre.txt');
for i=1:1000
q(4)=q(4) + v(4)*At; 
% q(4)=secuencia_theta(i); 
q = ProbPosicion(q);
v = probvelocidad(q);
a = probaceleracion(v,q);
cla
Dibujomecanismo(q)
title('Simulaci�n cinem�tica')
drawnow
x1(i)=q(1); y1(i)=q(2); x2(i)=q(3); theta(i)=q(4); t(i)=(i-1)*At;
end
% Hacemos una gr�fica doble con la evolucion de las coordenadas del punto 1
figure;
plot(t,x1,t,y1,t,theta);
legend('x_1','y_1','theta');
xlabel('t (s)'); ylabel('pos (m)');
title('Evolucion de las coordenadas del punto 1')
% Hacemos una gr�fica doble con la evolucion de las coordenadas del punto 2
figure;
plot(t,x2);
legend('x_2');
xlabel('t (s)'); ylabel('pos (m)');
title('Evolucion de las coordenadas del punto 2')
% Escribimos los vectores finales
fprintf('En el instante final,\n')
fprintf('x1=%f, y1=%f, x2=%f, theta=%f\n',q(1),q(2),q(3),q(4))
fprintf('vx1=%f, vy1=%f, vx2=%f, omega=%f\n',v(1),v(2),v(3),v(4))
fprintf('ax1=%f, ay1=%f, ax2=%f, alpha=%f\n',a(1),a(2),a(3),a(4))
