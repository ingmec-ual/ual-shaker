function [P] = phi(q,L1,L2)
% Usage: p = phi(q, L1, L2), con q el vector de coordenadas generalizadas

x1=q(1); y1=q(2); x2=q(3); theta=q(4); xA=0; yA=0; y2=0; L1=5; L2=10;

P=zeros(3,1);
P(1)=(x1-xA)^2+(y1-yA)^2-L1^2;
P(2)=(x1-x2)^2+(y1-y2)^2-L2^2;

if (abs (tan(theta))> 0.17) %viene de hacer la tangente de pi/18, es decir 10 grados
    P(3)=(x1-xA)-L1*cos(theta);
    else
    P(3)=(y1-yA)-L1*sin(theta);
end