function M = matriz_masas( datos )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% Definición  de constantes
% Cuerpo 1 = tierra
% Disco 1 (cuerpo 2)(masa concentrada en el centro i):
m2=datos.mA1;
r2=0.275/2;   % radio disco
L2=datos.LA1;      % disancia 02A (longitud entre los puntos i y j)
xg2=0;      % coordenadas relativas
yg2=0;      % coordenadas relativas
I2=(1/2)*m2*(r2^2);
a2=I2/(L2^2);
bx2=m2*xg2/L2;
by2=m2*yg2/L2;
% Barra (cuerpo 3):
m3=datos.m12;
L3=datos.L12;     % Longitud barra
xg3=L3/2;
yg3=0;
I3=(1/3)*m3*(L3^2);
a3=I3/(L3^2);
bx3=m3*xg3/L3;
by3=m3*yg3/L3;

% Barra (cuerpo 3):
m4=datos.m2B;
L4=datos.L2B;     % Longitud barra
xg4=L4/2;
yg4=0;
I4=(1/3)*m4*(L4^2);
a4=I4/(L4^2);
bx4=m4*xg4/L4;
by4=m4*yg4/L4;

%% Definición matrices de masas:
M2=[m2+a2-2*bx2, 0, bx2-a2, -by2;...
    0, m2+a2-2*bx2, by2, bx2-a2;...
    bx2-a2, by2, a2, 0;...
    -by2, bx2-a2, 0, a2;
    ];

M3=[m3+a3-2*bx3, 0, bx3-a3, -by3;...
    0, m3+a3-2*bx3, by3, bx3-a3;...
    bx3-a3, by3, a3, 0;...
    -by3, bx3-a3, 0, a3;
    ];

M4=[m4+a4-2*bx4, 0, bx4-a4, -by4;...
    0, m4+a4-2*bx4, by4, bx4-a4;...
    bx4-a4, by4, a4, 0;...
    -by4, bx4-a4, 0, a4;
    ];

% Acceso a submatrices por medio de indices
i11=[1 5;2 6];
i12=[9 13;10 14];
i21=[3 7;4 8];
i22=[11 15;12 16];
% Ensamblado de matrices de masas:
M=[ M2(i22)+M3(i11), M3(i12);...
    M3(i21), M3(i22)+M4(i11)
    ];
% añadimos coordenada relativa con ángulo=0:
M(5,5)=0; %(matriz 5x5)

end

