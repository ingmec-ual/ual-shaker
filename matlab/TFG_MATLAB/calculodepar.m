function [] = calculodepar(params)

    %Calculo del par motor (en función de theta)

    %theta = 0;
    %Empezamos con el theta inicial y hara los siguientes calculos para cada
    %valor de theta comprendido entre [0º,360º]

    w = params.omega; %rad/s
    L1 = params.L1; %cm
    L2 = params.L2; %cm
    L1 = L1/100; %m
    L2 = L2/100; %m
    % m será la masa del cajon que de momento la suponemos fija y de valor
    % 6 kg ( para el motor más desfavorable)
    m = 6; %kg
    g = 9.8;  %m2/s
    
    N = 360;
    par = zeros(N,1); v1pr = zeros(N,1); v2pr = zeros(N,1); a2pr = zeros(N,1); 
    theta=linspace(0,2*pi,N);
    
    for i=1:length(theta)
        v1 = w*L1; %m/s
        beta = asin((L1/L2)*sin((pi)-theta(i)));

        v12 = (v1*sin(theta(i) - pi/2))/cos(beta); %m/s
        omega12 = v12/L2; %rad/s
         
        v2 = v1*cos(theta(i) - pi/2) + v12*sin(beta);%m/s
        a1n = (w^2)*L1; %m/s2
        a12n = (omega12^2)*L2; %m/s2

        a12t = ((a12n*sin(beta) - a1n*sin(pi - theta(i)))/(cos(beta))); %m/s2
        a2 = a1n*cos(pi - theta(i)) + a12t*sin(beta) + a12n*cos(beta); %m/s2
        a2pr (i) = a2;
        
        ten = (m*a2)/cos(beta); %kg.m/s2
        N = m*g - ten*sin(beta); %N

        %Reacciones y par
        Rx (i) = ten*cos(beta);
        Ry (i) = ten*sin(beta);
        par(i) = ten*L1*cos(theta(i) - pi/2 -beta); %Nm
        v1pr(i)= v1;
        v12pr(i)= v12;
        v2pr (i) = v2;
        
    end
     
     figure
     plot(theta,par);
     xlabel('theta (rad)'); ylabel('Par (N.m)');
     title('Par mediante analítica')
     
     figure
     plot(theta,Rx);
     xlabel('theta (rad)'); ylabel('Reacción X (N)');
     title('Reacción X mediante analítica')
     
     figure
     plot(theta,Ry);
     xlabel('theta (rad)'); ylabel('Reacción Y (N)');
     title('Reacción Y mediante analítica')
     
     figure
     plot(theta,v1pr);
     xlabel('theta (rad)'); ylabel('velocidad (m/s)');
     title('v1')
     
     figure
     plot(theta,v2pr);
     xlabel('theta (rad)'); ylabel('velocidad (m/s)');
     title('v2')
     
     figure
     plot(theta,a2pr);
     xlabel('theta (rad)'); ylabel('aceleración (m/s^2)');
     title('a2')
    
end 
