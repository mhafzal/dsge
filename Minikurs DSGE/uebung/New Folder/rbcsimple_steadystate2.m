function [ys_, params, info] = rbcsimple_steadystate2(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(1)=exo_(1)/(1-params(4));
    ys_(2)=((1/params(1)-1+params(3))/(params(2)*exp(ys_(1))))^(1/(params(2)-1));
    ys_(3)=exp(ys_(1))*ys_(2)^params(2)-params(3)*ys_(2);
    ys_(4)=0;
    % Auxiliary equations
    check_=0;
end
