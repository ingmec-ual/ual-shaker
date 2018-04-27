function [] = Resolver (L1s,L2s,graficabarras,dinamica,graficascinematica)
%Lo que vamos a hacer es coger el maximo de la curva Vx2/w y le ponemos un porcentaje (que
% tambien sera dato de entrada) de ese maximo y vemos que rango de angulo tenemos, para luego ir
%a la grafica de posicion del punto x2 para ver el margen de recorrido.
%Para poder buscar asi­ que valores de L1 y L2 dan el mayor rango de
%movimiento

porcentaje = 5; %Si queremos cambiar el porcentaje mejor cambiarlo aqui­ y ya esta
y2=0;


Deltax2_all = zeros(length(L1s),length(L2s));

for L1i = 1:length(L1s)
    for L2k = 1:length(L2s)
        
        L1=L1s(L1i);
        L2=L2s(L2k);
        
        if (dinamica == 0)  %LLamamos al antiguo main que no usa dinamica

        [Vx2,theta,x2,params]=main(L1,L2,y2,0,graficascinematica);
            
            
            % TODO: Porcentaje wrt max.
            [imin, imax] = estabilidad (Vx2/params.omega, 1-0.01*porcentaje);

            x2min = x2(imin);
            x2max = x2(imax);
            Deltax2max = x2max - x2min;
            Deltax2max = abs(Deltax2max);
            Deltax2_all(L1i,L2k) = Deltax2max;
            fprintf('L1 = %f  L2 = %f => Dx=%f \n',L1,L2,Deltax2max);
            
             thetamin = theta (imin);
             thetamax = theta (imax);
             thetamin = thetamin*180/pi;
             thetamax = thetamax*180/pi;
             fprintf('Se movera en el rango de angulos: [%f,%f]\n',thetamin,thetamax);
             
             
             else %llamamos al main de dinamica
                 
                 [Vx2,theta,x2,params,par,acx1,acy1,acx2,actheta] = maindinamica(L1,L2,y2,0)
                 
                 figure
                plot(theta,par)
                xlabel('theta (rad)'); ylabel('Par (N.m)');
                title('Par')

                figure
                plot(theta,acx1)
                xlabel('theta (rad)'); ylabel('acx1 (cm/s^2)');
                title('Aceleracion del punto x1')

                figure
                plot(theta,acx2)
                xlabel('theta (rad)'); ylabel('acx2 (cm/s^2)');
                title('Aceleracion del punto x2')

                figure
                plot(theta,acy1)
                xlabel('theta (rad)'); ylabel('acy1 (cm/s^2)');
                title('Aceleracion del punto y1')

                figure
                plot(theta,actheta)
                xlabel('theta (rad)'); ylabel('Vx2 (rad/s^2)');
                title('Aceleracion de theta')
                
                
                        end %fin del if
                    end
                end

 if (graficabarras)
    surf(L2s,L1s,Deltax2_all);
    xlabel('L2');
    ylabel('L1');
end


end 