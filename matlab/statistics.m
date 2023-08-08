clc
clear 
close all


name_file ='mcs_stat_lin.mat';
load(name_file)
mval1(1) = mean(Ays);
vval1(1) = var(Ays);
clear Ays

name_file ='mcs_stat_duff_d25.mat';
load(name_file)
mval1(2) = mean(Ays);
vval1(2) = var(Ays);
clear Ays

name_file ='mcs_stat_duff_d50.mat';
load(name_file)
mval1(3) = mean(Ays);
vval1(3) = var(Ays);
clear Ays

name_file ='mcs_stat_duff_d75.mat';
load(name_file)
mval1(4) = mean(Ays);
vval1(4) = var(Ays);
clear Ays

name_file ='mcs_stat_duff_d100.mat';
load(name_file)
mval1(5) = mean(Ays);
vval1(5) = var(Ays);
clear Ays

name_file ='mcs_stat_duff_d150.mat';
load(name_file)
mval1(6) = mean(Ays);
vval1(6) = var(Ays);
clear Ays

name_file ='mcs_stat_duff_d200.mat';
load(name_file)
mval1(7) = mean(Ays);
vval1(7) = var(Ays);
clear Ays

name_file ='mcs_stat_duff_d300.mat';
load(name_file)
mval1(8) = mean(Ays);
vval1(8) = var(Ays);
clear Ays

name_file ='mcs_stat_duff_d400.mat';
load(name_file)
mval1(9) = mean(Ays);
vval1(9) = var(Ays);
%clear Ays

name_file ='mcs_stat_duff_d500.mat';
load(name_file)
mval1(10) = mean(Ays);
vval1(10) = var(Ays);
clear Ays

save('stats.mat','mval1','vval1')
clear 




