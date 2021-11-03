    function s1 = Eregkim(Ep,Em,num,b,Lb,h,ar)
%%vertical matrix thickness is assumed to be same as that of horizontal
%%matrix thickness so that Lb=h/2
%%Default value of E taken from Kim eqn 6
%%2b is the width of the platelet
Lp=ar*b*2;
% Lb=h/2;
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
%Ecomp_eqn7=Ep*phi*((A*sinh(A))+(B*cosh(A)))/(cosh(A)+(A*sinh(A))+(B*cosh(A)));
s1=Ecom_eqn6;
double(s1);
end





