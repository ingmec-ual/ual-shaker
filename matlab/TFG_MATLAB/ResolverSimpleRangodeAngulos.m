%En este caso la simulacion corresponde al mecanismo simple biela manivela,
%pero en este caso las condiciones seran diferentes a las establecidas en
%el problema cinematico. Debido a que no tenemos velocidad constante, si no
%que el motor girara en un rango de angulos determinado.

close all

sim('SimulacionSimpleRangodeAngulos');

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

     
    theta = theta(50:end);
    omega = omega (50:end);
    pos = pos (50:end);
    velocidad = velocidad (50:end);
    aceleracion = aceleracion (50:end);
    par = par (50:end);
    rx = rx(50:end);
    ry = ry(50:end);


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

Ts=simout_pos.time(2)-simout_pos.time(1);
x=pos;
X=fftshift(fft(x-mean(x))); %X=fftshift(fft(x-mean(x)),2048);
Fs=1/Ts; fs=linspace(-0.5*Fs,0.5*Fs,length(X));

figure, plot(fs,20*log10(abs(X))), grid on;
ylabel('dB');
xlabel('Freq (Hz)');