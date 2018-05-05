sim('mesaparasimulink');


theta=simout_ang.signals.values(:,1);
for i=1:length (theta)
    if (theta (i) < 0)

        theta (i)= theta (i) + 360;
    end
    theta (i) =theta (i) *(pi/180);
end


omega=simout_omega.signals.values(:,1);
pos=simout_pos.signals.values(:,1);
velocidad=simout_vel.signals.values(:,1);
aceleracion=simout_acel.signals.values(:,1);
par=simout_Tr.signals.values(:,3);
rx=simout_Tr1.signals.values(:,1);
ry=simout_Tr1.signals.values(:,2);


figure
plot(theta,omega);
legend('w');
xlabel('theta (rad)'); ylabel('rad/s');
title('Velocidad de giro introducida en el actuator')

figure
plot(theta,pos);
legend('x_2 (cm)');
xlabel('theta (rad)'); ylabel('pos (cm)');
title('Evolución de las coordenadas del punto 2 Simulink')

figure
plot(theta,velocidad);
legend('Vx_2');
xlabel('theta (rad)'); ylabel('cm/s');
title('Velocidad Corredera Simulink')

figure
plot(theta,aceleracion);
legend('ax_2');
xlabel('theta (rad)'); ylabel('cm/s^2');
title('Aceleración Corredera Simulink')

figure
plot(theta,par);
legend('T');
xlabel('theta (rad)'); ylabel('Nm');
title('Par mediante Simulink')

figure
plot(theta,-rx);
legend('R_x');
xlabel('theta (rad)'); ylabel('N');
title('Rx mediante Simulink')

figure
plot(theta,-ry);
legend('R_y');
xlabel('theta (rad)'); ylabel('N');
title('Ry mediante Simulink')