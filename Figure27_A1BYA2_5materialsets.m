
% % Code to plot the A1/A2 vs rho for a regularly staggered model at first
% % and second modes of failures + ratio of first and second mode strengths
% % for ten different material sets, keeping
% % zeta a constant to ensure sufficient overlapping even at lower aspect
% % ratios

rr=1:1:120;
[SMP1,SMP2,SMP3,SMP4,SMP5,Lb,h]=deal(zeros(size(rr)));

b=10; %%2b is the width of platelet
hnol= 1/50;
vf=0.8;
% Ecomp_eqn7=Ep*phi*((A*sinh(A))+(B*cosh(A)))/(cosh(A)+(A*sinh(A))+(B*cosh(A)));

figure 
Ep1=1200;
Em1=0.67; 
num1=0.4;
sigmcrit1=1;
sigpcrit1=40;
taumcrit1=0.576;

Ep2=1e5;
Em2=200;   
num2=0.4;
sigmcrit2=20;
sigpcrit2=200;
taumcrit2=11.52;

Ep3=2.2e5;
Em3=1100;
%num3=0.38;
num3=0.4;
sigmcrit3=30;
sigpcrit3=3250;
taumcrit3=17.3;


Ep4=2.2e5;
Em4=3000;
%num4=0.38;
num4=0.4;
sigmcrit4=40;
sigpcrit4=3250;
taumcrit4=23.1;


Ep5=1e5;
Em5=4000;  
num5=0.4;
sigmcrit5=20;
sigpcrit5=200;
taumcrit5=11.52;
subplot(1,2,1);
%%%MP1
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=(2*b*rr(i)*2*b./(vf*(0.5*2*b*rr(i) + Lb(i)))) - (2*b);
SMP1(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=A1toA2regsmf(Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
SMP3(i)=A1toA2regsmf(Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
SMP4(i)=A1toA2regsmf(Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
SMP5(i)=A1toA2regsmf(Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
end
plot(rr,SMP1,'linewidth',1.5)
hold on;
plot(rr,SMP2,'linewidth',1.5)
hold on;
plot(rr,SMP3,'linewidth',1.5)
hold on;
plot(rr,SMP4,'linewidth',1.5)
hold on;
plot(rr,SMP5,'linewidth',1.5)
hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('A_1/A_2, reg','fontweight','bold', 'fontsize', 15)
%of regularly staggered composite using Kim6 
axis square
set(gca,'fontsize',15)
ylim([0 0.02])
% xlim([0 40])
legend('MP1','MP2','MP3','MP4','MP5','MP6','MP7','MP8','MP9','MP10','fontsize',12)


%%sw function to be createdd!!!!!!!!!!!!!!!!!!!
rr=1:1:120;
subplot(1,2,2); 
%%MP1
n=5;
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=(2*b*rr(i)*2*b./(vf*(0.5*2*b*rr(i) + Lb(i)))) - (2*b);
SMP1(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=A1toA2swsmf(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
SMP3(i)=A1toA2swsmf(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
SMP4(i)=A1toA2swsmf(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
SMP5(i)=A1toA2swsmf(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
end
plot(rr,SMP1,'linewidth',1.5)
hold on;
plot(rr,SMP2,'linewidth',1.5)
hold on;
plot(rr,SMP3,'linewidth',1.5)
hold on;
plot(rr,SMP4,'linewidth',1.5)
hold on;
plot(rr,SMP5,'linewidth',1.5)
hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('A_1/A_2, sw','fontweight','bold', 'fontsize', 15)
%of regularly staggered composite using Kim6 
axis square
set(gca,'fontsize',15)
set(gcf,'color','w')
% ylim([0 12])
% xlim([0 40])
legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)
