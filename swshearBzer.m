function t = swshearBzer(x,n,Ep,Em,num,b,Lb,h,sigpcrit,rho)
%bottom value is taken as default function output, max. at x=La1
Lp=rho*b*2;
%%% L is the length of stairwise RVE model
L=Lp+(2*Lb);
La1=(L./n)-(2*Lb);
La2=(L*(n-1)./n)-(2*Lb);
Gm=Em/(2*(1+num));
phi=(2*b)/((2*b)+h);
rho1=La1./b;
rho2=La2./b;
al=Gm./Ep;
bet=Em./Ep;
zet1=Lb./La1;
zet2=Lb./La2;
A1=0.5*rho1.*sqrt(al).*sqrt(phi./(1-phi));
A2=0.5*rho2.*sqrt(al).*sqrt(phi./(1-phi));
B1=0;
B2=0;
G=1-bet+(2*bet/phi);
T=1+bet-(2*bet/phi);
s5=s5pfswBzer(La1+(2*Lb),n,Ep,Em,num,b,Lb,h,rho,sigpcrit);
adnr=(T.*al.*(La1./h)*s5);
bcnr=(T.*al.*(La2./h)*s5);
addr=(2*A1.*sinh(A1))+(B1*cosh(A1));
bcdr=(2*A2.*sinh(A2))+(B2*cosh(A2));
s5=s5pfsw(La1+(2*Lb),n,Ep,Em,num,b,Lb,h,rho,sigpcrit);
xa=(A1*((2*n*(x+Lb))-L))./(L-(2*n*Lb));
xb=(A2*(((n+1).*L)-(2*n*(Lb+x))))./((L*(n-1))-(2*n*Lb));
xc=(A2*((2*n*(x+Lb))-((n-1)*L)))./(((n-1)*L)-(2*n*Lb));
xd=(A1*((L*((2*n)-1))-(2*n*(x+Lb))))./(L-(2*n*Lb));
if(x>=0 && x<La1)
ta=(adnr*cosh(xa))./addr; %bottom
t_bot=ta;
elseif (x>=La1 && x<La1+(Lb))
ta=(adnr*cosh(-A1))./addr;%uniform shear, bottom tub
t_bot=ta;
end
if(x>=0 && x<La2)
tc=(bcnr*cosh(xc))./bcdr; %top
t_top=tc;
elseif (x>=La2 && x<La2+(Lb))
tc=(bcnr*cosh(-A2))./bcdr;%uniform shear at top tut
t_top=tc;
end
if (x>=La1+(Lb) && x<La1+(2*Lb))
tb=(adnr*cosh(-A1))./addr;%uniform shear, bottom tub
t_bot=tb;
elseif x>=La1+(2*Lb) && x<=Lp
tb=(bcnr*cosh(xb))./bcdr;
t_bot=tb;
end
if (x>=La2+(Lb) && x<La2+(2*Lb))
td=(bcnr*cosh(-A2))./bcdr;%uniform shear at top tut
t_top=td;
elseif x>=La2+(2*Lb) && x<=Lp
td=(adnr*cosh(xd))./addr;
t_top=td;
end
t=t_bot;
end





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
