function [ J ] = jacob(q)
%definimos las coordenadas generalizadas
x1=q(1);
y1=q(2);
x2=q(3);
theta=q(4);

%definimos las coordenas que no varían con el tiempo
xA=0;
yA=0;
y2=0;
%creamos el jacobiano, siendo este la matriz formada por las derivadas
%parciales de las ecuaciones de restricción respecto a cada una de las
%coordenadas del vector q

J(1,1)=-2*(xA-x1);
J(1,2)=-2*(yA-y1);
J(1,3)=0;
J(1,4)=0;
J(2,1)=2*(x1-x2);
J(2,2)=2*(y1-y2);
J(2,3)=-2*(x1-x2);
J(2,4)=0;
J(3,3)=0;

if (abs(sin(theta))>0.7)
    J(3,1)=1;
    J(3,2)=0;
    J(3,4)=5*sin(theta);

else
    J(3,1)=0;
    J(3,2)=1;
    J(3,4)=-5*cos(theta);


end

