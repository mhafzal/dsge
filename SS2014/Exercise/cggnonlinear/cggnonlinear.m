%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'cggnonlinear';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('cggnonlinear.log');
M_.exo_names = 'eps_a';
M_.exo_names_tex = 'eps\_a';
M_.exo_names_long = 'eps_a';
M_.exo_names = char(M_.exo_names, 'eps_tau');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_tau');
M_.exo_names_long = char(M_.exo_names_long, 'eps_tau');
M_.endo_names = 'pie';
M_.endo_names_tex = 'pie';
M_.endo_names_long = 'pie';
M_.endo_names = char(M_.endo_names, 'dy');
M_.endo_names_tex = char(M_.endo_names_tex, 'dy');
M_.endo_names_long = char(M_.endo_names_long, 'dy');
M_.endo_names = char(M_.endo_names, 'x');
M_.endo_names_tex = char(M_.endo_names_tex, 'x');
M_.endo_names_long = char(M_.endo_names_long, 'x');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'rst');
M_.endo_names_tex = char(M_.endo_names_tex, 'rst');
M_.endo_names_long = char(M_.endo_names_long, 'rst');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names_long = char(M_.endo_names_long, 'tau');
M_.endo_names = char(M_.endo_names, 'da');
M_.endo_names_tex = char(M_.endo_names_tex, 'da');
M_.endo_names_long = char(M_.endo_names_long, 'da');
M_.param_names = 'v';
M_.param_names_tex = 'v';
M_.param_names_long = 'v';
M_.param_names = char(M_.param_names, 'epsi');
M_.param_names_tex = char(M_.param_names_tex, 'epsi');
M_.param_names_long = char(M_.param_names_long, 'epsi');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'betta');
M_.param_names_tex = char(M_.param_names_tex, 'betta');
M_.param_names_long = char(M_.param_names_long, 'betta');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'rho_tau');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau');
M_.param_names_long = char(M_.param_names_long, 'rho_tau');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'sig_a');
M_.param_names_tex = char(M_.param_names_tex, 'sig\_a');
M_.param_names_long = char(M_.param_names_long, 'sig_a');
M_.param_names = char(M_.param_names, 'sig_tau');
M_.param_names_tex = char(M_.param_names_tex, 'sig\_tau');
M_.param_names_long = char(M_.param_names_long, 'sig_tau');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'phi_pie');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pie');
M_.param_names_long = char(M_.param_names_long, 'phi_pie');
M_.param_names = char(M_.param_names, 'phi_x');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_x');
M_.param_names_long = char(M_.param_names_long, 'phi_x');
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 7;
M_.param_nbr = 13;
M_.orig_endo_nbr = 7;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'pie';
options_.varobs = char(options_.varobs, 'dy');
options_.varobs_id = [ 1 2  ];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('cggnonlinear_static');
erase_compiled_function('cggnonlinear_dynamic');
M_.lead_lag_incidence = [
 0 5 12;
 0 6 0;
 1 7 13;
 2 8 0;
 0 9 0;
 3 10 0;
 4 11 0;]';
M_.nstatic = 2;
M_.nfwrd   = 1;
M_.npred   = 3;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 4;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(13, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 27;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 4 ) = 0.97;
betta = M_.params( 4 );
M_.params( 13 ) = 0;
phi_x = M_.params( 13 );
M_.params( 12 ) = 1.5;
phi_pie = M_.params( 12 );
M_.params( 11 ) = 0;
alpha = M_.params( 11 );
M_.params( 8 ) = 0.2;
rho_a = M_.params( 8 );
M_.params( 7 ) = 0.5;
rho_tau = M_.params( 7 );
M_.params( 3 ) = 1;
phi = M_.params( 3 );
M_.params( 6 ) = 0.75;
theta = M_.params( 6 );
M_.params( 9 ) = 0.02;
sig_a = M_.params( 9 );
M_.params( 10 ) = 0.02;
sig_tau = M_.params( 10 );
M_.params( 2 ) = 2;
epsi = M_.params( 2 );
M_.params( 1 ) = 1-(M_.params(2)-1)/M_.params(2);
v = M_.params( 1 );
M_.params( 5 ) = (1-M_.params(6))*(1-M_.params(6)*M_.params(4))*(1+M_.params(3))/M_.params(6);
kappa = M_.params( 5 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.sigma_e_is_diagonal = 1;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 7;
options_.nocorr = 1;
options_.nomoments = 1;
options_.order = 1;
var_list_=[];
var_list_ = 'pie';
var_list_ = char(var_list_, 'dy');
info = stoch_simul(var_list_);
save('cggnonlinear_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('cggnonlinear_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('cggnonlinear_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('cggnonlinear_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('cggnonlinear_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
