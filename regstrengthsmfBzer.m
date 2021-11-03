%%Strength of a REGULARLY STAGGERED COMPOSITE  at second mode of failure
%strength at second mode of failure, 1st mof can be VIF or HIF
%%PUTTING B=0 IN KIM S EQUATIONS if VIF was the first mode of failure
%%Using eqns for continuous fibersr if HIF was the first mode of failure
%%to find avg strength (Normalized wrt taumcrit)
% of a reg stagg comp after failing under vif criteria using Kim s
%%exact model
function regstrengthsmfBzer =regstrengthsmfBzer(Ep,Em,num,b,Lb,h,rho,sigpcrit,sigmcrit,taumcrit)
Lp=rho*2*b;
x1=Lp;
x2=(Lp/2)+Lb;
x3=Lp/2;
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
regstrengthsmfBzer=AvgStress./taumcrit;
else
%disp('pF after VIF')
s52=sigpcrit;
f10=regstressBzer(x1,Ep,Em,num,b,Lb,h,s52,rho); %%Since PF possibly occurs aftr VIF
f11=regstressBzer(x2,Ep,Em,num,b,Lb,h,s52,rho);
AvgStress=((f10.*(b))+(f11.*b))./((2*b)+h);
%TotalF=((f1.*(b+h))+(f2.*b))
regstrengthsmfBzer=AvgStress./taumcrit;  
end     
end







