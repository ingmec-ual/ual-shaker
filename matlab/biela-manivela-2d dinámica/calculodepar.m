function [theta,par] = calculodepar(params)

    %Calculo del par motor (en función de theta)

    %theta = 0;
    %Empezamos con el theta inicial y hara los siguientes calculos para cada
    %valor de theta comprendido entre [0º,360º]

    w = params.omega;
    L1 = params.L1; 
    L2 = params.L2;
    % m será la masa del cajon que de momento la suponemos fija y de valor
    % 3 kg
    m = 3;
    g = 9.8;  %gravedad m2/s
    
    N = 360;
    par = zeros(N,1);
    theta=linspace(0,2*pi,N);
    
    for i=1:length(theta)
        v1 = params.omega*params.L1;
        beta = asin((params.L1/params.L2)*sin((pi)-theta(i)));

        v12 = (v1*sin(theta(i) - pi/2))/cos(beta);
        omega12 = v12/L2;
        v2 = v1*cos(theta(i) - pi/2) + v12*sin(beta);

        a1n = (params.omega^2)*L1;
        a12n = (omega12^2)*L2;

        a12t = ((a12n*sin(beta) - a1n*sin(pi - theta(i)))/(cos(beta)));
        a2 = a1n*cos(pi - theta(i)) + a12t*sin(beta) + a12n*cos(beta);

        ten = (m*a2)/cos(beta); %N
        N = m*g - ten*sin(beta);

        %Reacciones y par
        
        %OJO, LAS BARRAS ESTÁN EN CM
        Rx (i) = ten*cos(beta);
        Ry (i) = ten*sin(beta);
        par(i) = ten*L1*cos(theta(i) - pi/2 -beta)/100; %Nm
        
    end
     plot(theta,par);
     xlabel('theta (rad)'); ylabel('Par (N.m)');
  %   plot(Rx,par);
%      plot(Ry,par);
end 
