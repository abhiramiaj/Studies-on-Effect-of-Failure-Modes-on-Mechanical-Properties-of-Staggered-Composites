%%Second FAILURE MODE IN A SW STAGGERED COMPOSITE
%%to find ratio of strength before and after failure
%%vifand hif first occuring cases are considered in this code
% after vif B=0 in kims model
%after hif, only vif is expected and strength is calculated by assuming the
%composite as a continuous fiber type without the horizontal interface
% of a SW stagg comp under vif and  hif criteria using Kim s
%%exact model
%%%For comparison, the updated values (after the fmf)of ratios are used.
function swstrengthsmfBzer =swstrengthsmfBzer(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
%E = Eswkim(Ep,Em,num,b,h,rho,n)
%Eaftrvif = EswkimBzer(Ep,Em,num,b,h,rho,n) %E after vif
Lp=rho*2*b;
%Lb=h/2%Assuming both vertical and horizontal matrix thicknesses are the same
L=Lp+(2*Lb);
%L1=Lp+(2*Lb)
% x1=Lp
% x2=(4*L1/n)-Lb
% x3=(3*L1/n)-Lb
% x4=(2*L1/n)-Lb
% x5=(L1/n)-Lb
La1=(L./n)-(2*Lb);
% La1=(Lp/n)-(2*Lb) %changed on 2020aug12 See fig in zhang 2010 for explanation
%each platelet is shifted by Length of platelet/n including Lb
x11=Lp;
x22=La1+(2*Lb);

s51=s5vifswBzer(x11,n,Ep,Em,num,b,Lb,h,rho,sigmcrit);
f11=swshearBzer1(La1,n,Ep,Em,num,b,Lb,h,s51,rho); %%taumax after VIF, B=0
f13=taumcrit/f11;%taumcritical/taumax  HIFcriteria after VIF
f10b=swstressBzer1(x22,n,Ep,Em,num,b,Lb,h,s51,rho);
f14=sigpcrit/f10b;%sigpcrit/sig5, PF Criteria after VIF
double(f11);
double(f13);
double(f14);
if f13<f14
%disp('HIF after VIF');
s52=s5hifswBzer(La1,n,Ep,Em,num,b,Lb,h,rho,taumcrit);
else
%disp('pF after VIF');
s52=s5pfswBzer(x22,n,Ep,Em,num,b,Lb,h,rho,sigpcrit);
end
p=1:1:n-1; %Does not work when n=1
Sum=0;
for q=1:numel(p)
 x(q)=(p(q)*L/n)-Lb;
 f(q)=swstressBzer1(x(q),n,Ep,Em,num,b,Lb,h,s52,rho);
 Sum=Sum+f(q);
end
Sum = Sum + swstressBzer1(Lp,n,Ep,Em,num,b,Lb,h,s52,rho);
 AvgStress=(Sum*2*b./(n*((2*b)+h)));
double(AvgStress);
swstrengthsmfBzer=AvgStress/taumcrit;
end
