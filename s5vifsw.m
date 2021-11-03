function s5vifsw = s5vifsw(x,n,Ep,Em,num,b,Lb,h,rho,sigmcrit)
syms S5;
eqn=(swstress1(x,n,Ep,Em,num,b,Lb,h,S5,rho)==sigmcrit);
soln=vpasolve(eqn,S5);
s5vifsw=double(soln);
end