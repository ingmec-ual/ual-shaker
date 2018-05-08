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

%Una vez hemos visto las posibles configuraciones de barras posibles,
%elegimos una configuracion en concreto y estudiamos su comportamiento en
%posicion, velocidad, aceleracion (cinemática) y par (analítico-dinámica)
L1s = 4;
L2s = 7;

Resolver(L1s,L2s,0,0,1,1);

%Realizamos una comparacion con metodos numéricos mediante dinamica (problema dinámico inverso), concretamente el
%problema dinamico inverso, es necesario hacer diferenciacion con respecto
%al anterior por que para este caso cambiamos las restricciones.
% L1s = 4;
% L2s = 7;
% 
% Resolver(L1s,L2s,0,1,0,0);


%ResolverSimple
%ResolverCopy
%ResolverMesa


