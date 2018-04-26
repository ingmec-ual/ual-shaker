function [q_next, qp_next, qpp_next, M_bar] = R_dynamics (q, qp, qpp, PARAMS)
% Multibody solve with R_dynamics + trapezoidal integrator
    % Prediction
    z = q(5);
    zp = qp(5);
    zpp = qpp(5);
    
    dt = PARAMS.dt;
    %---------------------------------
    % Integracion por Forward-Euler
    z_next = z + zp*dt + 0.5*zpp*dt^2;
    zp_next = zp + zpp*dt;
    %---------------------------------
    q(5) = z_next;
    q_next = resuelveProbPosicion(q,PARAMS);
    R = resuelveProbVelocidad(q_next, PARAMS,1);
    qp_next = R*zp_next;
    M_bar = R'*PARAMS.M*R;
    Rpzp = resuelveProbAceleracion(q_next,qp_next,PARAMS,0);
    Q=eval_Q(PARAMS, q, qp);
    Q_bar = R'*(Q-PARAMS.M*Rpzp);
    zpp_next = M_bar\Q_bar;
    %qpp_next = ace(q_next,qp_next,l,x,zpp); % R matrix acceleration
    % se hace el problema iterativo de abajo para afinar mas
    
    err = 1; 
    ite = 0;
    
    while err>PARAMS.tol_dyn && ite < PARAMS.iter_max
       q_old = q_next;
       z_next = z + zp*dt + dt^2/4*(zpp+zpp_next);
       zp_next = zp + dt/2*(zpp+zpp_next);
       q_next(5) = z_next;
       q_next = resuelveProbPosicion(q_next,PARAMS);
       R = resuelveProbVelocidad(q_next, PARAMS, 1);
       qp_next = R*zp_next;
       M_bar = R'*PARAMS.M*R;
       Rpzp = resuelveProbAceleracion(q_next,qp_next,PARAMS,0);
       Q=eval_Q(PARAMS, q, qp);
       Q_bar = R'*(Q-PARAMS.M*Rpzp);
       zpp_next = M_bar\Q_bar;
       %qpp_next = ace(q_next,qp_next,l,x,zpp); % R matrix acceleration
       ite=ite+1;
       err = norm (q_old-q_next);
    end
    qpp_next = resuelveProbAceleracion(q_next,qp_next,PARAMS,zpp_next); % R matrix acceleration
end