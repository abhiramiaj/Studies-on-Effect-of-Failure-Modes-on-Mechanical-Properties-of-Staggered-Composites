function s5vifregBzer = s5vifregBzer(x,Ep,Em,num,b,Lb,h,rho,taumcrit)
syms S5;
eqn=(regstressBzer(x,Ep,Em,num,b,Lb,h,S5,rho)==taumcrit);
soln=vpasolve(eqn,S5);
s5vifregBzer=double(soln);
end