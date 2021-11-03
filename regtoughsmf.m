%%toughness including first and second modes of failures 
%%to find toughness (sig^2/E)_befvif +(sig^2/E)_aftrvif -(sig'^2/E_aftrvif)
%sig' = sigbefvif x Eaftrvif/ Ebefvif
% after vif B=0 in kims model
% of a reg stagg comp under vif and  hif criteria using Kim s
%%exact model
%Normalized with platelet toughness sigpcrit^2/2Epcrit
function regtoughsmf =regtoughsmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
E = Eregkim(Ep,Em,num,b,Lb,h,rho);
% Lb=h/2;%Assuming both vertical and horizontal matrix thicknesses are the same
SMP1=regstrengthfmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit);
sig1Bneq0=SMP1*taumcrit;
SMP2=regstrengthsmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit);
sig2=SMP2*taumcrit;
EBeq0=EregkimBzer(Ep,Em,num,b,Lb,h,rho);
sig1bzer=sig1Bneq0*EBeq0/E;
e1=sig1Bneq0/E;
e2=sig2/EBeq0;
wp=(sigpcrit.^2)./(2*Ep);
if SMP2==SMP1 %%%if PF occurred first
    regtoughsmf=(0.5*sig1Bneq0*e1)/wp;
    return
end
if(e1<e2)
    %disp('e1<e2')
    tough=(0.5*sig1Bneq0*e1)+(0.5*(sig2+sig1bzer)*(e2-e1));
else
    %disp('e1>e2')
    tough=(0.5*sig1Bneq0*e1);
end
regtoughsmf=tough/wp;
end





