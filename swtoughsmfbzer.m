function swtoughsmfbzer =swtoughsmfbzer(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
E = Eswkim(n,Ep,Em,num,b,Lb,h,rho);
SMP1=swstrengthfmf(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit);
sig1Bneq0=SMP1*taumcrit;
SMP2=swstrengthsmfBzer(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit);
sig2=SMP2*taumcrit;
EBeq0=EswkimBzer(n,Ep,Em,num,b,Lb,h,rho);
sig1bzer=sig1Bneq0*EBeq0/E;
e1=sig1Bneq0/E;
e2=sig2/EBeq0;
tough=(0.5*sig2*e2);
wp=(sigpcrit.^2)./(2*Ep);
swtoughsmfbzer=tough/wp;
end





