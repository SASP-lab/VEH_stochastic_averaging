function veh(r,d,a,kappa2,name_stat,nsim)

%clc
%clear
%close all
rng(1111)

N= 6000; %Sample points*
dt= 0.025; %Time step

To= N*dt; %Total duration in time
tt= 0:dt:dt*(N-1); %time-domain discretization

T=1;

% m=1;
% c=0.01;
% k=100; %100
% d=1000; %100
% r=-1;
% kappa2=0.1;
% a=10;

%name_stat='mcs_stat_duff_d50.mat';
%d=50; %100
m=1;
c=0.1;
k=100; %100
%r=1;
%kappa2=0.1;
%a=10;

S0=(c*k/pi);

kappa = sqrt(kappa2);

X0 = [];
DX0 = [];
%figure
%hold on
stationary=true;

wmax = pi/dt;
m=800;
dw = wmax/m;

tic
%nsim = 300;
Ays = zeros(nsim,1);
y = zeros(nsim,length(tt));
Xsave = zeros(size(tt));
Ysave = zeros(size(tt));
DXsave = zeros(size(tt));
parfor i=1:nsim
    disp(i)

    if stationary
        w=sqrt(2*pi*S0/dt).*wgn(N,1,0)'; 
    else
        w=zeros(N,1); 
        for ii=1:m
            EPS=(1*((ii*dw/5/pi)^2).*exp(-0.15.*(tt)).*(tt.^2).*exp(-((ii*dw/5/pi)^2).*tt));
            w= w + (((4*dw.*EPS).^0.5).*cos((ii*dw).*tt - (2*pi)*rand))'; 
        end
    end
    
    tspan= [0 tt(end)];
    x0= [0 0 0];
    [t1,response] = ode45(@(t,x) fun_veh(t,x,c,k,r,d,kappa2,a,w,tt),tspan,x0);

    X = interp1(t1,response(:,1),tt,'pchip');
    DX = interp1(t1,response(:,2),tt,'pchip');
    Y = interp1(t1,response(:,3),tt,'pchip');
    
    %if ~stationary
    %    y(i,:) = Y;
    %    %y(i,:) = X;
    %end
    if i==1
        Xsave(i,:)=X;
        DXsave(i,:)=DX;
        Ysave(i,:)=Y;
    end
    
    if d<0
        xcr = sqrt(k/(3*abs(d)));

        %disp([d,max(X), xcr])
        if max(X)>1000
            yend(i) = NaN;
            Ay = NaN;
            Ays(i) = NaN;  
        else
            yend(i) = Y(end);
            Ay = abs(hilbert(Y));
            Ays(i) = Ay(end-100);  
        end

    else    
        yend(i) = Y(end);
        Ay = abs(hilbert(Y));
        Ays(i) = Ay(end-100);  
    end
 
end
toc

%%
clear name_file1a name_proc1a 

AYsave=abs(hilbert(Ysave));
if stationary
    save(name_stat,'Ays','yend','d','r','kappa2','a','Xsave','Ysave','DXsave','AYsave','tt')
else
    for i=1:N
        v(i) = var(y(:,i));
    end
    save('mcs_nstat.mat')
end


%%
% kappa = sqrt(kappa2);
% omega0=(1-lam)*sqrt(k/m);
% beta0=c/m;
% S0=(c*k/pi);
% b1 = a + beta0;
% w0 = omega0;
% w02 = w0^2;
% w12 = a*beta0 + w02 + kappa.^2;
% wa2_ = @(A)(0.5*((w12 + 0.75*d*A.^2) + sqrt((w12 + 0.75*d*A.^2).^2 + 3*d*a.^2*A.^2)));
% wa2 = @(A)(abs(wa2_(A)));
% 
% 
% v(1)=0;
% h(1)=0;
% for i=2:numel(Y)
%     v(i)=trapz(tt(1:i),Y(1:i));
%     h(i)=w12*Y(i) + a*w02*v(i) + d*(Y(i) + a*v(i)).^3;
% end
