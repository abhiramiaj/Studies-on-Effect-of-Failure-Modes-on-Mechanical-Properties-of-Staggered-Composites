%%FIRST FAILURE MODE IN A REGULARLY STAGGERED COMPOSITE
%%to find toughness ratio before and after vif
%%updated on 6th jan 2020
%The extra portion of area introduced by including the first mode of
%failure is A1
%%A11=0.5*sig1^2/2Ebeforevif
%%A12=0.5*sig1Bzer*epsilon1
%A1=A11-A12
%%A2= (sig1,B=0+sig2,B=0/2)   * (epsilon3-epsilon2)  
%%Refer Thesis Diary for explanations
% after vif B=0 in kims model
%%%%%%%%%%%%%%%%ONLY VIF IS CONSIDERED!!!!!!!!!!!!!!!
% of a reg stagg comp under vif and  hif criteria using Kim s
%%exact model
function A1toA2regsmf= A1toA2regsmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
E = Eregkim(Ep,Em,num,b,Lb,h,rho);
EBzer = EregkimBzer(Ep,Em,num,b,Lb,h,rho); %E after vif%Assuming both vertical and horizontal matrix thicknesses are the same
sig1=(regstrengthfmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit))*taumcrit;
epsilon1=sig1/E;
sig1Bzer=epsilon1*EBzer;
sig2=(regstrengthsmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit))*taumcrit;
epsilon2=sig2/EBzer;
if epsilon2>epsilon1
    A11=0.5*sig1*epsilon1;
    A12=0.5*sig1Bzer*epsilon1;
    A1=A11-A12;
    %A2=(sig1Bzer+sig2)*0.5*(epsilon2-epsilon1);%trapezoid BCDE, now
    %changed to triangle ODE
    A2=0.5*sig2*epsilon2;
else
    A11=0.5*sig1*epsilon1;
    A12=0.5*sig2*epsilon2;
    A1=A11-A12;
    A2=A12;
end
A1toA2regsmf=A1/A2;
end





