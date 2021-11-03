function s = swstress(x,n,Ep,Em,num,b,Lb,h,sigpcrit,rho)
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
B1=bet./(phi.*zet1);
B2=bet./(phi.*zet2);
G=1-bet+(2*bet/phi);
T=1+bet-(2*bet/phi);
addr=(2*A1.*sinh(A1))+(B1*cosh(A1));
bcdr=(2*A2.*sinh(A2))+(B2*cosh(A2));
adnr=(G.*A1.*(sinh(A1)))+(B1.*cosh(A1));
bcnr=(G.*A2.*(sinh(A2)))+(B2.*cosh(A2));
% xb1=(A2*(((n+1).*L)-(2*n*(Lb+La1+(2*Lb)))))./((L*(n-1))-(2*n*Lb));%maximum stress occurs at x = La1+(2*Lb)
% xc1=(A2*((2*n*((La1+(2*Lb))+Lb))-((n-1)*L)))./(((n-1)*L)-(2*n*Lb));
% s5=sigpcrit/(0.5*((((bcnr+(T.*A2.*(sinh(xb1)))))./bcdr)+(((bcnr+(T.*A2.*(sinh(xc1)))))./bcdr)));
s5=s5pfsw(La1+(2*Lb),n,Ep,Em,num,b,Lb,h,rho,sigpcrit);
xa=(A1*((2*n*(x+Lb))-L))./(L-(2*n*Lb));
xb=(A2*(((n+1).*L)-(2*n*(Lb+x))))./((L*(n-1))-(2*n*Lb));
xc=(A2*((2*n*(x+Lb))-((n-1)*L)))./(((n-1)*L)-(2*n*Lb));
xd=(A1*((L*((2*n)-1))-(2*n*(x+Lb))))./(L-(2*n*Lb));
if(x>=0 && x<La1)
sa=(s5*(adnr+(T.*A1.*(sinh(xa)))))./addr;
s_bot=sa;
elseif (x>=La1 && x<La1+(Lb))
sa=s5;
s_bot=sa;
end
if(x>=0 && x<La2)
sc=(s5*(bcnr+(T.*A2.*(sinh(xc)))))./bcdr;
s_top=sc;
elseif (x>=La2 && x<La2+(Lb))
sc=s5;
s_top=sc;
end
if (x>=La1+(Lb) && x<La1+(2*Lb))
sb=s5;
s_bot=sb;
elseif x>=La1+(2*Lb) && x<=Lp
sb=(s5*(bcnr+(T.*A2.*(sinh(xb)))))./bcdr;
s_bot=sb;
end

if (x>=La2+(Lb) && x<La2+(2*Lb))
sd=s5;
s_top=sd;
elseif x>=La2+(2*Lb) && x<=Lp
sd=(s5*(adnr+(T.*A1.*(sinh(xd)))))./addr;
s_top=sd;
end
s=0.5*(s_top+s_bot);
end
