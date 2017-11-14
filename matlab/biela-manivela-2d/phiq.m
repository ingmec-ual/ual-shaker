% Calcula la matriz jacobiana
function jac = phiq (q,L1,L2)

%Inicializa a cero la matriz jacobiana
jac=zeros(3,4);
%Extrae las coordenadas
x1=q(1); y1=q(2); x2=q(3); theta=q(4);
xA=0; yA=0; y2=0;
%Monta la matriz jacobiana

jac(1,1)= -2*(xA-x1) ; jac(1,2)= -2*(yA-y1);
jac(1,3)= 0 ; jac(1,4)= 0 ;
jac(2,1)=2*(x1-x2) ; jac(2,2)=-2*(y2-y1);
jac(2,3)= 2*(x2-x1) ; jac(2,4)= 0;


if (abs (tan(theta))> 0.17) %viene de hacer la tangente de pi/18, es decir 10 grados
  jac(3,:)=[ 1 0 0 L1*sin(theta)];
else
  jac(3,:)=[ 0 1 0 -L1*cos(theta)];
end
