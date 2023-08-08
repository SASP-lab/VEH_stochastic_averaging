clc
clear
close all

% Run MCS for Hard DUffing 
% r=1;
% kappa2=0.1;
% a=10;
% name_stat='mcs_stat_duff_d50.mat';
% d=50; 
% veh(r,d,a,kappa2,name_stat);
% 
% name_stat='mcs_stat_duff_d100.mat';
% d=100; 
% veh(r,d,a,kappa2,name_stat);
% 
% name_stat='mcs_stat_duff_d150.mat';
% d=150; 
% veh(r,d,a,kappa2,name_stat);
% 
% name_stat='mcs_stat_duff_d200.mat';
% d=200; 
% veh(r,d,a,kappa2,name_stat);
% 
% name_stat='mcs_stat_duff_d300.mat';
% d=300; 
% veh(r,d,a,kappa2,name_stat);
% 
% name_stat='mcs_stat_duff_d400.mat';
% d=400; 
% veh(r,d,a,kappa2,name_stat);
% 
% name_stat='mcs_stat_duff_d500.mat';
% d=500; 
% veh(r,d,a,kappa2,name_stat);

%%
% Run MCS for bi-stable
nsim=60000;
r=-1;
kappa2=20;
a=0.01;
%a=10;
%name_stat='mcs_stat_lin_a001.mat';
name_stat='mcs_stat_bi_k2_a001_d300.mat';
d=300; 
veh(r,d,a,kappa2,name_stat,nsim);

