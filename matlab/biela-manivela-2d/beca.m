%¿TAMBÍEN SE PONEN COMO VARIABLES TODO LO CALCULADO EN MAIN CUANDO AQUÍ LLAMAMOS A MAIN?
% por ejemplo Vx2 que luego hace falta.

%Lo que vamos a hacer es coger el máximo de la curva Vx2/w y le ponemos un porcentaje (que
% también será dato de entrada) de ese máximo y vemos que rango de ángulo tenemos, para luego ir
%a la gráfica de posición del punto x2 para ver el margen de recorrido.

%Para poder buscar así que valores de L1 y L2 dan el mayor rango de
%movimiento

%OJO TAMBIÉN HAY QUE HACER QUE LAS GRÁFICAS ESTÉN EN FUNCIÓN DEL TAMAÑO DE
%L1 Y L2, por que de ser más grandes que para 5 y 10 no se ven.

%¿Como hago para ver el valor de las variales x1,x2,...? ¿No salen en el workspace
% por que main ahora es una función?

%¿Aquí iría el doble bucle for para poder determinar los valores óptimos de L1 y L2?
% De momento si escribimos el valor de L1 y L2 en el comand windows y
% llamamos a 'beca' obtenemos como antes los resultados y las gráficas.
main(L1,L2);

    [xm,im]=max(Vx2); %Por que w=1, pero podría ponerse  [xm,im]=max(Vx2/w) ? 
                      % aunque Vx2/w no se una función como tal?
    angulomax = theta(im);
    %Introducir previamente valor de 'porcentaje'
    liminf = angulomax - porcentaje*angulomax/100;
    limsup = angulomax + porcentaje*angulomax/100;

    %El rango deseado es:
    %Pasamos a grados
    liminf = liminf*180/pi;
    limsup = limsup*180/pi;
    fprintf('El rango de ángulos deseado es:,\n')
    fprintf('[%f,%f]\n',liminf,limsup)
    liminf = round (liminf);
    limsup = round (limsup);
    x2min = x2(liminf);
    x2max = x2(limsup);
    fprintf('El rango de movimientos del punto 2 es:,\n')
    fprintf('[%f,%f]\n',x2min,x2max)

  
   %Todo esto dentro del doble bucle for



