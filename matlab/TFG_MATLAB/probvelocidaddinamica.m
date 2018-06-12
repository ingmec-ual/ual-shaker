function [ v ] = probvelocidaddinamica(q, params)
%Se definen las coordenadas generalizadas
x1=q(1);
y1=q(2);
x2=q(3);
theta=q(4);

%Se defininen las coordenadas que no var�an con el tiempo
xA=0;
yA=0;
%Se llaman a las funciones de las restricciones y el jacobiano pues
%son necesarias para el c�lculo de la velocidad. En este caso no hace falta
%a�adir una fila para introducir el dato conocido de velocidad.
J=jacobdinamica(q,params);
Q=phit(params);
v=J\[-Q'];
end
