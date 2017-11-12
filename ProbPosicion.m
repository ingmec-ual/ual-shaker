%Resuelve el problema de posicion
function q = ProbPosicion (q,L1,L2)

%Inicializa las variables
error = 1e10;
epsilon = 1e-10;
deltaQ = zeros(4,1);
fi = zeros(4,1);
%Bucle hasta que el error sea menor que la tolerancia
while (error > epsilon),
fi = phi(q,L1,L2)
deltaQ =-phiq\fi; %Calcula la variacion de q
q = q+deltaQ; %Actualiza las posiciones
error = norm(deltaQ); %Calcula el error
end
