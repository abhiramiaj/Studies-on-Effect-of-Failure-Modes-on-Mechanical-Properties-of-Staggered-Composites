%%toughness ignoring first mode of failures 
%Kim B=0

% after vif B=0 in kims model
% of a reg stagg comp under vif and  hif criteria using Kim s
%%exact model
%Normalized with platelet toughness sigpcrit^2/2Epcrit
function regtoughsmfBzer =regtoughsmfBzer(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
E = Eregkim(Ep,Em,num,b,Lb,h,rho);
% Lb=h/2;%Assuming both vertical and horizontal matrix thicknesses are the same
SMP1=regstrengthfmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit);
sig1Bneq0=SMP1*taumcrit;
SMP2=regstrengthsmfBzer(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit);
sig2=SMP2*taumcrit;
EBeq0=EregkimBzer(Ep,Em,num,b,Lb,h,rho);
sig1bzer=sig1Bneq0*EBeq0/E;
e1=sig1Bneq0/E;
e2=sig2/EBeq0;
tough=(0.5*sig2*e2);
wp=(sigpcrit.^2)./(2*Ep);
regtoughsmfBzer=tough/wp;
end





