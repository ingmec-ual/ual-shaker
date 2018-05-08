%TFG_Angel_Artero

%En el siguiente c�digo se realizar�n los c�lculos necesarios para el
%trabajo.

%Se aconseja para su correcta visualizaci�n y funcionamiento adecuado del
%programa no descomentar las siguientes llamadas a la vez.

clear, clc, close all

%Obtener gr�fica 'Configuraci�n barras' a partir de cinem�tica
% L1s = 2:0.25:5;
% L2s = 6:0.25:8;
% 
% Resolver(L1s,L2s,1,0,0,0);

%Una vez hemos visto las posibles configuraciones de barras posibles,
%elegimos una configuracion en concreto y estudiamos su comportamiento en
%posicion, velocidad, aceleracion (cinem�tica) y par (anal�tico-din�mica)
L1s = 4;
L2s = 7;

Resolver(L1s,L2s,0,0,1,1);

%Realizamos una comparacion con metodos num�ricos mediante dinamica (problema din�mico inverso), concretamente el
%problema dinamico inverso, es necesario hacer diferenciacion con respecto
%al anterior por que para este caso cambiamos las restricciones.
% L1s = 4;
% L2s = 7;
% 
% Resolver(L1s,L2s,0,1,0,0);


%ResolverSimple
%ResolverCopy
%ResolverMesa


