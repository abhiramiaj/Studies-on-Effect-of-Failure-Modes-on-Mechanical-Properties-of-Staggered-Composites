function s1 = regstress(x,Ep,Em,num,b,Lb,h,s5,rho)
n=2;
Lp=rho*b*2;
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
if ((x>=0) && (x<La))
nr1=(G*A*sinh(A))+(B*cosh(A))+(T*A*sinh(A*((2*x)-La)./La));
s1=s5*nr1/dr;
elseif ((x>=La) && (x<(La+(2*Lb))))
        s1=s5;
    else
     
nr2=(G*A*sinh(A))+(B*cosh(A))+(T*A*sinh(A*((-2*(x-La-(2*Lb)))+La)./La));

s1=s5*nr2/dr;
end
end




