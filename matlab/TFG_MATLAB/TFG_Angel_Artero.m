%TFG_Angel_Artero

%En el siguiente código se realizarán los cálculos necesarios para el
%trabajo.

%Se aconseja para su correcta visualización y funcionamiento adecuado del
%programa no descomentar las siguientes llamadas a la vez.

clear, clc, close all

%Obtener gráfica 'Configuración barras' a partir de cinemática
% L1s = 2:0.25:5;
% L2s = 6:0.25:8;
% 
% Resolver(L1s,L2s,1,0,0,0);

%Una vez se han visto las posibles configuraciones de barras posibles,
%se elige una configuracion en concreto y se estudia su comportamiento en
%posicion, velocidad, aceleracion (cinemática) y par (analítico)
% L1s = 4;
% L2s = 7;
% 
% Resolver(L1s,L2s,0,0,1,1);

%Se realiza una comparacion con metodos numéricos mediante dinamica, concretamente el
%problema dinamico inverso, es necesario hacer diferenciacion con respecto
%al anterior por que para este caso cambiamos las restricciones.
% L1s = 4;
% L2s = 7;
% 
% Resolver(L1s,L2s,0,1,0,0);

%A continuacion se verán 3 llamadas a 3 archivos diferentes, cada uno de
%ellos ejecutara un archivo de Simulink diferente, este obtendra sus parametros
%y los representara.

%ResolverSimple
%ResolverSimpleRangodeAngulos
%ResolverMesa


