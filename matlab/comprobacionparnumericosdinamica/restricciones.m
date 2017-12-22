function[phi]=restricciones(q,params)
%definimos las coordenadas naturales y relativas, que tenemos dos, ya que
%una será nuestra incógnita y otra es un dato dado en el enunciado. 
x1=q(1);
y1=q(2);
x2=q(3);
theta=q(4);
omega = params.omega;

%definimos las coordenas que no varían con el tiempo
xA=0;
yA=0;
%creamos nuestro vector de restricciones haciendo uso de las ecuaciones
%para dos puntos de una misma barra y las de ecuaciones de ángulos de las
%coordenadas relativas
phi(1,1)=(xA-x1)^2+(yA-y1)^2-params.L1^2;
phi(2,1)=(x1-x2)^2+(y1-params.y2)^2-params.L2^2;
if (abs(sin(theta))>0.9)
    phi(3,1)=x1-xA-params.L1*cos(theta);
else
    phi(3,1)=y1-yA-params.L1*sin(theta);
    
phi(4,1)=theta - 2*pi*omega*params.t;
end


