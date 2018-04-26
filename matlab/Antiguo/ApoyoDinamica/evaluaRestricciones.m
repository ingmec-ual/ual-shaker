function eval_res = evaluaRestricciones(q,params)
    % function that evaluates the constriants
        % q = position vector
        % l = bar length vector
        % x = fixed point positions
    %variable extraction
    x1 = q(1) ;y1 = q(2);x2 = q(3);y2 = q(4); theta = q(5);
    LA1 = params.Bar_Length(1); L12 = params.Bar_Length(2); L2B = params.Bar_Length(3);
    xA = params.fixed_points(1); yA = params.fixed_points(2); xB = params.fixed_points(3); yB = params.fixed_points(4);

    % coordinate vector: [x1,y1, x2, y2, theta]
    if abs(sin(theta)) < 0.7
        eval_res = [(xA-x1)^2 + (yA-y1)^2 - LA1^2;
                    (x1-x2)^2 + (y1-y2)^2 - L12^2;
                    (xB-x2)^2 + (yB-y2)^2 - L2B^2;
                    y1-yA-LA1*sin(theta)];
    else
        eval_res = [(xA-x1)^2 + (yA-y1)^2 - LA1^2;
                    (x1-x2)^2 + (y1-y2)^2 - L12^2;
                    (xB-x2)^2 + (yB-y2)^2 - L2B^2;
                    x1-xA-LA1*cos(theta)];
    end
end