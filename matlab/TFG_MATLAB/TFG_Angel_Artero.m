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

%Una vez se han visto las posibles configuraciones de barras posibles,
%se elige una configuracion en concreto y se estudia su comportamiento en
%posicion, velocidad, aceleracion (cinem�tica) y par (anal�tico)
% L1s = 4;
% L2s = 7;
% 
% Resolver(L1s,L2s,0,0,1,1);

%Se realiza una comparacion con metodos num�ricos mediante dinamica, concretamente el
%problema dinamico inverso, es necesario hacer diferenciacion con respecto
%al anterior por que para este caso cambiamos las restricciones.
% L1s = 4;
% L2s = 7;
% 
% Resolver(L1s,L2s,0,1,0,0);

%A continuacion se ver�n 3 llamadas a 3 archivos diferentes, cada uno de
%ellos ejecutara un archivo de Simulink diferente, este obtendra sus parametros
%y los representara.

%ResolverSimple
%ResolverSimpleRangodeAngulos
%ResolverMesa


