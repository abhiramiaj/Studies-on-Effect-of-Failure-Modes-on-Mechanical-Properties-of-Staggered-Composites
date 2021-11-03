function s5hifregBzer = s5hifregBzer(x,Ep,Em,num,b,Lb,h,rho,taumcrit)
syms S5;
eqn=(regshearBzer(x,Ep,Em,num,b,Lb,h,S5,rho)==taumcrit);
soln=vpasolve(eqn,S5);
s5hifregBzer=double(soln);
end
