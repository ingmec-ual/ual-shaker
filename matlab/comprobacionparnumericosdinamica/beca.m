clear, clc, close all

%porcentaje = 5;

y2=0;

L1s = 4:1:4;
L2s = 7:1:7;

Deltax2_all = zeros(length(L1s),length(L2s));

for L1i = 1:length(L1s),
    for L2k = 1:length(L2s),
        
        L1=L1s(L1i);
        L2=L2s(L2k);

        [Vx2,theta,x2,params,par,acx1,acy1,acx2,actheta]=main(L1,L2,y2,0);

%             % TODO: Porcentaje wrt max
%             [imin, imax] = estabilidad (Vx2/params.omega, 1-0.01*porcentaje);
% 
%             x2min = x2(imin);
%             x2max = x2(imax);
% %             fprintf('El rango de movimientos del punto 2 es:\n')
% %             fprintf('[%f,%f]\n',x2min,x2max)
%             Deltax2max = x2max - x2min;
%             Deltax2max = abs(Deltax2max);
%             Deltax2_all(L1i,L2k) = Deltax2max;
% %             Deltax2maxmax = 0;
% %                 if (Deltax2max > Deltax2maxmax)
% %                     Deltax2maxmax = Deltax2max;
% % %                        fprintf('El Desplazamiento max obtenido es:')
% % %                        fprintf('%f\n',Deltax2maxmax)
% % %                        fprintf('Para las longitudes:\n')
%                         fprintf('L1 = %f  L2 = %f => Dx=%f \n',L1,L2,Deltax2max);
% %                 end
%             
%              thetamin = theta (imin);
%              thetamax = theta (imax);
%              thetamin = thetamin*180/pi;
%              thetamax = thetamax*180/pi;
%              fprintf('Se movera en el rango de angulos: [%f,%f]\n',thetamin,thetamax);
    end
end

% [theta,par] = calculodepar(params);
% figure
% plot(theta,Vx2)
% xlabel('theta (rad)'); ylabel('Vx2 (cm/s)');
% title('Velocidad del punto 2')


%     surf(L2s,L1s,Deltax2_all);
%     xlabel('L2');
%     ylabel('L1');
  

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



