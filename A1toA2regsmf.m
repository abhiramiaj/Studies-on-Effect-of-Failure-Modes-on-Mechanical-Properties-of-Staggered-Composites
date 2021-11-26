%Function to find Area ratio at second failure for a regular staggered composite
function A1toA2regsmf= A1toA2regsmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
E = Eregkim(Ep,Em,num,b,Lb,h,rho);
EBzer = EregkimBzer(Ep,Em,num,b,Lb,h,rho); %E after VIF
sig1=(regstrengthfmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit))*taumcrit;
epsilon1=sig1/E;
sig1Bzer=epsilon1*EBzer;
sig2=(regstrengthsmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit))*taumcrit;
epsilon2=sig2/EBzer;
if epsilon2>epsilon1
    A11=0.5*sig1*epsilon1;
    A12=0.5*sig1Bzer*epsilon1;
    A1=A11-A12;
    A2=0.5*sig2*epsilon2;
else
    A11=0.5*sig1*epsilon1;
    A12=0.5*sig2*epsilon2;
    A1=A11-A12;
    A2=A12;
end
A1toA2regsmf=A1/A2;
end





