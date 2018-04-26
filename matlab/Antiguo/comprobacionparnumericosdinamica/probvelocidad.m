
function [ v ] = probvelocidad(q, params)
%definimos las coordenadas generalizadas
x1=q(1);
y1=q(2);
x2=q(3);
theta=q(4);

%definimos las coordenadas que no varían con el tiempo
xA=0;
yA=0;
%Llamamos a las funciones de las restricciones y el jacobiano pues nos
%hacen falta para el cálculo de la velocidad
J=jacob(q,params);
Q=phit(params);
v=J\[-Q'];
end

