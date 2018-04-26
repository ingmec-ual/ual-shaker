%TFG_Angel_Artero

%En el siguiente código se realizarán los cálculos necesarios para el
%trabajo.

%Aquí empezamos con llamar a 'resolver' (antiguo beca) de diferentes formas,
%la primera, que haga solamente la gráfica de las barras. La segunda que
%llame a todo para sacar las gráficas con las barras seleccionadas y que la
%tercera compare el par.

clear, clc, close all

%Obtener gráfica 'Configuración barras'
%OJO, para que funcione lo que tenemos que lograr es que cuando TFG llame a
%resolver, este llame a main, podamos diferenciar cuando llamamos a los de
%dinamica (4 restricciones) a los de cinemática (3 restricciones)

L1s = 2:0.25:5;
L2s = 6:0.25:8;

Resolver(L1s,L2s,1,0);

% L1s = 4;
% L2s = 7;
% 
% Resolver(L1s,L2s,0,0);
% 
% %dinamica
% 
% L1s = 4;
% L2s = 7;
% 
% Resolver(L1s,L2s,0,1);


