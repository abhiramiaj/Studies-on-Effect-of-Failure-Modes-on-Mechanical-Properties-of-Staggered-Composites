function s5pfswBzer = s5pfswBzer(x,n,Ep,Em,num,b,Lb,h,rho,sigpcrit)
syms S5;
eqn=(swstressBzer1(x,n,Ep,Em,num,b,Lb,h,S5,rho)==sigpcrit);
soln=vpasolve(eqn,S5);
s5pfswBzer=double(soln);
end
