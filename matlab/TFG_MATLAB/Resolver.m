function [] = Resolver (L1s,L2s,graficabarras,dinamica,graficascinematica,haz_dibujo)

porcentaje = 5; %Valor de porcentaje para la zona lineal
y2=0;  %Altura en el eje 'y' con respecto al origen (eje del motor)

%Como vemos, podemos diferenciar muchas variables de entrada
%graficabrras -> Obtenemos la grafica para las configuraciones de las barras
%dinamica -> Si queremos hacer el problema de dinamica
%graficascinematica -> Obtenemos las graficas de la simulacion cinematica
%haz_dibujo -> Simulacion cinematica del mecanismo

Deltax2_all = zeros(length(L1s),length(L2s));

for L1i = 1:length(L1s)
    for L2k = 1:length(L2s)
        
        L1=L1s(L1i);
        L2=L2s(L2k);
        
        if (dinamica == 0)  %LLamamos al main que para cinematica

        [Vx2,theta,x2,params]=main(L1,L2,y2,haz_dibujo,graficascinematica);
            
            
            % TODO: Porcentaje wrt max.
            %Lo que vamos a hacer es coger el maximo de la curva Vx2/w y le aplicamos el porcentaje 
            %de ese maximo y vemos que rango de angulo tenemos, para luego ir
            %a la grafica de posicion del punto x2 y ver el margen de recorrido.
            %Para poder buscar asi que valores de L1 y L2 dan el mayor rango de
            %movimiento
            
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
                 
                maindinamica(L1,L2,y2,0)
                 
                        end %fin del if
                    end
                end

 if (graficabarras)
     
    %Cuando hacemos 1 'graficabarras' obtenemos tambien el calculo de par
    %por medios analiticos
    calculodepar(params);

    
    figure
    surf(L2s,L1s,Deltax2_all);
    xlabel('L2');
    ylabel('L1');
    
 end

  
end 