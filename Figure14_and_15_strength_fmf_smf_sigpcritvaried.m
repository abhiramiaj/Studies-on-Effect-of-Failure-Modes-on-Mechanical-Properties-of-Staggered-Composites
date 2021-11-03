tic
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
vf=0.8;
n=5;
rr=1:1:500;
[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7,SMP8]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);


vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
SMP8(i)=zhangstrengthsw(2,b,Lb(i),h(i),sigpcrit1(1),taumcrit1,rr(i));
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

plot(rr,SMP8,':','linewidth',1.5)
hold on;
set(gca,'fontsize',15)

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''''_{reg}/\tau^m_{critical}), SMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
%of regularly staggered composite using Kim6 
axis square
lg1=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$', 'Zhang et al., 2010, $\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','fontsize',9);
lg1.FontSize=12;
set(lg1,'Interpreter','latex')

subplot(1,2,2);

for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);

SMP8(i)=zhangstrengthsw(n,b,Lb(i),h(i),sigpcrit1(1),taumcrit1,rr(i));

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

plot(rr,SMP8,':','linewidth',1.5)
hold on;
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''''_{sw}/\tau^m_{critical}), SMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
axis square
lg2=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$', 'Zhang et al., 2010, $\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','fontsize',9);
lg2.FontSize=12;
set(lg2 ,'Interpreter','latex')

figure
subplot(1,2,1);
rr=1:1:500;
[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);

end
plot(rr,SMP1,'linewidth',1.5)
hold on;
plot(rr,SMP2,'linewidth',1.5)
hold on;
% plot(rr,SMP3,'linewidth',1.5)
% hold on;
% plot(rr,SMP4,'linewidth',1.5)
% hold on;
% plot(rr,SMP5,'linewidth',1.5)
% hold on;
% plot(rr,SMP6,'linewidth',1.5)
% hold on;


set(gca,'fontsize',15)

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''_{reg}/\tau^m_{critical}), fmf','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
%of regularly staggered composite using Kim6 
axis square

%lg3=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',9);
lg3=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25, 50, 100, 150, 200$','fontsize',9);

lg3.FontSize=12;
set(lg3 ,'Interpreter','latex')

subplot(1,2,2);

for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);

end
plot(rr,SMP1,'linewidth',1.5)
hold on;
plot(rr,SMP2,'linewidth',1.5)
hold on;
plot(rr,SMP3,'linewidth',1.5)
hold on;
plot(rr,SMP4,'linewidth',1.5)
hold on;
% plot(rr,SMP5,'linewidth',1.5)
% hold on;
% plot(rr,SMP6,'linewidth',1.5)
% hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''''_{sw}/\tau^m_{critical}), fmf','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
axis square
%lg4=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',9);
lg4=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100, 150, 200$','fontsize',9);


lg4.FontSize=12;
set(lg4,'Interpreter','latex')

figure
subplot(1,2,1)
%%ratios
rr=1:1:500;
[SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7,SMP8,SMP9,SMP10,Lb,h]=deal(zeros(size(rr)));

b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1)/regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1)/regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1)/regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1)/regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1)/regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1)/regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);

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
ylabel ('Normalized strength ratio (FMF/SMF)','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
%of regularly staggered composite using Kim6 
axis square
lg5=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',9);
lg5.FontSize=12;
set(lg5,'Interpreter','latex')

subplot(1,2,2)
rr=1:1:500;
[SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7,SMP8,SMP9,SMP10,Lb,h]=deal(zeros(size(rr)));

[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7,SMP8,SMP9,SMP10]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);

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
ylabel ('Normalized strength ratio ,sw (FMF/SMF)','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
%of regularly staggered composite using Kim6 
axis square
lg6=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',9);
lg6.FontSize=12;
set(lg6,'Interpreter','latex')
toc


