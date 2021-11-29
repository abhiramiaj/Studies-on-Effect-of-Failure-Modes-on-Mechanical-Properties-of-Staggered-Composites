%%FIRST FAILURE MODE IN A STAIRWISE STAGGERED COMPOSITE
%%to find avg strength (Normalized wrt sigmcrit or taumcrit or sigpcrit)
% of a sw stagg comp under vif and  hif criteria using Kim s
%%extended model
function swstrengthfmf =swstrengthfmf(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
Lp=rho*2*b;
L=Lp+(2*Lb);
La1=(L./n)-(2*Lb);
x11=Lp;
x22=La1;%+(2*Lb);%max. point of shear is more accurate at La1, at La1+2Lb, dip happens
f6=swstress(x11,n,Ep,Em,num,b,Lb,h,sigpcrit,rho);   %%sig4
f7=(swshear(x22,n,Ep,Em,num,b,Lb,h,sigpcrit,rho)); %%taumax
double(f6);
double(f7);
f8=sigmcrit/f6;%sigcritical/sig4 VIF
f9=taumcrit/f7;%taumcritical/taumax  HIF
f10=sigpcrit/sigpcrit;%sigpcrit/sig5
p=min([f8 f9 f10]);
if (p==f8) %%%VIF occurs
s5=s5vifsw(x11,n,Ep,Em,num,b,Lb,h,rho,sigmcrit); %s5 is found out by equating sigmcrit=normal stress at x=Lp
%disp('VIF')
elseif (p==f9)
s5=s5hifsw(La1,n,Ep,Em,num,b,Lb,h,rho,taumcrit); %max shear at bottom occurs at La1+2Lb; bot is default set value in swshear
%s5 is found out by equating maximum shear stress to the taumcritical of
%the matrix material
%disp('HIF')
else %remaining is platelet failure, p==f10
s5=s5pfsw(La1+(2*Lb),n,Ep,Em,num,b,Lb,h,rho,sigpcrit);
%disp('PF')
end
L1=Lp+(2*Lb);
p=1:1:n-1; %Does not work when n=1
Sum=0;
for q=1:numel(p)
 x(q)=(p(q)*L1/n)-Lb;
 f(q)=swstress1(x(q),n,Ep,Em,num,b,Lb,h,s5,rho);
 Sum=Sum+f(q);
end
Sum = Sum + swstress1(Lp,n,Ep,Em,num,b,Lb,h,s5,rho);
AvgStress=(Sum*2*b./(n*((2*b)+h)));
double(AvgStress);
swstrengthfmf=AvgStress./taumcrit;
end





