function [imin,imax] = estabilidad (x,porcentaje)

x = abs (x);
[xm,im]=max(x);
th = porcentaje*xm;

    i = im;
    while ( i> 1 && x(i)> th)
        i = i-1;
    end
    
    imin = i;

    k = im;
    while ( k<length(x) && x(k)> th)
        k = k+1;
    end

    imax = k;

end 
