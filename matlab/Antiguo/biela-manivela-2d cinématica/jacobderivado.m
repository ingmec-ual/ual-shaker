
function[Jd]=jacobderivado(v,q,params)
%Definimos los valores del vector velocidad y del vector de posición
%necesarios para el cálculo de la derivada del jacobiano respecto al tiempo
xx1=v(1);
yy1=v(2);
xx2=v(3);
omega=v(4);
%xxA=0;
%yyA=0;
%y2=0;
theta=q(4);
%Definimos la matriz de la derivada del jacobiano con respecto al tiempo
Jd(1,1)=2*(xx1);
Jd(1,2)=2*(yy1);
Jd(1,3)=0;
Jd(1,4)=0;
Jd(2,1)=2*xx1;
Jd(2,2)=2*yy1;
Jd(2,3)=2*xx2;
Jd(2,4)=0;
Jd(3,3)=0;

if (abs(sin(theta))>0.9)
    Jd(3,1)=0;
    Jd(3,2)=0;
    Jd(3,4)=params.L1*omega*cos(theta);

else
    Jd(3,1)=0;
    Jd(3,2)=0;
    Jd(3,4)=params.L1*omega*sin(theta);

end
