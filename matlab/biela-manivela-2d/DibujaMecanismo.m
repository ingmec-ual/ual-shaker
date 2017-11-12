%Dibuja el mecanismo
function DibujaMecanismo
global q;
%Limpia la pantalla
cla;
%Extrae los 3 puntos moviles del cuadrilatero
x1=q(1); y1=q(2); x2=q(3); y2=q(4);
x3=q(5); y3=q(6);
%Dibuja el triangulo del acoplador en rojo
fill([x1,x3,x2],[y1,y3,y2],'r');
%Dibuja tres barras moviles entre las cuatro articulaciones
line([0,x1,x2,2],[0,y1,y2,0],'lineWidth',3);
%Vacia el buffer de dibujo
drawnow;
