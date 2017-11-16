function[phi]=restricciones(q)
%definimos las coordenadas naturales y relativas, que tenemos dos, ya que
%una será nuestra incógnita y otra es un dato dado en el enunciado. 
x1=q(1);
y1=q(2);
x2=q(3);
theta=q(4);

%definimos las coordenas que no varían con el tiempo
xA=0;
yA=0;
y2=0;
%creamos nuestro vector de restricciones haciendo uso de las ecuaciones
%para dos puntos de una misma barra y las de ecuaciones de ángulos de las
%coordenadas relativas
phi(1,1)=(xA-x1)^2+(yA-y1)^2-5^2;
phi(2,1)=(x1-x2)^2+(y1-y2)^2-10^2;
if (abs(sin(theta))>0.7)
    phi(3,1)=x1-xA-5*cos(theta);
else
    phi(3,1)=y1-yA-5*sin(theta);
end


