%TFG_Angel_Artero

%En el siguiente c�digo se realizar�n los c�lculos necesarios para el
%trabajo.

clear, clc, close all

%Obtener gr�fica 'Configuraci�n barras'
L1s = 2:0.25:5;
L2s = 6:0.25:8;

Resolver(L1s,L2s,1,0,0,0);

%Una vez hemos visto las posibles configuraciones de barras posibles,
%elegimos una configuracion en concreto y estudiamos su comportamiento en
%posicion, velocidad, aceleracion y par. 
L1s = 4;
L2s = 7;

Resolver(L1s,L2s,0,0,1,1);

%Realizamos una comparacion con metodos num�ricos mediante dinamica, concretamente el
%problema dinamico inverso, es necesario hacer diferenciacion con respecto
%al anterior por que para este caso cambiamos las restricciones.
L1s = 4;
L2s = 7;

Resolver(L1s,L2s,0,1,0,0);

sim('Copy_of_SimulacionSimple'); %Tocar en la corredera, CS3 / World?
% theta=simout_ang(:,1);
% Tr=simout_Tr(:,3);
% plot(theta,Tr)



