function MBS_output = MBS_solve(MBS, flag_graph)
% Function that performs the dynamic calculation of a multibody model with
% penalty method

%% MBS parameter extraction
% Simulation parameters

dt = MBS.dt;     % time step

% Initial conditions
q_aprox = MBS.q_aprox;
thetap = MBS.thetap; % Initial DOF velocity

% Real data
encoder = MBS.encoder;

%%  Internal parameters
frame_rate = 1/200; % Every frame_rate s of simulation time a frame is plotted
frame = frame_rate;
long = length(encoder); %end_time/dt;

%% initial position, velocity and acceleration problems
q = resuelveProbPosicion(q_aprox,MBS);
qp = resuelveProbVelocidad(q, MBS, thetap);
qpp = resuelveProbAceleracion(q, qp, MBS);

%% Penalty dynamic resolution
% PC time
tic;
% Verification variables
T = zeros (1, long);
Vg = zeros (1, long);
dissipative = zeros (1, long);
E_mec = zeros (1, long);
% Constraints fulfilment
rest_pos = zeros(1, long);
rest_vel = zeros(1, long);
rest_ace = zeros(1, long);
hist_penalty = zeros (long,16);

figure
axis(0.001*[-150,750, -300,400]);
xA = 0; yA = 0; xB = 0.6; yB = 0;
result = zeros(long,3);
q_maq = q_aprox;
% MBS loop
q_maqueta_GT = zeros(long,5);
q_maqueta_BadModel = q_maqueta_GT;
for i = 1:long
    [q, qp, qpp] = R_dynamics(q, qp, qpp, MBS);
    T(i) = 0.5*qp'*MBS.M*qp;
    Vg(i) = -0.5*MBS.g*(MBS.m12*(q(2)+q(4))+MBS.m2B*(q(4)+MBS.yB));
    if i>1
    dissipative(i) = dissipative(i-1)+abs(qp(5)^2*MBS.C)*dt;
    end
    E_mec(i) = T(i)+Vg(i)+dissipative(i);
    rest_pos(i) = norm(evaluaRestricciones(q,MBS));
    rest_vel(i) = norm(evaluaJacobiano(q,MBS)*qp);
    rest_ace(i) = norm(evalua_dJacobianoxdq(q,qp,MBS)+evaluaJacobiano(q,MBS)*qpp);
    t=i*dt;
    hist_penalty(i,:)=[t, q', qp', qpp'];
        
    q_maq(5) = encoder(i);    
    q_maq = resuelveProbPosicion(q_maq,MBS);    
    q_maqueta_GT(i,:) = q_maq;
    q_maqueta_BadModel(i,:) = q;
    if flag_graph == 1
        if i*dt > frame
            cla
            line([0    ,q(1)],[0  ,q(2) ],'color','b','Marker', 'o','LineWidth',1,'markers',2)
            line([q(1), q(3)],[q(2),q(4)],'color','b','Marker', 'o','LineWidth',1,'markers',2)
            line([q(3),xB],[q(4),0   ],'color','b','Marker', 'o','LineWidth',1,'markers',2)
            
            line([xA  ,q_maq(1)],[yA  ,q_maq(2)],'color','r','Marker', 'o','LineWidth',1,'markers',2)
            line([q_maq(1),q_maq(3)],[q_maq(2),q_maq(4)],'color','r','Marker', 'o','LineWidth',1,'markers',2)
            line([q_maq(3),xB  ],[q_maq(4),yB  ],'color','r','Marker', 'o','LineWidth',1,'markers',2)
            
            title(sprintf('Azul: Simulación; Rojo: Mecanismo real; t=%.03f s',t));
            drawnow;
            frame = frame + frame_rate;
        end
    end
    result(i,1) = t;
    result(i,2) = q(5);
    result(i,3) = q_maq(5);
end
elapsed_time = toc;
fprintf('tiempo real: %f\n',elapsed_time)

%% output
MBS_output = struct();
MBS_output.T = T;
MBS_output.Vg = Vg;
MBS_output.Dissipative = dissipative;
MBS_output.E_mec = E_mec;
MBS_output.rest_pos = rest_pos;
MBS_output.rest_vel = rest_vel;
MBS_output.rest_ace = rest_ace;
MBS_output.hist_penalty = hist_penalty;
% resultados = hist_penalty;
% save('coordenadas','resultados');
plot(result(:,1),result(:,2)); hold on
plot(result(:,1),result(:,3),'r'); hold off
xlabel('t [s]')
ylabel('\theta [rad]')
legend('Simulacion','Real')
save q_maqueta q_maqueta_GT q_maqueta_BadModel
end