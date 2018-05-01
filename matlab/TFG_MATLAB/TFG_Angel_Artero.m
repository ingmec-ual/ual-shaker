%TFG_Angel_Artero

%En el siguiente código se realizarán los cálculos necesarios para el
%trabajo.

clear, clc, close all

%Obtener gráfica 'Configuración barras'
L1s = 2:0.25:5;
L2s = 6:0.25:8;

Resolver(L1s,L2s,1,0,0,0);

%Una vez hemos visto las posibles configuraciones de barras posibles,
%elegimos una configuracion en concreto y estudiamos su comportamiento en
%posicion, velocidad, aceleracion y par. 
L1s = 4;
L2s = 7;

Resolver(L1s,L2s,0,0,1,1);

%Realizamos una comparacion con metodos numéricos mediante dinamica, concretamente el
%problema dinamico inverso, es necesario hacer diferenciacion con respecto
%al anterior por que para este caso cambiamos las restricciones.
L1s = 4;
L2s = 7;

Resolver(L1s,L2s,0,1,0,0);

sim('Copy_of_SimulacionSimple'); %Tocar en la corredera, CS3 / World?
% theta=simout_ang(:,1);
% Tr=simout_Tr(:,3);
% plot(theta,Tr)



