%Programa principal
%Limpia la memoria
clear;
%Inicializa variables q, qp (=q_prima) y qpp (=q_segunda)

q=zeros(4,1); qp=zeros(4,1); qpp=zeros(4,1);
%Valor inicial de las coordenadas x1, y1, x2, theta
L1=5; L2=10; %Para probar 
q(1)=-L1; q(2)=0; q(3)=-L1-L2; q(4)=pi; 
%Establece el numero de incrementos para 360o o 1 seg
numIncr=500;
%Inicializa las variables q(t), q_prima(t) y q_segunda(t)
q_t =zeros(4,numIncr+1);
qp_t =zeros(4,numIncr+1);
qpp_t =zeros(4,numIncr+1);
%Crea la figura que contendra la animacion
fig1=figure(1);
hold on;
axis([-L1-L2-2,2,-L1-2,L1+2]); %Establece los lmites [xmin,xmax,ymin,ymax]
axis manual; %Congela los limites anteriores
axis off %Elimina el dibujo de los ejes
%Bucle de animacion

for i=0:numIncr
angDato=2*pi*(i/numIncr);
q = ProbPosicion (q,L1,L2);
qp = ProbVelocidad (q);
qpp = ProbAceleracion (q);
DibujaMecanismo;
%Almacena informacion
q_t (:,i+1)=q;
qp_t (:,i+1)=qp;
qpp_t(:,i+1)=qpp;
end
%Crea la figura con los plots del punto 3
fig2=figure(2);
%Plot de x3, y3

%subplot(3,2,1); plot(q_t(4,:),q_t(5,:)); xlabel('\xi'); ylabel('x3');
%subplot(3,2,2); plot(q_t(4,:),q_t(6,:)); xlabel('\xi'); ylabel('y3');
%Plot de x3_prima, y3_prima
%subplot(3,2,3); plot(q_t(4,:),qp_t(5,:)); xlabel('\xi'); ylabel('xp3');
%subplot(3,2,4); plot(q_t(4,:),qp_t(6,:)); xlabel('\xi'); ylabel('yp3');
%Plot de x3_segunda, y3_segunda
%subplot(3,2,5); plot(q_t(4,:),qpp_t(5,:)); xlabel('\xi'); ylabel('xpp3');
%subplot(3,2,6); plot(q_t(4,:),qpp_t(6,:)); xlabel('\xi'); ylabel('ypp3');
