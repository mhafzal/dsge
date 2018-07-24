function [ys_, params, info] = rbcexamedited_steadystate2(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(5)=params(7);
    Y_K=(1/params(4)-1+params(5))/(ys_(5)*params(3));
    C_K=Y_K-params(5);
    L_K=(Y_K/ys_(5))^(1/(1-params(3)));
    Y_L=Y_K/L_K;
    C_L=C_K/L_K;
    ys_(1)=1/(1+C_L/(Y_L*ys_(5)*(1-params(3))*params(1)/(1-params(1))));
    ys_(2)=C_L*ys_(1);
    ys_(3)=ys_(1)/L_K;
    ys_(4)=Y_K*ys_(3);
    % Auxiliary equations
    check_=0;
end
