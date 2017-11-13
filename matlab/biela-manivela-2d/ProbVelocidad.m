%Resuelve el problema de velocidad
function qp = ProbVelocidad (q,omega,L1,L2)

%Inicializa las variables
b = zeros(8,1);
b(8) = omega; %Introduce la velocidad del gdl
qp = phiq(q,L1,L2)\b; %Calcula la variacion de q