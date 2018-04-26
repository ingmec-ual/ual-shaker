clear; close all;
% Los datos se pasan al simulador mediante una estructura
datos = struct();
% Real data
load datasets % Datos cinematicos a partir del DOF (enc0)
datos.encoder = encoder; 

% --------------------------------------------------------------
%                 Parametros asignados a cada trabajo
% --------------------------------------------------------------

% Longitudes de cada eslabon (m)
LA1=0.12; L12 = 0.540; L2B = 0.450;
datos.LA1 = LA1; datos.L12 = L12; datos.L2B = L2B; 

% Masas de cada eslabon (kg)
datos.mA1 = 0.303; datos.m12 = 0.161; datos.m2B = 0.303;

% Condiciones iniciales
x1 = 0.07; y1= 0.08; x2 = 0.5; y2 = 0.4; %
theta = 0.68; % Valor del grado de libertad
datos.q_aprox = [x1, y1, x2, y2, theta]'; % Aproximacion incial

% --------------------------------------------------------------
%                 Parametros dinamicos
% --------------------------------------------------------------

% *IMPORTANTE*: La matriz de masas la tendra que calcular cada grupo 
% (Estos valores son solo un ejemplo)
datos.M = matriz_masas(datos);

% Vector de fuerzas generalizadas
datos.Qg = 0.5*(-9.81)*[0; datos.m12; 0; datos.m12+datos.m2B; 0];

% Coeficiente de friccion en la manivela
datos.C = 0.003;

% --------------------------------------------------------------
%                 Parametros de la simulacion
% --------------------------------------------------------------
 
datos.duracion = 10; % Tiempo de la simulacion
datos.At = 2e-3;     % Tiempo de paso

% --------------------------------------------------------------
%                 Llamada a la simulacion dinamica:
% --------------------------------------------------------------
MBS = parametros(datos);
MBS_output = MBS_solve(MBS, 1);

% Graficas
plotear = 1;
if plotear==1
    MBS_plots(MBS_output.E_mec, MBS_output.T, MBS_output.Vg, MBS_output.Dissipative, MBS_output.rest_pos, MBS_output.rest_vel, MBS_output.rest_ace);
    figure;
    grid on;
    plot (MBS_output.E_mec, 'r');
    title('Conservation of mechanical energy');
end
% --------------------------------------------------------------
