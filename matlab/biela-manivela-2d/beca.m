%Lo que vamos a hacer es coger el mÃ¡ximo de la curva Vx2/w y le ponemos un porcentaje (que
% tambiÃ©n serÃ¡ dato de entrada) de ese mÃ¡ximo y vemos que rango de Ã¡ngulo tenemos, para luego ir
%a la grÃ¡fica de posiciÃ³n del punto x2 para ver el margen de recorrido.
%Para poder buscar asÃ­ que valores de L1 y L2 dan el mayor rango de
%movimiento

%OJO TAMBIÃ‰N HAY QUE HACER QUE LAS GRÃ?FICAS ESTÃ‰N EN FUNCIÃ“N DEL TAMAÃ‘O DE
%L1 Y L2, por que de ser mÃ¡s grandes que para 5 y 10 no se ven.

%Â¿Como hago para ver el valor de las variales x1,x2,...? Â¿No salen en el workspace
% por que main ahora es una funciÃ³n?  -> HAY QUE ESCRIBIRLAS EN MAIN
% function [loquesea] y en beca en la llamada a main.

%Â¿AquÃ­ irÃ­a el doble bucle for para poder determinar los valores Ã³ptimos de L1 y L2?
% De momento si escribimos el valor de L1 y L2 en el comand windows y
% llamamos a 'beca' obtenemos como antes los resultados y las grÃ¡ficas.
clear, clc, close all

%Â¿Ponemos el valor de siempre para la primera iteraciÃ³n?
porcentaje = 10; %Si queremos cambiar el porcentaje mejor cambiarlo aquÃ­ y ya estÃ¡

L1s = 10:1:10;
L2s = 20:1:20;

Deltax2_all = zeros(length(L1s),length(L2s));

for L1i = 1:length(L1s),
    for L2k = 1:length(L2s),
        
        L1=L1s(L1i);
        L2=L2s(L2k);

        [Vx2,theta,x2,params]=main(L1,L2,1);

             

            % TODO: Porcentaje wrt max.
            [imin, imax] = estabilidad (Vx2/params.omega, 1-0.01*porcentaje);
            liminf = theta(imin);
            limsup = theta(imax);
            
%             liminf = wrapTo2Pi(angulomax - porcentaje*angulomax/100);
%             limsup = wrapTo2Pi(angulomax + porcentaje*angulomax/100);

            %El rango deseado es:
            %Pasamos a grados
            liminf = liminf*180/pi;
            limsup = limsup*180/pi;
%             fprintf('El rango de Ã¡ngulos deseado es:,\n')
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

%     surf(L2s,L1s,Deltax2_all);
%     xlabel('L1');
%     ylabel('L2');
   
   %Â¿quÃ© es lo que realente queremos? Â¿que la zona estable sea lo mÃ¡s grande 
   %y plana posible? y a partir de ahÃ­ obtener L1 y L2.

