function s1 = regshear(x,Ep,Em,num,b,Lb,h,s5,rho) %bottom value default
n=2;
Lp=rho*b*2;
% x=0:0.1:La 
%%% L is the length of stairwise RVE model
L=Lp+(2*Lb);
La1=(L./n)-(2*Lb);
La2=(L*(n-1)./n)-(2*Lb);
Gm=Em/(2*(1+num));
phi=(2*b)/((2*b)+h);
La=La1;
rho1=La./b;
al=Gm./Ep;
bet=Em./Ep;
zet=Lb./La;
G=1-bet+(2*bet/phi);
T=1+bet-(2*bet/phi);
A=0.5*rho1.*sqrt(al).*sqrt(phi./(1-phi));
B=bet./(phi.*zet);
dr=(2*A*sinh(A))+(B*cosh(A));

if ((x>=0) && (x<=La))
nr1=T*cosh(A*(La-(2*x))./La); %%bottom ; max occurs at La+2Lb ; same for bottom also
nrt1=T*cosh(A*(-La+(2*x))./La); %%top
s1=s5*al*(La/h)*nr1/dr;
s1t=s5*al*(La/h)*nrt1/dr;
elseif ((x>La) && (x<=La+(2*Lb)))
    nruni=T*cosh(-A); %% uniform shear at the region  La to La+2Lb; bottom
    nrunit=T*cosh(A); %% uniform shear at the region  La to La+2Lb; top
s1=s5*al*(La/h)*nruni/dr;
s1t=s5*al*(La/h)*nrunit/dr;
else
nr2=T*cosh(A*((2*x)-(3*La)-(4*Lb))./La);
nrt2=T*cosh(A*((-2*x)+(3*La)+(4*Lb))./La);
s1=s5*al*(La/h)*nr2/dr;
s1t=s5*al*(La/h)*nrt2/dr;
end
end




