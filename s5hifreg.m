function s5hifreg = s5hifreg(x,Ep,Em,num,b,Lb,h,rho,taumcrit)
syms S5;
eqn=(regshear(x,Ep,Em,num,b,Lb,h,S5,rho)==taumcrit);
soln=vpasolve(eqn,S5);
s5hifreg=double(soln);
end
