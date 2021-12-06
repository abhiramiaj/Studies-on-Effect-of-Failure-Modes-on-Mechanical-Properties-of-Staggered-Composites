% Stairwise staggered composite
clc
clear all;
figure
rho=12;
Ep=100e9;
Em=4e9;
num=0.49;
sigmcrit=35e6;
sigpcrit=1400e6;
taumcrit=20.16e6;
Gm=Em/(2*(1+num));
b=0.5;%2b is the width of platelet
Lb=0.03125;
vf=0.8;
h=0.25;
n1=sigpcrit/sigmcrit;
n2=sigpcrit/taumcrit;
Lp=2*b*rho;
hnol=Lb/((0.5*Lp)-Lb);
n=5;
vf1=2*rho*b*b/(((rho*b)+Lb)*((2*b)+h));
F=1*(n/(n-1))*((2*b)+(2*b*(1-vf)/vf)); %% equation obtained when sigavg is kept 1
syms S5
L1=Lp+(2*Lb);
p=1:1:n-1; %Does not work when n=1
Sum=0;
for q=1:numel(p)
 x(q)=(p(q)*L1/n)-Lb;
 f(q)=swstress1(x(q),n,Ep,Em,num,b,Lb,h,S5,rho);
 Sum=Sum+f(q);
end
Sum = Sum + swstress1(Lp,n,Ep,Em,num,b,Lb,h,S5,rho);
AvgStress=(Sum*2*b./(n*((2*b)+h)));
eqn=(AvgStress==1);
soln=vpasolve(eqn,S5);
double(soln);
s5=soln;
Sum1=0;
for q2=1:numel(p)
f(q2)=swstress1(p(q),n,Ep,Em,num,b,Lb,h,s5,rho);
Sum1=Sum1+f(q2);
end
AvgStress1=(Sum1*2*b./(n*((2*b)+h)));
x=0:0.1:Lp;
tauzhL=(n-1)*F/Lp; 
tauzhU=tauzhL/(n-1);
[skim, skimsh, szhang, tauzh1]=deal(zeros(size(x)));
z=Lp/n;
 for i=1:numel(x)
skim(i)=(swstress1(x(i),n,Ep,Em,num,b,Lb,h,s5,rho));
 end
plot(x,skim,'linewidth', 1.5);
hold on;
[v,T,vT]=xlsread('swstress03dec2021.xlsx','xyToExcel3');
% 'xlsx' for excel 2007
t=v(:,1);y1=v(:,7);
plot(t,y1,'linewidth', 1.5)
set(gcf,'color','w')
xlabel ('Distance along platelet', 'fontsize', 14)
ylabel ('Normalized Stress along platelet (\sigma)', 'fontsize', 14)
legend('Analytical (Eqn. 8)','FEA');
set(gca,'fontsize',14)
xlim([0,12])
ylim([1,1.45])
axis square

