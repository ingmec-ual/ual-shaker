function [ v ] = probvelocidad(q, params)
%Se definen las coordenadas generalizadas
x1=q(1);
y1=q(2);
x2=q(3);
theta=q(4);

%Se defininen las coordenadas que no var�an con el tiempo
xA=0;
yA=0;
%Se llaman a las funciones de las restricciones y el jacobiano pues
%son necesarias para el c�lculo de la velocidad
J=jacob(q,params);
Q=restricciones(q,params);
%Se a�aden a la matriz jacobiana una fila, que contendra la
%informacion del dato de entrada de velocidad angular constante de giro del motor
%de 5 rad/s (en este caso)
J2 = [J;0 0 0 1];
%Se obtiene el vector de velocidades como el producto de la
%inversa del jacobiano con la fila a�adida y el vector de restricciones con
%el dato conocido de velocidad
v=J2\[Q;params.omega];
end

