function s5pfregBzer = s5pfregBzer(x,Ep,Em,num,b,Lb,h,rho,sigpcrit)
syms S5;
eqn=(regstressBzer(x,Ep,Em,num,b,Lb,h,S5,rho)==sigpcrit);
soln=vpasolve(eqn,S5);
s5pfregBzer=double(soln);
end