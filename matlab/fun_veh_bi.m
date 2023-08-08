function x_dot= fun_veh_bi(t,x,c,k,lam,d,kappa,a,w,tt)

x_dot= zeros(3,1);

x_dot(1) = x(2);
x_dot(2) = interp1(tt,w,t,'linear') - c*x(2) - (-k.*x(1) + d.*x(1).^3) - kappa*x(3);
x_dot(3) = -a*x(3)+x(2);
