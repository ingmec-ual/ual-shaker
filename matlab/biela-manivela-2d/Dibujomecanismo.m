function [] = Dibujomecanismo( q, params )
%Definimos valores limite de x e y de la gráfica

%Definimos las coordenadas generalizadas
x1=q(1);
y1=q(2);
x2=q(3);
theta=q(4);
%Definimos las coordenadas que no varían(fijas)
xA=0;
yA=0;
y2=params.y2;
%Dibujamos nuestro mecanismo, en este caso, 2 barras, ya que tenemos un
%biela manivela
line([xA,x1],[yA,y1])
line([x1,x2],[y1,y2])
drawnow;
end

