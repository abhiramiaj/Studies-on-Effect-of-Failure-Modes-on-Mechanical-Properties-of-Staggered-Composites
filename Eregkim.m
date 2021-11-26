%function to find out the stiffness of a regular staggered composite
function s1 = Eregkim(Ep,Em,num,b,Lb,h,ar)
Lp=ar*b*2;
La=(Lp/2)-Lb;
Gm=Em/(2*(1+num));
phi=(2*b)./((2*b)+h);
rho=La/b;
al=Gm/Ep;
bet=Em/Ep;
zet=Lb./La;
A=0.5*rho*sqrt(al)*sqrt(phi/(1-phi));
B=bet./(phi*zet);
sinhA=sinh(A);
coshA=cosh(A);
C=(B+((1-bet+(2*bet./phi)))*A*tanh(A));
D=phi+((1-phi)*bet)+(2*zet*phi);
E=(1-bet+(2*bet./phi)+(4*zet))*A*tanh(A);
F=1+bet+B;
Ecom_eqn6=Ep*(C.*D)./(E+F);
s1=Ecom_eqn6;
double(s1);
end





