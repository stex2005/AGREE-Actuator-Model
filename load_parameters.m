%-------------------------------------------------------------------------------

                    %%%% POLITECNICO DI MILANO %%%%
			  
       %%%% Mechanical Engineering - Mechatronics & Robotics %%%%
	

%-------------------------------------------------------------------------------
clearvars
% clearvars -except measure_glob
close all
format compact

%% 

% Initialization of Transfer Functions (tf)
s = tf('s');

% Time discretization
dt = 1e-3; % [s]

%% Data

g = 9.807; % [m/s^2]

%-----------------------------------
% Motor

Jm = 181 / (1000 * 10000); % [kg*m2]

k_phi = 36.9e-3; % [N*m/A]

La = 0.463e-3;  % [V*s/A] -> H
Ra = 0.608; % [V/A] -> Ohm

T_m_rated = 107.066 / 1000; % [Nm]

%-----------------------------------
% Encoder
step = 2048; % encoder [step/360°]
inc = 4; % Epos [inc/step]

%-----------------------------------
% Transmission
tau = 156; % [w_in/w_out]
eta = 0.7; % Constant efficiency
Tc = 0.2; % Coulomb Friction Torque [Nm]
Tbk = 0.3; % Break-Away Friction Torque [Nm]

%-----------------------------------
% Efficacy Compensation
eta_comp_scaling = 0.9;

%-----------------------------------
% Sensor (model)
m_sensor = 0.06; % [kg]

%-----------------------------------
% Load mass
m_g = 1; % [kg]
l_g = 0.1; % [m]

%-----------------------------------
% Measurement
f_samp = 1 / dt; % [Hz]

%----------------------------------

disp('Parameters loaded');
