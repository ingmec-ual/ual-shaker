function  Q = eval_Q(param,~,qp)
    Q_var = zeros(5,1);
    Q_var(5) = -param.C*qp(5);
    Q = param.Qg+Q_var;
end
