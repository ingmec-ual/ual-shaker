function q = ProbPosiciondinamica (q,params)
%Inicializamos las variables
err = 1e10;
epsilon = 1e-10; %tolerancia
iter = 0; 
iterMax = 50; 

% Creamos un bucle hasta que el error sea menor que la tolerancia
while (err > epsilon && iter < iterMax),
    %Calcula los residuos
    phi = restriccionesdinamica(q,params);
    phiq = jacobdinamica(q,params);
    deltaQ = -[phiq] \ [phi]; %Calcula la variacion de q
    q = q+deltaQ; %Actualiza las posiciones
    err = norm(deltaQ); %Calcula el error
    iter = iter+1;
end 
% if (err>1e-2)
%     error('Problema pos no converge!!');
% end
end 
