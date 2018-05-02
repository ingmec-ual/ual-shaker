
function[Jd]=jacobderivadodinamica(v,q,params)
Jd=jacobderivado(v,q,params);
Jd(4,1:4)=zeros(1,4);
end
