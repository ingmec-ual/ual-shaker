%Resuelve el problema de posicion
function q = ProbPosicion (q,omega,L1,L2)

%Inicializa las variables
error = 1e10;
epsilon = 1e-10;
deltaQ = zeros(4,1);
fi = zeros(4,1);
q(4)=omega;
%Bucle hasta que el error sea menor que la tolerancia
while (error > epsilon),
fi = phi(q,L1,L2);
J=phiq(q,L1,L2);
deltaQ =-[J; 0 0 0 1]\[fi;0]; %Calcula la variacion de q
q = q+deltaQ; %Actualiza las posiciones
error = norm(deltaQ); %Calcula el error
end