function s5vifreg = s5vifreg(x,Ep,Em,num,b,Lb,h,rho,sigmcrit)
syms S5;
eqn=(regstress(x,Ep,Em,num,b,Lb,h,S5,rho)==sigmcrit);
soln=vpasolve(eqn,S5);
s5vifreg=double(soln);
end