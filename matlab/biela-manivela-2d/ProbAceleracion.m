function [a] = probaceleracion(v,q)
%Llamamos a las distintas funciones que nos serán necesarias para el cáculo
%del vector de velocidades
Jd=jacobderivado(v,q);
J=jacob(q);
%Añadimos a la matriz jacobiana una fila formada por ceros y un uno. Esta
%fila hará que cuadren las matrices para su posterior producto y nos dará 
%como resultado el valor que añadimos de la aceleracion angular conocida
J3=[J;0 0 0 1];
%Hacemos el producto de la derivada de la matriz jacobiana respecto al
%tiempo y el vector de velocidades
t=Jd*v;
%Añadimos a este producto el valor del dato conocido de aceleración, que en
%este caso es 0 ya que la velocidad angular de AB es constante
t1=[t;0];
%por último hacemos el producto del vector calculado y la inversa del
%jacobiano con la fila añadida anteriormente para obtener el vector de
%velocidades
a=J3\(-t1);
end

