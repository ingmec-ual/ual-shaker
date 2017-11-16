
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
Q=restricciones(q,params);
%añadimos a nuestra matriz jacobiana una fila, que hará que cuadren las
%matrices para hacer el producto. Esta fila es de ceros menos el último
%número que es un 1 para dar como resultado el valor de la velocidad
%angular que nos da el enunciado como dato y que introducimos en
%el vector de restricciones (-4 rad/s, negativa porque es en sentido
%antihorario)
J2 = [J;0 0 0 1];
%Finalmente calculamos el vector de velocidades como el producto de la
%inversa del jacobiano con la fila añadida y el vector de restricciones con
%el dato conocido de velocidad
v=J2\[Q;params.omega];
end

