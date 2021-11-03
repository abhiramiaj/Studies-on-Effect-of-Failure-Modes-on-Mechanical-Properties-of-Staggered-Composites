figure
Em1=4000;
Ep1=[10*Em1 50*Em1 100*Em1 200*Em1 500*Em1 1000*Em1];
num1=0.38;

sigpcrit1=2500;
taumcrit1=2500/69.4;%25;
sigmcrit1=taumcrit1/0.576;%43.4;
%taumcrit is 0.576 times sigmamcrit
subplot(1,2,1);
b=10;
hnol=1/50;
rr=1:1:120;
[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=2*Lb(i);
SMP1(i)=A1toA2regsmf(Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=A1toA2regsmf(Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP3(i)=A1toA2regsmf(Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP4(i)=A1toA2regsmf(Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP5(i)=A1toA2regsmf(Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP6(i)=A1toA2regsmf(Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);

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
legend('E_p/E_m=10','E_p/E_m=50','E_p/E_m=100','E_p/E_m=200','E_p/E_m=500','E_p/E_m=1000','Zhang et al.,2010, E_p/E_m=10','fontsize',12)

subplot(1,2,2);
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=2*Lb(i);
SMP1(i)=A1toA2swsmf(n,Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=A1toA2swsmf(n,Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP3(i)=A1toA2swsmf(n,Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP4(i)=A1toA2swsmf(n,Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP5(i)=A1toA2swsmf(n,Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP6(i)=A1toA2swsmf(n,Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
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
legend('E_p/E_m=10','E_p/E_m=50','E_p/E_m=100','E_p/E_m=200','E_p/E_m=500','E_p/E_m=1000','Zhang et al.,2010, E_p/E_m=10','fontsize',12)
