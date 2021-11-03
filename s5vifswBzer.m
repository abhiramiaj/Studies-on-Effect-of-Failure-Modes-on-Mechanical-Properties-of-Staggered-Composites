function s5vifswBzer = s5vifswBzer(x,n,Ep,Em,num,b,Lb,h,rho,sigmcrit)
syms S5;
eqn=(swstress1(x,n,Ep,Em,num,b,Lb,h,S5,rho)==sigmcrit);
soln=vpasolve(eqn,S5);
s5vifswBzer=double(soln);
end