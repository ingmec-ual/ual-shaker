function qp = resuelveProbVelocidad(q, MBK, v)

phiq = evaluaJacobiano(q,MBK);
A = phiq(:,1:4);
b = -v*phiq(:,5);
qp_dep = A\b;
qp = [qp_dep; v];

end