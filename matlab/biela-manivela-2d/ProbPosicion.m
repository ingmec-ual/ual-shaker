%Resuelve el problema de posicion
function q = ProbPosicion (q,angDeseado, L1,L2)

%Inicializa las variables
error = 1e10;
epsilon = 1e-10;
deltaQ = zeros(4,1);
fi = zeros(4,1);
q(4) = angDeseado;
%Bucle hasta que el error sea menor que la tolerancia
while (error > epsilon),
fi = phi(q,L1,L2)
deltaQ =-[phiq; 0 0 0 1]\[fi;0]; %Calcula la variacion de q
q = q+deltaQ; %Actualiza las posiciones
error = norm(deltaQ); %Calcula el error
end
