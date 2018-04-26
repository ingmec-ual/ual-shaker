% Position problem resolution for a four bar mechanism
function q_out = resuelveProbPosicion(q, params)
    % q: natural coordinate vector
    % l: vector with the length of the bars
    % x: fixed point positions
    % tol: tolerancy
    phi_0 = evaluaRestricciones(q,params);
    error = norm( phi_0);
    iter =0;
    while error > params.tol && iter <= 1000
       phiq = evaluaJacobiano(q,params);
       deltaq = phiq (:,1:4)\-phi_0;
       q(1:4) = q(1:4) + deltaq;
       phi_0 = evaluaRestricciones(q,params);
       error = norm(phi_0);
       iter = iter+1;
       if iter == 1000
           warning('1000 Iteration limit reached in position problem')
       end       
    end
    q_out = q;
end