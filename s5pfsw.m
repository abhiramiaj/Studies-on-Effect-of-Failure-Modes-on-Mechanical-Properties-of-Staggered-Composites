function s5pfsw=s5pfsw(x,n,Ep,Em,num,b,Lb,h,rho,sigpcrit)
syms S5;
eqn=(swstress1(x,n,Ep,Em,num,b,Lb,h,S5,rho)==sigpcrit);
soln=vpasolve(eqn,S5);
s5pfsw=double(soln);
end