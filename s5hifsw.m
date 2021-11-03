function s5hifsw = s5hifsw(x,n,Ep,Em,num,b,Lb,h,rho,taumcrit)
syms S5;
eqn=(swshear1(x,n,Ep,Em,num,b,Lb,h,S5,rho)==taumcrit);
soln=vpasolve(eqn,S5);
s5hifsw=double(soln);
end
