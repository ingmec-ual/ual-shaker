%Matriz de masas del mecanismo (una planta)

mL1 = 0.007;
mL2 = 0.01;
mmesa = 6;

Me(1,1) = (mL1/3) + (mL2/3);
Me(1,2) = 0;
Me(1,3) = (mL2/6);
Me(1,4) = 0;
Me(2,1) = 0;
Me(2,2) = (mL1/3) + (mL2/3);
Me(2,3) = 0;
Me(2,4) = 0;
Me(3,1) = (mL2/6);
Me(3,2) = 0;
Me(3,3) = (mL2/3)+mmesa;
Me(3,4) = 0;
Me(4,1) = 0;
Me(4,2) = 0;
Me(4,3) = 0;
Me(4,4) = 0;
