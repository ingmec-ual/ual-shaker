function qpp = resuelveProbAceleracion(q, qp, MBK, a)
if nargin == 3
    jac = evaluaJacobiano(q,MBK);
    A = MBK.M + MBK.alpha*((jac)')*jac;
    phiqpqp_0 = evalua_dJacobianoxdq(q,qp,MBK);
    phi_0 = evaluaRestricciones(q,MBK);
    phip = jac*qp;
    Q = eval_Q(MBK,q,qp);
    b = Q-MBK.alpha*(jac)'*(phiqpqp_0 + 2*MBK.psi*MBK.omega*phip + MBK.omega^2*phi_0);
    qpp = A\b;
elseif nargin ==4
    phiq = evaluaJacobiano(q,MBK);
    A = phiq(:,1:4);
    b = -a*phiq(:,5)-evalua_dJacobianoxdq(q,qp,MBK);
    qpp_dep = A\b;
    qpp = [qpp_dep; a];
end
end