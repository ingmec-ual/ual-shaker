% This function evaluates the jacobian of the constraints
function phiq = jacob (q,MBK)
    % q: coordinates
    % l: bar length vector
    % x: fixed points positions
    x1 = q(1); y1 = q(2); x2 = q(3); y2 = q(4); theta = q(5);
    LA1 = MBK.Bar_Length(1); L12 = MBK.Bar_Length(2); L2B = MBK.Bar_Length(3);
    xA = MBK.fixed_points(1); yA = MBK.fixed_points(2); xB = MBK.fixed_points(3); yB = MBK.fixed_points(4); 
    if abs(sin(theta)) < 0.7
        phiq = [-2*(xA-x1), -2*(yA-y1), 0, 0, 0;
            2*(x1-x2), 2*(y1-y2), -2*(x1-x2), -2*(y1-y2), 0;
            0, 0, -2*(xB-x2), -2*(yB-y2), 0;
            0, 1, 0, 0, -LA1*cos(theta)];
    else
        phiq = [-2*(xA-x1), -2*(yA-y1), 0, 0, 0;
            2*(x1-x2), 2*(y1-y2), -2*(x1-x2), -2*(y1-y2), 0;
            0, 0, -2*(xB-x2), -2*(yB-y2), 0;
            1, 0, 0, 0, LA1*sin(theta)];
    end
end