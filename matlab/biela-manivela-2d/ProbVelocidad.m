%Resuelve el problema de velocidad
function qp = ProbVelocidad (q)

%Inicializa las variables
b = zeros(8,1);
b(8) = omega; %Introduce la velocidad del gdl
qp = phiq\b; %Calcula la variacion de q
