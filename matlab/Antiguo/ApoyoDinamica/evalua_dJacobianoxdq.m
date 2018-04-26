function out_vector = phiqpqp(q,qp,params)
% Variable extraction
x1 = q(1) ;y1 = q(2);x2 = q(3);y2 = q(4);theta = q(5);
x1p = qp(1) ;y1p = qp(2);x2p = qp(3);y2p = qp(4);thetap = qp(5);
LA1 = params.Bar_Length(1); L12 = params.Bar_Length(2); L2B = params.Bar_Length(3);


% out_vector = [2*x1p^2+2*y1p^2;
%               2*((x1p-x2p)^2+(y1p-y2p)^2);
%               2*x2p^2+2*y2p^2;
%               LA1*cos(theta)*thetap^2;
%               LA1*sin(theta)*thetap^2];
    if abs(sin(theta)) < 0.7
        out_vector = [2*x1p^2+2*y1p^2;
              2*((x1p-x2p)^2+(y1p-y2p)^2);
              2*x2p^2+2*y2p^2;
              LA1*sin(theta)*thetap^2];

    else
        out_vector = [2*x1p^2+2*y1p^2;
              2*((x1p-x2p)^2+(y1p-y2p)^2);
              2*x2p^2+2*y2p^2;
              LA1*cos(theta)*thetap^2];

    end

end