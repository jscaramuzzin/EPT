close all;
clear all;
clc;
%Sys ID vs simulink design optimization  

%% Sys ID nonlinear
%state space 
% Ax + f(x) + Bu
% [iq_dot; id_dot; wdot] = xdot
% A = [-Rs/Lq 0 -lambdam/Lq; 0 -Rs/Ld 0; 3Plambdam/4J  0 -b/J]
% x = [iq; id; w] states
% f(x) = [ -widLd/Lq; wiqLq/Ld ; 3P(Ld-Lq)iqid/4J]
% B = [1/Lq 0; 0 1/Ld; 0 0]
% u = [Vq Vd] inputs 
%y = Cx + h(x) -> T
% C = [3Plambdam/4  0 0]
%h(x) = 3P(Ld-Lq)iqid/4

%legend 
% iq : q axis components of stator current 
% id : d axis components of stator current 
% w : w = p*theta, angular velocity of rotation (rad/s)
% theta : electrical angle between a-axis and q-axis in degrees
% p : d/dt
% Rs : stator resistance 
% Ld : d-axis stator self inductance  
% Lq : q-axis stator self inductance 
% lambdam : peak flux linkage due to permanent magnet 
% P: number of poles of the motor
% J
% b
% Vq : q axis component of voltage 
% Vd : d axis component of voltage 
% T: torque 



%% how to use sys ID 
%want to measure torque, Vq and Vd
% to get Vq and Vd we need w, Ld,Id,Lq,Iq,Rs, lambdam
%ident to open the toolbox
%import data -> time domain data 
%name input and output (.Data)
% set sampling time  (.02)
%can label channels
%can preprocess to get rid of mean or set a filter etc
% choose estimation model 
% model output, compare 
% model estimations used will change throughout the process to find the
% best fit 
% (nonlinear model has two options ARX or hammerstein wiener)
%in the nonlinearity column (says piecewise linear to begin with) cna be
%changed to help with estimation ( for hammer)
%once all esimation has a best fit can export to workspace. 

%% how to use simulink design optimisation for parameter estimation 
%create simulink model 
% import input output data from testing 
% use place holder parameters for initial comparison of siumulink model and
% imported data
% in simulink-> analysis -> parameter esitmation 
% select paramters (4 yellow cubes icon) -> select paramters.. check boxes 
% specify boundaries for the parameters 
% new expieriement to import the measured data for output: (time vector, output)
% for input : (time, input)
%add plot : measured experiement data and simulation output. can also plot model reponse 
% add a parameter plot to see how they change 
% can change cost functon and other things 
% estimate (play)
%updated parameters should automatically change in the simulink model



%%
syms lambda_m Rs iq id w Lq Ld P J b 
