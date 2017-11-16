function q = ProbPosicion (q)
%Inicializamos las variables
error = 1e10;
epsilon = 1e-10; %tolerancia
iter = 0; 
iterMax = 50; 

% Creamos un bucle hasta que el error sea menor que la tolerancia
while (error > epsilon && iter < iterMax),
    %Calcula los residuos
    phi = restricciones(q);
    phiq = jacob(q);
    deltaQ = -[phiq; 0 0 0 1] \ [phi;0]; %Calcula la variacion de q
    q = q+deltaQ; %Actualiza las posiciones
    error = norm(deltaQ); %Calcula el error
    iter = iter+1;
end 
end 
