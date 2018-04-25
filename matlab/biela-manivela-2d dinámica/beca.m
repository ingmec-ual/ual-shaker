%Lo que vamos a hacer es coger el maximo de la curva Vx2/w y le ponemos un porcentaje (que
% tambien sera dato de entrada) de ese maximo y vemos que rango de angulo tenemos, para luego ir
%a la grafica de posicion del punto x2 para ver el margen de recorrido.
%Para poder buscar asi­ que valores de L1 y L2 dan el mayor rango de
%movimiento

%OJO TAMBIEN HAY QUE HACER QUE LAS GRAFICAS ESTEN EN FUNCION DEL TAMANIO DE
%L1 Y L2, por que de ser mas grandes que para 5 y 10 no se ven.
clear, clc, close all

porcentaje = 5; %Si queremos cambiar el porcentaje mejor cambiarlo aqui­ y ya esta

y2=0;

%Para el caso en el que estamos ya en dinámica y nos vamos a quedar con una
%barra en concreto

L1s = 4:1:4;
L2s = 7:1:7;

Deltax2_all = zeros(length(L1s),length(L2s));

for L1i = 1:length(L1s),
    for L2k = 1:length(L2s),
        
        L1=L1s(L1i);
        L2=L2s(L2k);

        [Vx2,theta,x2,params,ax1,ax2]=main(L1,L2,y2,1);

            % TODO: Porcentaje wrt max.
            [imin, imax] = estabilidad (Vx2/params.omega, 1-0.01*porcentaje);

            x2min = x2(imin);
            x2max = x2(imax);
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
            
             thetamin = theta (imin);
             thetamax = theta (imax);
             thetamin = thetamin*180/pi;
             thetamax = thetamax*180/pi;
             fprintf('Se movera en el rango de angulos: [%f,%f]\n',thetamin,thetamax);
    end
end

[theta,par] = calculodepar(params);
figure
plot(theta,Vx2)
legend('Vx_2');
xlabel('theta (rad)'); ylabel('Velocidad (cm/s)');
title('Velocidad del punto 2')




%     surf(L2s,L1s,Deltax2_all);
%     xlabel('L2');
%     ylabel('L1');
   
