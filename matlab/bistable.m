clc
clear
close all
rng(1111)

N= 2000; %Sample points*
dt= 0.05; %Time step

To= N*dt; %Total duration in time
tt= 0:dt:dt*(N-1); %time-domain discretization

T=1;

m=1;
c=0.1;
k=3;
d=1;
lam=0;
kappa = 1;
a=1;

S0=(c*k/pi);
X0 = [];
DX0 = [];
%figure
%hold on
stationary=true;

wmax = pi/dt;
m=400;
dw = wmax/m;

nsim = 4;
Ays = zeros(nsim,1);
for i=1:nsim
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
    [t1,response] = ode45(@(t,x) fun_veh_bi(t,x,c,k,lam,d,kappa,a,w,tt),tspan,x0);

    X = interp1(t1,response(:,1),tt,'pchip');
    DX = interp1(t1,response(:,2),tt,'pchip');
    Y = interp1(t1,response(:,3),tt,'pchip');

    y(i,:) = Y;
    %y(i,:) = X;
    
end

%%

for i=1:N
    
    v(i) = var(y(:,i));

end

if stationary
    save('mcs_stat.mat')
else
    save('mcs_nstat.mat')
end




