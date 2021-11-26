%Function to find A1/A2 at second failure for a stairwise staggered model
function A1toA2swsmf= A1toA2swsmf(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
E = Eswkim(n,Ep,Em,num,b,Lb,h,rho);
EBzer = EswkimBzer(n,Ep,Em,num,b,Lb,h,rho); %E after vif%Assuming both vertical and horizontal matrix thicknesses are the same
sig1=(swstrengthfmf(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit))*taumcrit;
epsilon1=sig1/E;
sig1Bzer=epsilon1*EBzer;
sig2=(swstrengthsmf(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit))*taumcrit;
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
A1toA2swsmf=A1/A2;
end





