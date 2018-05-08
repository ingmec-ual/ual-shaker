Ts=simout_pos.time(2)-simout_pos.time(1);
x=simout_pos.signals.values(:,3);
X=fftshift(fft(x-mean(x)));
Fs=1/Ts; fs=linspace(-0.5*Fs,0.5*Fs,length(x));

figure, plot(fs,20*log10(abs(X))), grid on;
ylabel('dB');
xlabel('Freq (Hz)');
