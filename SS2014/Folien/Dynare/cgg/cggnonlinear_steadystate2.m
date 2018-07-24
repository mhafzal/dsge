function [ys_, params, info] = cggnonlinear_steadystate2(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(2)=0;
    ys_(9)=0;
    ys_(3)=0;
    ys_(6)=1;
    ys_(12)=1/params(4);
    ys_(8)=1;
    ys_(7)=1/(1-params(4)*params(5));
    ys_(1)=ys_(7);
    ys_(4)=exp((-ys_(2))/(1+params(3)));
    ys_(5)=ys_(4)*ys_(8)*exp(ys_(3));
    ys_(10)=exp((-ys_(2))/(1+params(3)))*exp(ys_(3));
    ys_(11)=ys_(12);
    ys_(13)=0;
    % Auxiliary equations
    check_=0;
end
