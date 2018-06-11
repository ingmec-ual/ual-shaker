%En este caso se han importado archivos .STL de Solidworks para simular asi
%el movimiento de la mesa diseñada en el trabajo.

close all

sim('mesaparasimulink2');


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

b=4*150;

    theta = theta(50:b);
    omega = omega (50:b);
    pos = pos (50:b);
    velocidad = velocidad (50:b);
    aceleracion = aceleracion (50:b);
    rx = rx(50:b);
    ry = ry(50:b);
    
    aceleraciontotalx = aceleraciontotalx(50:b);
    aceleraciontotaly = aceleraciontotaly(50:b);
    velocidadtotalx = velocidadtotalx(50:b);
    velocidadtotaly = velocidadtotaly(50:b);
    postotalx = postotalx(50:b);
    postotaly = postotaly(50:b);
    parx = parx(50:b);
    pary = pary(50:b);
    
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

Ts=simout_pos.time(2)-simout_pos.time(1);
x=pos; %x=simout_pos.signals.values(:,3);
X=fftshift(fft(x-mean(x)));
Fs=1/Ts; fs=linspace(-0.5*Fs,0.5*Fs,length(x));

figure, plot(fs,20*log10(abs(X))), grid on;
ylabel('dB');
xlabel('Freq (Hz)');
