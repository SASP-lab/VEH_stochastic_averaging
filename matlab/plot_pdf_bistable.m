clc
%clear
%close all




% m=1;
% c=0.01;
% k=100;
% d=1.5*1000/0.75;
% r=-1;
% kappa2=0.1;
% a=10;
% kappa = sqrt(kappa2);
% omega0=sqrt(k/m);
% beta0=c/m;
% S0=(c*k/pi);

% m=1;
% c=0.01;
% k=1;
% d=1.5*10/0.75;
% r=-1;
% kappa2=0.1;
% a=10;
% kappa = sqrt(kappa2);
% omega0=sqrt(k/m);
% beta0=c/m;
% S0=(c*k/pi);

% Linear
name_file1a ='mcs_stat_duff_d500.mat';
name_proc1a ='mcs_stat_duff_proc_d500.mat';
%name_file1a ='mcs_stat_lin.mat';
%name_proc1a ='mcs_stat_lin_proc.mat';
name_file1a ='mcs_stat_bi_d300.mat';
name_proc1a ='mcs_stat_bi_proc_d300.mat';
%name_file1a = 'mcs_stat_lin_a01.mat';
%name_proc1a = 'mcs_stat_lin_proc_a01.mat';
%name_file1a = 'mcs_stat_lin_kappa2.mat';
%name_proc1a = 'mcs_stat_lin_proc_kappa2.mat';

load(name_file1a)
name_proc=name_proc1a;
name_file=name_file1a;

%--- CHANGE d -----
%d0=0;
d0=d;
%d=1.5*d0/0.75;
m=1;
c=0.1;
k=100;
%r=1;
%kappa2=0.1;
%a=10;
kappa = sqrt(kappa2);
omega0=sqrt(k/m);
beta0=c/m;
S0=(c*k/pi);

%Ays(Ays(:)<0.2582)=[];

A = 0.003:0.001:3;
[p,A] = ksdensity(Ays(~isnan(Ays)),A,"width",0.01);

b1 = a + beta0;
w0 = omega0;




%w12_ = a*beta0 + abs(w02) + kappa.^2;
%wa20 = @(A)(0.5*((w12_ + 0.75*d*A.^2) + sqrt((w12_ + 1.5*d0*A.^2).^2 + 6*d0*a.^2*A.^2)));
if d<0
    Acr = sqrt((2/(3*(d0)))*(-(w12 + 2*a^2)+2*a*sqrt(w12+a^2)));
else
    Acr=Inf;
end

for i=1:numel(A)
    WA2(i)=wa2(A(i));
    if wa2(A(i)) <= 0.005
        
        g = @(xa)( (xa.*(w0^2)/(pi*S0)).*(-b1 + (a./((w0^2))).*((w02) + 1.5*d0*(xa.^2).*(1 + (a^2./(w0^2))))) );
        a1 = 0.001:0.001:A(i);
        Ga1 = g(a1);
        Ig = trapz(a1,Ga1);
        %Ig = integral(g,0,A(i));
        pAy(i)=sqrt(w0.^2).*A(i).*exp(Ig);
    else
        g = @(xa)( (xa.*wa2(xa)/(pi*S0)).*(-b1 + (a./(wa2(xa))).*(w02 + 1.5*d0*(xa.^2).*(1 + (a^2./wa2(xa))))) );
        a1 = 0.001:0.001:A(i);
        Ga1 = g(a1);
        Ig = trapz(a1,Ga1);
        %Ig = integral(g,0,A(i));
        pAy(i)=sqrt(wa2(A(i))).*A(i).*exp(Ig);

    end

end
pAy=real(pAy);
pAy(isnan(pAy))=0;
pAy = pAy / trapz(A,pAy);

pAy1=real(pAy1);
pAy1(isnan(pAy1))=0;
pAy1 = pAy1 / trapz(A,pAy1);

pAy2 = 1.5*pAy + 0.5*pAy1;
pAy2 = pAy2 / trapz(A,pAy2);

p = p / trapz(A,p);
hold on
semilogy(A,p,A,pAy1,A,pAy,A,pAy2)


save(name_proc,'A','p','pAy','Ays','yend')
%close all