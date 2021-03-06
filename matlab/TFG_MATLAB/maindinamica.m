function [] = maindinamica(L1,L2,y2,haz_dibujo)


% parametros fijos del mecanismo
params = struct();
params.L1 = L1; % cm
params.L2 = L2; % cm
params.y2=y2;
params.omega = 5; % rad/s
params.alpha = 0; % rad/s^2


params.t = 0.005; %inicializamos

% Se introducen las coordenadas iniciales del vector posicion (valores
% aleatorios aunque elegidos con cierto criterio)
x1 = params.L1;
y1 = params.L1*0.05;
x2 = params.L1-params.L2;
theta = 0;

% Se forma el vector de coordenadas generalizadas
q = [x1; y1; x2; theta];

% Se hacen los problemas de velocidad y aceleracion iniciales
v = probvelocidaddinamica(q,params);
%a = probaceleracion(v,q,params); Se comenta por que se desea obtener su
%valor

% Para la simulacion cinematica, se define el tiempo=0,005 s
if (haz_dibujo)
    figure
    xlim([-20,10])
    ylim([-20,10])
    grid minor;
end

At = 0.005;
% se inicializa un vector columna de las coordenadas que varian
N = 360;
x1=zeros(N,1); y1=zeros(N,1); x2=zeros(N,1); theta=zeros(N,1); t=zeros(N,1);

Vx2=zeros(N,1); %se crea la matriz de tendra las velocidades del punto 2
acx1=zeros(N,1); acy1=zeros(N,1); acx2=zeros(N,1); actheta=zeros(N,1);
lambda1 =zeros(N,1); lambda2=zeros(N,1); lambda3=zeros(N,1); par=zeros(N,1);

%se itera para representar el mecanismo
%secuencia_theta=load('nombre.txt');
secuencia_theta=linspace(0,2*pi,N);
for i=1:length(secuencia_theta),
    th = secuencia_theta(i);
    q(4)=th;
    ti = th / (2*pi*params.omega); % tiempo
    params.t = ti;
    q = ProbPosiciondinamica(q,params);
    v = probvelocidaddinamica(q,params);
    %a = probaceleracion(v,q,params); Se recuerda que se comenta por que se desea obtener su
    %valor
    J = jacobdinamica(q,params);
    Jd = jacobderivadodinamica(v,q,params);
    [a, lambda] = probDinamico(q,v,params,J,Jd);
        %Al llamar a esta funcion se obtiene el vector que dar� las
        %aceleraciones para poder compararlo con lo que se obtiene en el
        %cinematico y ademas el par con lambda
    
    if (haz_dibujo)
        cla
        Dibujomecanismo(q,params)
        title('Simulacion cinematica')
        drawnow
    end
    x1(i)=q(1); y1(i)=q(2); x2(i)=q(3); theta(i)=q(4); t(i)=(i-1)*At;
    Vx2(i)=v(3);
    
    %Para la dinamica par habra que sacar que sacar tambien las lambdas
    %para poder plotearlas
    
    acx1(i) = a(1) ; acy1(i)= a(2) ; acx2(i)= a(3) ; actheta(i) = a(4);
    lambda1(i) = lambda(1);lambda2(i) = lambda(2); lambda3(i) = lambda(3);
    parmalo(i) = lambda(4);
    
    par (i) = parmalo(i)/(100^2); %esto se realiza para tener el par en N.m ya que se han
    %introducido kg, cm y s2, para pasar kg.cm/s^2 a N se divide por 100 y
    %para pasar el otro cm a m es preciso volver a dividir por 100
    
  
    
end


                figure
                plot(theta,par)
                xlabel('theta (rad)'); ylabel('Par (N.m)');
                title('Par mediante din�mica')

                figure
                plot(theta,acx1,theta,acy1)
                legend('ax_1','ay_1');
                xlabel('theta (rad)'); ylabel('aceleraci�n (cm/s^2)');
                title('Aceleracion del punto 1 mediante din�mica')

                figure
                plot(theta,acx2)
                legend('ax_2');
                xlabel('theta (rad)'); ylabel('aceleraci�n (cm/s^2)');
                title('Aceleracion del punto 2 mediante din�mica')


                figure
                plot(theta,actheta)
                xlabel('theta (rad)'); ylabel('aceleraci�n (rad/s^2)');
                title('Aceleracion de theta mediante din�mica')
                
%                 figure
%                 plot(theta,lambda1)
%                 xlabel('theta (rad)'); ylabel(' �?');
%                 title('Prueba lambda 1')
%                 
%                 figure
%                 plot(theta,lambda2)
%                 xlabel('theta (rad)'); ylabel(' �?');
%                 title('Prueba lambda 2')
%                 
%                 figure
%                 plot(theta,lambda3)
%                 xlabel('theta (rad)'); ylabel('�? ');
%                 title('Prueba lambda 3')

end 
