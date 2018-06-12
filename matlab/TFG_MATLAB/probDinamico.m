function [a, lambda] = probDinamico(q,v,params,J,Jd)

%Se tiene que crear la matriz A y la matriz B
Me = matrizmasas();
Q = zeros(4,1); 
phitderivado=jacobtderivado();
%la matriz Q es el vector de fuerzas generalizadas, que es nulo ya que no
%actuan fuerzas exteriores debido a que el mecanismo se halla en el plano
%horizontal y por tanto el peso no actúa

A = [Me,J';J,zeros(4,4)];
B=[Q;-(Jd*v)-phitderivado]; 

X=A\B;
a=[X(1,1);X(2,1);X(3,1);X(4,1)];
lambda=[X(5,1);X(6,1);X(7,1);X(8,1)];
end
