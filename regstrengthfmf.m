%%FIRST FAILURE MODE IN A REGULARLY STAGGERED COMPOSITE
%%to find avg strength (Normalized wrt sigmcrit or taumcrit or sigpcrit)
% of a reg stagg comp under vif and  hif criteria using Kim s
%%exact model
function regstrengthfmf =regstrengthfmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
% Lb=h/2;%Assuming both vertical and horizontal matrix thicknesses are the same
Lp=rho*2*b;
x1=Lp;
x2=(Lp/2)+Lb;
La=(Lp/2)-Lb;
f1=regstress(x1,Ep,Em,num,b,Lb,h,sigpcrit,rho);   %%sig4
%f2=regstress(x2,Ep,Em,num,b,Lb,h,s5,rho);
f5=(regshear(x2,Ep,Em,num,b,Lb,h,sigpcrit,rho)); %%taumax
double(f5);
double(f1);
%f6=f1./f5; %%sig4/taumax
f3=sigpcrit/f1; 
double(f3);
f7=sigmcrit/f1;%sigcritical/sig4 VIF
f8=taumcrit/f5;%taumcritical/taumax  HIF
f9=sigpcrit/sigpcrit;%sigpcrit/sig5
p=min([f7 f8 f9]);
x3=Lp/2;
if (p==f7)
s5=s5vifreg(x1,Ep,Em,num,b,Lb,h,rho,sigmcrit);
f10=regstress(x1,Ep,Em,num,b,Lb,h,s5,rho);
f11=regstress(x3,Ep,Em,num,b,Lb,h,s5,rho);
AvgStress=((f10.*(b))+(f11.*b))./((2*b)+h);
%disp('VIF');
%TotalF=((f1.*(b+h))+(f2.*b))
regstrengthfmf=AvgStress./taumcrit;
elseif (p==f8)
s5=s5hifreg(La+(2*Lb),Ep,Em,num,b,Lb,h,rho,taumcrit); %max shear occurs from La to La+2Lb
f10=regstress(x1,Ep,Em,num,b,Lb,h,s5,rho);
f11=regstress(x2,Ep,Em,num,b,Lb,h,s5,rho);
AvgStress=((f10.*(b))+(f11.*b))./((2*b)+h);
%TotalF=((f1.*(b+h))+(f2.*b))
regstrengthfmf=AvgStress./taumcrit;
%disp('HIF');
elseif (p==f9)
    s5=sigpcrit;
    %s5=s5vifreg(x1,Ep,Em,num,b,Lb,h,rho,sigmcrit);
f10=regstress(x1,Ep,Em,num,b,Lb,h,s5,rho);
f11=regstress(x2,Ep,Em,num,b,Lb,h,s5,rho);
AvgStress=((f10.*(b))+(f11.*b))./((2*b)+h);
%TotalF=((f1.*(b+h))+(f2.*b))
regstrengthfmf=AvgStress./taumcrit;
 %disp('PF');
end





