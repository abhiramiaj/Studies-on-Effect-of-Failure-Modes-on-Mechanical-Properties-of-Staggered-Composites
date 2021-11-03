%%Strength of a REGULARLY STAGGERED COMPOSITE  at second mode of failure
%strength at second mode of failure, 1st mof can be VIF or HIF
%%PUTTING B=0 IN KIM S EQUATIONS if VIF was the first mode of failure
%%Using eqns for continuous fibersr if HIF was the first mode of failure
%%to find avg strength (Normalized wrt taumcrit)
% of a reg stagg comp after failing under vif criteria using Kim s
%%exact model
function regstrengthsmf =regstrengthsmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
Lp=rho*2*b;
x1=Lp;
x2=(Lp/2)+Lb;
%La=(Lp/2)-Lb;
f1=regstress(x1,Ep,Em,num,b,Lb,h,sigpcrit,rho);   %%sig4
f2=regstress(x2,Ep,Em,num,b,Lb,h,sigpcrit,rho);
f5=(regshear(x2,Ep,Em,num,b,Lb,h,sigpcrit,rho)); %%taumax
double(f5);
double(f1);
%f6=f1./f5; %%sig4/taumax
f3=sigpcrit/f1; 
double(f3);
f7=sigmcrit/f1;%sigmcritical/sig4 VIF
f8=taumcrit/f5;%taumcritical/taumax  HIF
f9=sigpcrit/sigpcrit;%sigpcrit/sig5
p=min([f7 f8 f9]);

% 
% f10=sigmcrit/(regstressBzer(x1,Ep,Em,num,b,Lb,h,sigpcrit,rho));   %%sig4
% f5=(regshearBzer(x2,Ep,Em,num,b,Lb,h,sigpcrit,rho));



x3=Lp/2;
if (p==f7) %%%%%%%%%%%%%%%%%%%%IF VIF Occurred First%%%%%%%%%%%%%%%%%%%%%%%
 
s51=s5hifregBzer(x3,Ep,Em,num,b,Lb,h,rho,taumcrit);
double(s51);
%f10=regstressBzer(x1,Ep,Em,num,b,Lb,h,s51,rho); %%sig4 No need since
%vertical interface has already failed
f11=regshearBzer(x2,Ep,Em,num,b,Lb,h,s51,rho); %%taumax

%double(f10);
double(f11);

f13=taumcrit/f11;%taumcritical/taumax  HIFcriteria after VIF
f14=sigpcrit/s51;%sigpcrit/sig5, PF Criteria after VIF

if f13<f14
%disp('HIF after VIF');
s52=s5hifregBzer(x2,Ep,Em,num,b,Lb,h,rho,taumcrit);
f15=regstressBzer(x1,Ep,Em,num,b,Lb,h,s52,rho);
f16=regstressBzer(x3,Ep,Em,num,b,Lb,h,s52,rho);
AvgStress=((f15*(b))+(f16*b))./((2*b)+h);
%TotalF=((f1.*(b+h))+(f2.*b));
regstrengthsmf=AvgStress./taumcrit;
else
%disp('pF after VIF')
s52=sigpcrit;
f10=regstressBzer(x1,Ep,Em,num,b,Lb,h,s52,rho); %%Since PF possibly occurs aftr VIF
f11=regstressBzer(x2,Ep,Em,num,b,Lb,h,s52,rho);
AvgStress=((f10.*(b))+(f11.*b))./((2*b)+h);
%TotalF=((f1.*(b+h))+(f2.*b))
regstrengthsmf=AvgStress./taumcrit;  
end     
    

elseif (p==f8)
regstrengthsmf =regstrengthfmf(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    %modified on 2021 may 24, if hif occurs first,composite completelyfails,
%check KIM s equations: A represents horizontal interface, B represents vertical interface
%VIF occurs B set to zero, we get a set of equations
%HIF occurs, if A is set to zero, whole equation reduces to zero
%So, when HIF occurs first, the composite fails and smf strength is equal
%to fmf strength
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%disp('HIF');
% %disp('VIF after HIF')
% % only VIF is the criteria to check
% AvgStress=((sigmcrit.*4*b))./((4*b)+(2*h));%after hif, it acts as a continuous fiber comp 
% % can be assumed as a series arrangement of platelet and mati
% regstrengthsmf=AvgStress./taumcrit;

elseif (p==f9)
    
%disp('PF')
    s5=sigpcrit;
    %s5=s5vifreg(x1,Ep,Em,num,b,Lb,h,rho,sigmcrit);
f10=regstress(x1,Ep,Em,num,b,Lb,h,s5,rho); %%Since PF possibly occurs aftr VIF
f11=regstress(x2,Ep,Em,num,b,Lb,h,s5,rho);
AvgStress=((f10.*(b))+(f11.*b))./((2*b)+h);
%TotalF=((f1.*(b+h))+(f2.*b))
regstrengthsmf=AvgStress./taumcrit;
%disp('PF')
end
end






