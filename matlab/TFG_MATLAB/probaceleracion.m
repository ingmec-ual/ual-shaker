function [a] = probaceleracion(v,q,params)
%Se llaman a las distintas funciones que nos ser�n necesarias
Jd=jacobderivado(v,q,params);
J=jacob(q,params);
%Se a�ade a la matriz jacobiana una fila formada por ceros y un uno. Al
%igual que se hizo para el problema de velocidad. Si se tenia un giro a
%velocidad constante del motor, la aceleracion angular sera cero.
J3=[J;0 0 0 1];
%Se hace el producto de la derivada de la matriz jacobiana respecto al
%tiempo y el vector de velocidades
t=Jd*v;
%Se a�ade a este producto el valor del dato conocido de aceleraci�n
t1=[t;params.alpha];
%por �ltimo se realiza el producto del vector calculado y la inversa del
%jacobiano con la fila a�adida anteriormente para obtener el vector de
%velocidades
a=J3\(-t1);
end

