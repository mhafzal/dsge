%/////////////////////////////////////////////////////////////
%////    The Clarida-Gali-Gertler model	- Log-linearized  ////
%////    Based upon lecture notes of Lawrence Christiano  ////
%////    Author:   Willi Mutschler (willi@mutschler.eu)   ////
%////    Version: June 13, 2014					   		  ////
%////	 Goal: Practicing Dynare                     	  ////
%////    !!    Don't forget the semicolons  !!            ////
%/////////////////////////////////////////////////////////////

close all;
% Set seed for random number generator, if you want to replicate your results
rng(123);

%% Set this variable for which exercise to do (this is just for convenience), no semicolon
% exercise = 1: Just preprocess model
% exercise = 2: Compute IRF for next 7 periods
% exercise = 3: Compute IRF for next 7 periods, call external plots function
% exercise = 4: Do calculations with phi_pie=0.99, explain error
% exercise = 5: Replace monetary policy rule with r = r_nat
% exercise = 6: Replace monetary policy rule with optimal monetary policy
% exercise = 7: Simulate data
% exercise = 8: Maximum likelihood estimation big sample
% exercise = 9: Maximum likelihood estimation small sample
% exercise = 10: Bayesian estimation
@#define exercise = 2

%% ----------------------------------------------------------------
% 1. Declare variables and parameters. Dont'forget semicolon!
%----------------------------------------------------------------
    %var pie x r da tau r_nat y_nat dy y a; % DECLARATION OF THE ENDOGENOUS VARIABLES
    var pie x r r_nat tau dy da;
    varexo eps_a eps_tau;                % DECLARATION OF THE STRUCTURAL INNOVATIONS
    varobs pie dy;                       % DECLARATION OF THE OBSERVABLE VARIABLES
    parameters phi beta phi_x phi_pie alpha rho_a rho_tau sig_a sig_tau kappa; % DECLARATION OF THE PARAMETERS AND CALIBRATION

%% ----------------------------------------------------------------
% 2. Set values for parameters
%----------------------------------------------------------------
    beta    = 0.97;
    phi_x   = 0;
    phi_pie = 1.5;
    alpha   = 0;
    rho_a     = 0.2;
    rho_tau  = 0.5;
    phi     = 1;
    theta   = 0.75;
    sig_a   = 0.02;
    sig_tau = 0.02;
    % Some parameters change in exercises
    @#if exercise == 4
        phi_pie=0.99;
    @#endif    
    @#if exercise == 7
        phi_x = 0.15; alpha = 0.8; rho_a = 0.9;
    @#endif
    @#if exercise == 8
        phi_x = 0.15; alpha = 0.8; rho_a = 0.9;
    @#endif
    
    % Auxiliary parameter
    kappa   = ((1-theta)*(1-beta*theta)*(1+phi))/(theta);
%% ----------------------------------------------------------------
% 3. Model equations. Don't forget:  model; ...  end;
%----------------------------------------------------------------
model;
    % Phillips curve
    pie = beta*pie(+1) + kappa*x;
    % IS-curve
    x = x(+1) - (r - pie(+1) - r_nat);
    % Monetary Policy Rule dependent on exercise
    @#if exercise == 5
        r = r_nat;        % Natural equilibrium
    @#endif
    @#if exercise == 6           
        r = r_nat + alpha*(r(-1)-r_nat(-1)) + (1-alpha)*(phi_pie*pie + phi_x*x);  % Optimal monetary policy
    @#endif
    @#if exercise < 5 || exercise > 6             
        r = alpha*r(-1) + (1-alpha)*(phi_pie*pie + phi_x*x);% Baseline Taylor rule
    @#endif
    % Technology shock
    da = rho_a*da(-1) + sig_a*eps_a;
    % Preference shock
    tau = rho_tau*tau(-1) + sig_tau*eps_tau;
    % Natural Rate
    r_nat = rho_a*da + (1-rho_tau)/(1+phi)*tau;
    % Output growth
    dy  = x - x(-1) + da - (tau - tau(-1))/(1+phi);
end;

%% ----------------------------------------------------------------
% 4. Specify shocks. Don't forget: shocks; ... end;
%----------------------------------------------------------------
 shocks;
     var eps_a; stderr 1;
     var eps_tau; stderr 1;     
 end;
% 
%% ----------------------------------------------------------------
% 5. Specify steady_state_model or initval. Don't forget ... end;
%----------------------------------------------------------------
% If you have analytical expressions for the steady state use steady_state_model, 
% else if you want to numerically find the SS, use initval and set initial values
steady_state_model;
pie=0; x=0; dy=0; da=0; tau=0; r_nat=0; r=0;
end;

%% ----------------------------------------------------------------
% 6. Computations, simulation and/or estimation
%----------------------------------------------------------------
    % Calculate steady-state, check Blanchard-Khan-conditions
	steady; check;
	
	@#if exercise == 2
        stoch_simul(order=1,irf=7);
    @#endif
    
    @#if exercise == 3
        stoch_simul(order=1,nocorr,nomoments,irf=7);
        plots;
    @#endif
    
    @#if exercise == 4
        stoch_simul(order=1,nocorr,nomoments,irf=7);
    @#endif
    
    @#if exercise == 5
        stoch_simul(order=1,nocorr,nomoments,irf=7);
    @#endif
    
    @#if exercise == 6
        stoch_simul(order=1,nocorr,nomoments,irf=7);
    @#endif
    
    @#if exercise == 7
        % Simulate 1000 periods
        stoch_simul(order=1,nocorr,nomoments,irf=0,periods=1000);    
        % Save data to excel file
        xlswrite('simdat.xls', pie(401:500),'Simulated data', 'B4:B103');
        xlswrite('simdat.xls', dy(401:500),'Simulated data', 'C4:C103');
		% Save data to mat file
        save('simdat','pie','dy');
        plot(dy(401:500));
    @#endif
    
    @#if exercise == 8         
        % Maximum-Likelihood-Estimation
        estimated_params;
            sig_a,   0.02, 0.001, 0.2;
            sig_tau, 0.02, 0.001, 0.2;
            rho_a,   0.1, 0.001, 0.99;
            rho_tau, 0.1, 0.001, 0.99;  
        end;
        estimation(order=1,datafile=simdat,nobs=1000,first_obs=1,nograph);        
   @#endif

    @#if exercise == 9      
        % Maximum-Likelihood-Estimation
        estimated_params;
            sig_a,   0.02, 0.001, 0.2;
            sig_tau, 0.02, 0.001, 0.2;
            rho_a,   0.9, 0.001, 0.99;
            rho_tau, 0.5, 0.001, 0.99;  
        end;
        estimation(order=1,datafile=simdat,nobs=50,first_obs=551,nograph);        
   @#endif
   
   @#if exercise == 10
       %Bayesian estimation
        estimated_params;
           sig_a, inv_gamma_pdf,0.02,10;
           sig_tau, inv_gamma_pdf,0.02,10;
           rho_a, beta_pdf, 0.9, .04;
           rho_tau, beta_pdf, 0.5, .04; 
        end;
        estimation(order=1,datafile=simdat,first_obs=51,nobs=100,mode_check,mh_replic=1000,mh_jscale=1.5,mh_nblocks=1);
   @#endif
   
  

