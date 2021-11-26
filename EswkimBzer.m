%function to findout stiffness of stairwise staggered composite after VIF
function s1 = EswkimBzer(n,Ep,Em,num,b,Lb,h,ar)
L= (ar*b*2)+(2*Lb);
La1=(L/n)-(2*Lb);
La2=(L*(n-1)./n)-(2*Lb);
Gm=Em/(2*(1+num));
phi=(2*b)/((2*b)+h);
rho1=La1/b;
rho2=La2/b;
al=Gm/Ep;
bet=Em/Ep;
zet1=Lb/La1;
zet2=Lb/La2;
A1=0.5*rho1*sqrt(al)*sqrt(phi/(1-phi));
A2=0.5*rho2*sqrt(al)*sqrt(phi/(1-phi));
B1=0;
B2=0;
C1=(B1+((1-bet+(2*bet/phi)))*A1*tanh(A1));
C2=(B2+((1-bet+(2*bet/phi)))*A2*tanh(A2));
D1=phi+((1-phi)*bet)+(2*zet1*phi);
D2=phi+((1-phi)*bet)+(2*zet2*phi);
E1=(1-bet+(2*bet/phi)+(4*zet1))*A1*tanh(A1);
E2=(1-bet+(2*bet/phi)+(4*zet2))*A2*tanh(A2);
F1=1+bet+B1;
F2=1+bet+B2;
E1_eqn7=Ep*phi*((A1*sinh(A1)) + (B1*cosh(A1)))/(cosh(A1)+(A1*sinh(A1))+(B1*cosh(A1)));
E1_eqn6=Ep*(C1*D1)/(E1+F1);
E2_eqn7=Ep*phi*((A2*sinh(A2)) + (B2*cosh(A2)))/(cosh(A2)+(A2*sinh(A2))+(B2*cosh(A2)));
E2_eqn6=Ep*(C2*D2)/(E2+F2);
Ar1=(L*((2*b)+h))./n;
Ar2=((n-1)*L*((2*b)+h))./n;
A=Ar1+Ar2;
E_eqn6_el=((Ar1/(E1_eqn6*(A))+(Ar2/(E2_eqn6*(A))))).^-1;
s1=E_eqn6_el;
double(s1);
end


