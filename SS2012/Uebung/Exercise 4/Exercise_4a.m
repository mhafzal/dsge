%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
clear global
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'Exercise_4a';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'Exercise_4a.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'e_z';
M_.exo_names_tex = 'e\_z';
M_.exo_names = char(M_.exo_names, 'e_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_g');
M_.exo_names = char(M_.exo_names, 'e_R');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_R');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names = char(M_.endo_names, 'p');
M_.endo_names_tex = char(M_.endo_names_tex, 'p');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names = char(M_.endo_names, 'YGR');
M_.endo_names_tex = char(M_.endo_names_tex, 'YGR');
M_.endo_names = char(M_.endo_names, 'INFL');
M_.endo_names_tex = char(M_.endo_names_tex, 'INFL');
M_.endo_names = char(M_.endo_names, 'INT');
M_.endo_names_tex = char(M_.endo_names_tex, 'INT');
M_.param_names = 'tau';
M_.param_names_tex = 'tau';
M_.param_names = char(M_.param_names, 'kap');
M_.param_names_tex = char(M_.param_names_tex, 'kap');
M_.param_names = char(M_.param_names, 'psi1');
M_.param_names_tex = char(M_.param_names_tex, 'psi1');
M_.param_names = char(M_.param_names, 'psi2');
M_.param_names_tex = char(M_.param_names_tex, 'psi2');
M_.param_names = char(M_.param_names, 'rhoR');
M_.param_names_tex = char(M_.param_names_tex, 'rhoR');
M_.param_names = char(M_.param_names, 'rhog');
M_.param_names_tex = char(M_.param_names_tex, 'rhog');
M_.param_names = char(M_.param_names, 'rhoz');
M_.param_names_tex = char(M_.param_names_tex, 'rhoz');
M_.param_names = char(M_.param_names, 'r_A');
M_.param_names_tex = char(M_.param_names_tex, 'r\_A');
M_.param_names = char(M_.param_names, 'p_A');
M_.param_names_tex = char(M_.param_names_tex, 'p\_A');
M_.param_names = char(M_.param_names, 'gam_Q');
M_.param_names_tex = char(M_.param_names_tex, 'gam\_Q');
M_.param_names = char(M_.param_names, 'stdR');
M_.param_names_tex = char(M_.param_names_tex, 'stdR');
M_.param_names = char(M_.param_names, 'stdg');
M_.param_names_tex = char(M_.param_names_tex, 'stdg');
M_.param_names = char(M_.param_names, 'stdz');
M_.param_names_tex = char(M_.param_names_tex, 'stdz');
M_.param_names = char(M_.param_names, 'bet');
M_.param_names_tex = char(M_.param_names_tex, 'bet');
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 9;
M_.param_nbr = 14;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'YGR';
options_.varobs = char(options_.varobs, 'INFL');
options_.varobs = char(options_.varobs, 'INT');
options_.varobs_id = [ 7 8 9  ];
M_.Sigma_e = zeros(3, 3);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Exercise_4a_static');
erase_compiled_function('Exercise_4a_dynamic');
M_.lead_lag_incidence = [
 1 5 14;
 0 6 0;
 0 7 15;
 2 8 0;
 3 9 16;
 4 10 17;
 0 11 0;
 0 12 0;
 0 13 0;]';
M_.nstatic = 4;
M_.nfwrd   = 1;
M_.npred   = 1;
M_.nboth   = 3;
M_.equations_tags = {
};
M_.state_var = [1 4 5 6 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(14, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 34;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 2.000;
tau = M_.params( 1 );
M_.params( 2 ) = 0.150;
kap = M_.params( 2 );
M_.params( 3 ) = 1.500;
psi1 = M_.params( 3 );
M_.params( 4 ) = 1.000;
psi2 = M_.params( 4 );
M_.params( 5 ) = 0.600;
rhoR = M_.params( 5 );
M_.params( 7 ) = 0.650;
rhoz = M_.params( 7 );
M_.params( 6 ) = 0.950;
rhog = M_.params( 6 );
M_.params( 11 ) = 0.2;
stdR = M_.params( 11 );
M_.params( 12 ) = 0.8;
stdg = M_.params( 12 );
M_.params( 13 ) = 0.45;
stdz = M_.params( 13 );
M_.params( 9 ) = 4.000;
p_A = M_.params( 9 );
M_.params( 10 ) = 0.500;
gam_Q = M_.params( 10 );
M_.params( 8 ) = 0.400;
r_A = M_.params( 8 );
M_.params( 14 ) = 1/(1+M_.params(8)/400);
bet = M_.params( 14 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.sigma_e_is_diagonal = 1;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
global estim_params_
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 1, 2, 0, 4, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, 0.15, 0.1, 0.2, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, 1, 0.5, 1.5, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, 0.5, 0, 1, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, 0.5, 0, 1, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, 0.9, 0.5, 1, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 11, 0.5, 0, 1, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 13, 0.5, 0, 1, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 12, 0.5, 0, 1, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 9, 4, 3, 5, 0, NaN, NaN, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 10, 0.5, 0.3, 0.6, 0, NaN, NaN, NaN, NaN, NaN ];
steady;
check(M_,options_,oo_);
options_.first_obs = 1;
options_.order = 1;
options_.datafile = 'simdat1';
options_.nobs = 1000;
var_list_=[];
dynare_estimation(var_list_);
save('Exercise_4a_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
