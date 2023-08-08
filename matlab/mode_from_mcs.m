clc
clear
close all

vmode=0.8;
% Get mode
namef ='mcs_stat_lin_proc.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(1) = xx(pmax);
vary(1) = var(yend);

namef ='mcs_stat_duff_proc_d25.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(2) = xx(pmax);
vary(2) = var(yend);

namef ='mcs_stat_duff_proc_d50.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(3) = xx(pmax);
vary(3) = var(yend);

namef ='mcs_stat_duff_proc_d75.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(4) = xx(pmax);
vary(4) = var(yend);

namef ='mcs_stat_duff_proc_d100.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(5) = xx(pmax);
vary(5) = var(yend);

namef ='mcs_stat_duff_proc_d150.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(6) = xx(pmax);
vary(6) = var(yend);


namef ='mcs_stat_duff_proc_d200.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(7) = xx(pmax);
vary(7) = var(yend);

namef ='mcs_stat_duff_proc_d300.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(8) = xx(pmax);
vary(8) = var(yend);

namef ='mcs_stat_duff_proc_d400.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(9) = xx(pmax);
vary(9) = var(yend);

namef ='mcs_stat_duff_proc_d500.mat';
load(namef);
maxp = max(p);
idx = p>vmode*maxp;
b = polyfit(A(idx),p(idx),2);
xx=A(idx);
yy=polyval(b,A(idx));
[~,pmax]=max(yy);
mode1(10) = xx(pmax);
vary(10) = var(yend);

stdy = sqrt(vary);
save('mcs_mode.mat','mode1','stdy')

