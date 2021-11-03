function s5hifswBzer = s5hifswBzer(x,n,Ep,Em,num,b,Lb,h,rho,taumcrit)
syms S5;
eqn=(swshearBzer1(x,n,Ep,Em,num,b,Lb,h,S5,rho)==taumcrit);
soln=vpasolve(eqn,S5);
s5hifswBzer=double(soln);
end
