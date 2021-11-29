%%Second FAILURE MODE IN A SW STAGGERED COMPOSITE
% after vif B=0 in kims model
%%%For comparison, the updated values (after the fmf)of ratios are used.
function swstrengthsmf =swstrengthsmf(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
%E = Eswkim(Ep,Em,num,b,h,rho,n)
%Eaftrvif = EswkimBzer(Ep,Em,num,b,h,rho,n) %E after vif
Lp=rho*2*b;
%Lb=h/2%Assuming both vertical and horizontal matrix thicknesses are the same
L=Lp+(2*Lb);
L1=Lp+(2*Lb);

La1=(L./n)-(2*Lb);
x11=Lp;
x22=La1+(2*Lb);
f6=swstress(x11,n,Ep,Em,num,b,Lb,h,sigpcrit,rho);   %%sig4
f7=swshear(La1,n,Ep,Em,num,b,Lb,h,sigpcrit,rho) ;%%taumax
f10a=swstress(x22,n,Ep,Em,num,b,Lb,h,sigpcrit,rho); %%maximum stress in platelet
double(f6);
double(f7);
f8=sigmcrit/f6;%sig matrix critical/sig4 VIF
f9=taumcrit/f7;%taumcritical/taumax  HIF
f10=sigpcrit/f10a;%sigpcrit/sig5
p=min([f8 f9 f10]);


if (p==f8)%%%%%%%%%%%%%%%%%%%%IF VIF Occurred First%%%%%%%%%%%%%%%%%%%%%%%
s51=s5hifswBzer(x22,n,Ep,Em,num,b,Lb,h,rho,sigmcrit);
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
p=1:1:n-1; %Does not work when n=1
    Sum=0;
    for q=1:numel(p)
     x(q)=(p(q)*L1/n)-Lb;
     f(q)=swstressBzer1(x(q),n,Ep,Em,num,b,Lb,h,s52,rho);
     Sum=Sum+f(q);
    end
    Sum = Sum + swstressBzer1(Lp,n,Ep,Em,num,b,Lb,h,s52,rho);
    AvgStress=(Sum*2*b./(n*((2*b)+h)));
    double(AvgStress);

else
%disp('pF after VIF');
s52=s5pfswBzer(x22,n,Ep,Em,num,b,Lb,h,rho,sigpcrit);
    p=1:1:n-1; %Does not work when n=1
    Sum=0;
    for q=1:numel(p)
     x(q)=(p(q)*L1/n)-Lb;
     f(q)=swstressBzer1(x(q),n,Ep,Em,num,b,Lb,h,s52,rho);
     Sum=Sum+f(q);
    end
    Sum = Sum + swstressBzer1(Lp,n,Ep,Em,num,b,Lb,h,s52,rho);
    AvgStress=(Sum*2*b./(n*((2*b)+h)));
    double(AvgStress);
end
elseif(p==f9)%%%%%%%%%if HIF occurred first
swstrengthsmf=swstrengthfmf(n,Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit);
%disp('HIF');
return
%modified on 2021 may 24, if hif occurs first,composite completelyfails,
%check KIM s equations: A represents horizontal interface, B represents vertical interface
%VIF occurs B set to zero, we get a set of equations
%HIF occurs, if A is set to zero, whole equation reduces to zero
%So, when HIF occurs first, the composite fails and smf strength is equal
%to fmf strength
    
% %%disp('VIF after HIF')


elseif (p==f10)
%disp('PF');
    s52=s5pfsw(La1+(2*Lb),n,Ep,Em,num,b,Lb,h,rho,sigpcrit);
    p=1:1:n-1; %Does not work when n=1
    Sum=0;
    for q=1:numel(p)
     x(q)=(p(q)*L1/n)-Lb;
     f(q)=swstress1(x(q),n,Ep,Em,num,b,Lb,h,s52,rho);
     Sum=Sum+f(q);
    end
    Sum = Sum + swstress1(Lp,n,Ep,Em,num,b,Lb,h,s52,rho);
    AvgStress=(Sum*2*b./(n*((2*b)+h)));
    double(AvgStress);
end

swstrengthsmf=AvgStress/taumcrit;
end

