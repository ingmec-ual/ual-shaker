function [ J ] = phit(params)
% Derivada parcial de \Phi_t
omega=params.omega;

J(1,1)=0;
J(1,2)=0;
J(1,3)=0;
J(1,4)=-omega;
end