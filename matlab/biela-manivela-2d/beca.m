%Lo que vamos a hacer es coger el máximo de la curva Vx2/w y le ponemos un porcentaje (que
% también será dato de entrada) de ese máximo y vemos que rango de ángulo tenemos, para luego ir
%a la gráfica de posición del punto x2 para ver el margen de recorrido.
%Para poder buscar así que valores de L1 y L2 dan el mayor rango de
%movimiento

%OJO TAMBIÉN HAY QUE HACER QUE LAS GR�?FICAS ESTÉN EN FUNCIÓN DEL TAMAÑO DE
%L1 Y L2, por que de ser más grandes que para 5 y 10 no se ven.

%¿Como hago para ver el valor de las variales x1,x2,...? ¿No salen en el workspace
% por que main ahora es una función?  -> HAY QUE ESCRIBIRLAS EN MAIN
% function [loquesea] y en beca en la llamada a main.

%¿Aquí iría el doble bucle for para poder determinar los valores óptimos de L1 y L2?
% De momento si escribimos el valor de L1 y L2 en el comand windows y
% llamamos a 'beca' obtenemos como antes los resultados y las gráficas.
clear, clc, close all

%¿Ponemos el valor de siempre para la primera iteración?
porcentaje = 10; %Si queremos cambiar el porcentaje mejor cambiarlo aquí y ya está

L1s = 5:2:10;
L2s = 7:2:15;

Deltax2_all = zeros(length(L1s),length(L2s));

for L1i = 1:length(L1s),
    for L2k = 1:length(L2s),
        
        L1=L1s(L1i);
        L2=L2s(L2k);

        [Vx2,theta,x2,params]=main(L1,L2,0);

             

            % TODO: Porcentaje wrt max.
            [imin, imax] = estabilidad (Vx2/params.omega, 1-0.01*porcentaje);
            liminf = theta(imin);
            limsup = theta(imax);
            
            liminf = wrapTo2Pi(angulomax - porcentaje*angulomax/100);
            limsup = wrapTo2Pi(angulomax + porcentaje*angulomax/100);

            %El rango deseado es:
            %Pasamos a grados
            liminf = liminf*180/pi;
            limsup = limsup*180/pi;
%             fprintf('El rango de ángulos deseado es:,\n')
%             fprintf('[%f,%f]\n',liminf,limsup)
            liminf = round (liminf);
            limsup = round (limsup);
            x2min = x2(liminf);
            x2max = x2(limsup);
%             fprintf('El rango de movimientos del punto 2 es:\n')
%             fprintf('[%f,%f]\n',x2min,x2max)
            Deltax2max = x2max - x2min;
            Deltax2max = abs(Deltax2max);
            Deltax2_all(L1i,L2k) = Deltax2max;
%             Deltax2maxmax = 0;
%                 if (Deltax2max > Deltax2maxmax)
%                     Deltax2maxmax = Deltax2max;
% %                        fprintf('El Desplazamiento max obtenido es:')
% %                        fprintf('%f\n',Deltax2maxmax)
% %                        fprintf('Para las longitudes:\n')
                        fprintf('L1 = %f  L2 = %f => Dx=%f \n',L1,L2,Deltax2max);
%                 end
    end
end

    surf(L2s,L1s,Deltax2_all);
    xlabel('L1');
    ylabel('L2');
   
   %¿qué es lo que realente queremos? ¿que la zona estable sea lo más grande 
   %y plana posible? y a partir de ahí obtener L1 y L2.


