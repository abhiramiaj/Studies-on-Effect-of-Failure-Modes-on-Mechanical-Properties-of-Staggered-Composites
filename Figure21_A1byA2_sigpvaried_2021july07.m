figure
Ep1=220e3;
Em1=1.1e3;
%Ep/Em set as 200
num1=0.38;
sigmcrit1=30;
taumcrit1=17.3;
sigpcrit1=[10*taumcrit1 25*taumcrit1 50*taumcrit1 100*taumcrit1 150*taumcrit1 200*taumcrit1];   
%taumcrit is 0.576 times sigmamcrit
subplot(1,2,1);
b=10;
hnol=1/50;
rr=1:1:120;
[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=2*Lb(i);
SMP1(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
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
plot(rr,SMP6,'linewidth',1.5)
hold on;


set(gca,'fontsize',15)

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('A_1/A_2, reg','fontweight','bold', 'fontsize', 15)

set(gcf,'color','w')
%of regularly staggered composite using Kim6 
axis square
legend('\sigma^p_{crit}=200','\sigma^p_{crit}=400','\sigma^p_{crit}=600','\sigma^p_{crit}=800','\sigma^p_{crit}=1000','\sigma^p_{crit}=1200','\sigma^p_{crit}=1400','fontsize',12)
lg1=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',11);
set(lg1,'Interpreter','latex')
subplot(1,2,2);
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=2*Lb(i);
SMP1(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
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
plot(rr,SMP6,'linewidth',1.5)
hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('A_1/A_2, sw','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
axis square
lg2=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',11);
set(lg2,'Interpreter','latex')