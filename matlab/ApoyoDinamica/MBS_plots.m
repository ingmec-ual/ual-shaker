function [] = MBS_plots(E_mec, T, Vg, dissipative, rest_pos, rest_vel, rest_ace)
    % Function that plots the main multibody results ( Conservation of
    % energy and constraints fulfilment)
    long = length(E_mec);

    figure;
    hold on; grid on;
    plot (1:long, E_mec, 'r')
    plot (1:long,T, 'g')
    plot (1:long,Vg, 'b')
    plot (1:long,dissipative, 'k')
    EnCon = abs(100 - abs(max(E_mec) - min(E_mec))*100/E_mec(1));
    str = sprintf('Conservation of energy: %.3f %%\n',EnCon);
    Box = uicontrol('style','text');
    set(Box,'String',str)
    set(Box,'Position',[80,-20,200,35])
    legend ('Mechanical', 'Kinetic ', 'Potential','Dissipative')
    title('Conservation of energy')

    figure;
    hold on; grid on;
    plot (1:long, rest_pos, 'r')
    plot (1:long, rest_vel, 'b')
    plot (1:long, rest_ace, 'g')
    legend ('Position', 'Velocity', 'Acceleration')
    title('Constraints fulfilment')
end