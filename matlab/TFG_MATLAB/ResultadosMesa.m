sim('mesaparasimulink');


theta=simout_ang.signals.values(:,1);
for i=1:length (theta)
    if (theta (i) < 0)

        theta (i)= theta (i) + 360;
    end
    theta (i) =theta (i) *(pi/180);
end


omega=simout_omega.signals.values(:,1);
pos=simout_pos.signals.values(:,3);
velocidad=simout_vel.signals.values(:,3);
aceleracion=simout_acel.signals.values(:,3);
parx=simout_Tc.signals.values(:,1);
pary=simout_Tc1.signals.values(:,1);
rx=simout_Tr1.signals.values(:,1);
ry=simout_Tr2.signals.values(:,3);

aceleraciontotalx=simout_acel1.signals.values(:,3);
aceleraciontotaly=simout_acel1.signals.values(:,1);

velocidadtotalx=simout_vel1.signals.values(:,3);
velocidadtotaly=simout_vel1.signals.values(:,1);

postotalx=simout_pos1.signals.values(:,3);
postotaly=simout_pos1.signals.values(:,1);

    theta = theta(5:75);
    omega = omega (5:75);
    pos = pos (5:75);
    velocidad = velocidad (5:75);
    aceleracion = aceleracion (5:75);
    rx = rx(5:75);
    ry = ry(5:75);
    
    aceleraciontotalx = aceleraciontotalx(5:75);
    aceleraciontotaly = aceleraciontotaly(5:75);
    velocidadtotalx = velocidadtotalx(5:75);
    velocidadtotaly = velocidadtotaly(5:75);
    postotalx = postotalx(5:75);
    postotaly = postotaly(5:75);
    parx = parx(5:75);
    pary = pary(5:75);
    
    postotal = sqrt((postotalx.*postotalx) + (postotaly.*postotaly) );
    velocidadtotal = sqrt((velocidadtotalx.*velocidadtotalx) + (velocidadtotaly.*velocidadtotaly) );
    aceleraciontotal = sqrt((aceleraciontotalx.*aceleraciontotalx) + (aceleraciontotaly.*aceleraciontotaly) );
    
    

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
plot(theta,parx);
legend('T');
xlabel('theta (rad)'); ylabel('Nm');
title('Par X')

figure
plot(theta,pary);
legend('T');
xlabel('theta (rad)'); ylabel('Nm');
title('Par Y')

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

figure
plot(theta,aceleraciontotal);
legend('a_t');
xlabel('theta (rad)'); ylabel('cm/s^2');
title('Aceleración de simulación')

figure
plot(theta,velocidadtotal);
legend('v_t');
xlabel('theta (rad)'); ylabel('cm/s');
title('Velocidad de simulación')


figure
plot(theta,postotal);
legend('pos_t');
xlabel('theta (rad)'); ylabel('cm');
title('Posición de simulación')

figure
plot(theta,postotaly);
legend('pos_t');
xlabel('theta (rad)'); ylabel('cm');
title('Posición y de simulación')

figure
plot(theta,aceleraciontotaly);
legend('pos_t');
xlabel('theta (rad)'); ylabel('cm');
title('aceleración y de simulación')

figure
plot(theta,velocidadtotaly);
legend('pos_t');
xlabel('theta (rad)'); ylabel('cm');
title('aceleración y de simulación')