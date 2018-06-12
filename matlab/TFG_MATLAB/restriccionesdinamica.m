function[phi]=restriccionesdinamica(q,params)
%Se definen las coordenadas. 
x1=q(1);
y1=q(2);
x2=q(3);
theta=q(4);
omega = params.omega;

%Se definen las coordenas que no varían con el tiempo
xA=0;
yA=0;
%Se crea el vector de restricciones haciendo uso de las ecuaciones
%de solido rigido, otra para el giro del motor y la ultima se añade para la
%realizacion del problema dinamico inverso
phi(1,1)=(xA-x1)^2+(yA-y1)^2-params.L1^2;
phi(2,1)=(x1-x2)^2+(y1-params.y2)^2-params.L2^2;
if (abs(sin(theta))>0.9)
    phi(3,1)=x1-xA-params.L1*cos(theta);
else
    phi(3,1)=y1-yA-params.L1*sin(theta);
end    
phi(4,1)=theta - 2*pi*omega*params.t;



