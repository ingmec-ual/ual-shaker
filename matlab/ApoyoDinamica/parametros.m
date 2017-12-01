function param = parametros(data)
% Set the Real mechanism parameters
param = struct();
%% Simulation parameters
param.end_time = data.duracion;  % final time
param.dt = data.At;     % time step
param.tol = 1e-9;    % Initial position tolerance
param.tol_dyn = 1e-9;% dynamic tolerance
param.iter_max = 100; % Maximum iterations during integration


%% Penalty parameters
param.alpha = 1e6; % penalty (it takes influence in conservation of energy)
param.omega = 10;
param.psi = 1;
% Initial conditions
param.q_aprox = data.q_aprox; % Initial approximated position
param.encoder = data.encoder; % real data 
param.thetap = 0; % Initial DOF velocity
%% Multibody model parameters
% fixed points:
xA = 0; param.yA = 0; xB = 0.8; param.yB = 0;
param.fixed_points = [xA, param.yA, xB, param.yB];
% geometry
LA1=data.LA1; L12 = data.L12; L2B = data.L2B;
param.Bar_Length = [LA1, L12, L2B];
% mass
param.g = -9.81;
param.mA1=data.mA1; param.m12 = data.m12; param.m2B = data.m2B;
param.M = data.M;
param.Qg = data.Qg;
param.qdep = 1:4; % set of dependent coordinates
param.C = data.C; % damping coefficient

   
    
end