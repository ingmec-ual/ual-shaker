%Lo que vamos a hacer es coger el m�ximo de la curva Vx2/w y le ponemos un porcentaje (que
% tambi�n ser� dato de entrada) de ese m�ximo y vemos que rango de �ngulo tenemos, para luego ir
%a la gr�fica de posici�n del punto x2 para ver el margen de recorrido.
%Para poder buscar as� que valores de L1 y L2 dan el mayor rango de
%movimiento

%OJO TAMBI�N HAY QUE HACER QUE LAS GR�FICAS EST�N EN FUNCI�N DEL TAMA�O DE
%L1 Y L2, por que de ser m�s grandes que para 5 y 10 no se ven.

%�Como hago para ver el valor de las variales x1,x2,...? �No salen en el workspace
% por que main ahora es una funci�n?  -> HAY QUE ESCRIBIRLAS EN MAIN
% function [loquesea] y en beca en la llamada a main.

%�Aqu� ir�a el doble bucle for para poder determinar los valores �ptimos de L1 y L2?
% De momento si escribimos el valor de L1 y L2 en el comand windows y
% llamamos a 'beca' obtenemos como antes los resultados y las gr�ficas.
clear, clc, close all

%�Ponemos el valor de siempre para la primera iteraci�n?

L1=5; L2=10;

[Vx2,theta,x2,params]=main(L1,L2);

    [xm,im]=max(Vx2/params.omega); 
    angulomax = theta(im);
    porcentaje = 5; %Si queremos cambiar el porcentaje mejor cambiarlo aqu� y ya est�

    liminf = angulomax - porcentaje*angulomax/100;
    limsup = angulomax + porcentaje*angulomax/100;

    %El rango deseado es:
    %Pasamos a grados
    liminf = liminf*180/pi;
    limsup = limsup*180/pi;
    fprintf('El rango de �ngulos deseado es:,\n')
    fprintf('[%f,%f]\n',liminf,limsup)
    liminf = round (liminf);
    limsup = round (limsup);
    x2min = x2(liminf);
    x2max = x2(limsup);
    fprintf('El rango de movimientos del punto 2 es:\n')
    fprintf('[%f,%f]\n',x2min,x2max)

  
   %Todo esto dentro del doble bucle for
   
   %�qu� es lo que realente queremos? �que la zona estable sea lo m�s grande 
   %y plana posible? y a partir de ah� obtener L1 y L2.



