%Resuelve el problema de aceleracion
function qpp = ProbAceleracion (q)

%Inicializa las variables
b =zeros(5,1);
%Extrae las velocidades
x1p=qp(1); y1p=qp(2);
x2p=qp(3); thetap=qp(4);

%Calcula el producto fiqp*qp
b(1) = 2*x1p^2 + 2*y1p^2;
b(2) = 2*(x2p-x1p)^2 + 2*(y2p-y1p)^2;
b(3) = 2*(x3p-x1p)^2 + 2*(y3p-y1p)^2;
b(4) = 2*(x2p-x3p)^2 + 2*(y2p-y3p)^2;
b(5) = 2*x2p^2 + 2*y2p^2;
b(6) = cos(ang)*angp^2;
b(7) = sin(ang)*angp^2;
b(8) = 0;
%Resuelve el sistema
qpp=-phiq\b; %Calcula la aceleracion
