tic
figure
Em1=4000;
Ep1=[10*Em1 50*Em1 100*Em1 200*Em1 500*Em1 1000*Em1];
num1=0.38;
sigmcrit1=43.4;
sigpcrit1=2500;
taumcrit1=25;

% Ep1=0.5e5:0.5e5:3e5;
% Em1=4000;
% num1=0.38;
% sigmcrit1=35;
% sigpcrit1=1200;
% taumcrit1=20.16;
%taumcrit is 0.576 times sigmamcrit
subplot(1,2,1);
b=10;
hnol=1/50;
rr=1:1:120;
vf=0.8;
[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=(2*b*rr(i)*2*b./(vf*(0.5*2*b*rr(i) + Lb(i)))) - (2*b);
SMP1(i)=regstrengthsmf(Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=regstrengthsmf(Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP3(i)=regstrengthsmf(Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP4(i)=regstrengthsmf(Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP5(i)=regstrengthsmf(Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP6(i)=regstrengthsmf(Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP7(i)=zhangstrengthsw(2,b,Lb(i),h(i),sigpcrit1,taumcrit1,rr(i));
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
plot(rr,SMP7,':','linewidth',1.5)
hold on;


set(gca,'fontsize',15)

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''''_{reg}/\tau^m_{critical}), SMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
%of regularly staggered composite using Kim6 
axis square
legend('E_p/E_m=10','E_p/E_m=50','E_p/E_m=100','E_p/E_m=200','E_p/E_m=500','E_p/E_m=1000','Zhang et al.,2010, E_p/E_m=10','fontsize',12)
subplot(1,2,2);
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=(2*b*rr(i)*2*b./(vf*(0.5*2*b*rr(i) + Lb(i)))) - (2*b);
SMP1(i)=swstrengthsmf(n,Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=swstrengthsmf(n,Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP3(i)=swstrengthsmf(n,Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP4(i)=swstrengthsmf(n,Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP5(i)=swstrengthsmf(n,Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP6(i)=swstrengthsmf(n,Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP7(i)=zhangstrengthsw(n,b,Lb(i),h(i),sigpcrit1,taumcrit1,rr(i));
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
plot(rr,SMP7,':','linewidth',1.5)
hold on;
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''''_{sw}/\tau^m_{critical}), SMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
axis square
legend('E_p/E_m=10','E_p/E_m=50','E_p/E_m=100','E_p/E_m=200','E_p/E_m=500','E_p/E_m=1000','Zhang et al.,2010, E_p/E_m=10','fontsize',12)


figure

%taumcrit is 0.576 times sigmamcrit
subplot(1,2,1);
b=10;
hnol=1/50;
rr=1:1:120;
[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=(2*b*rr(i)*2*b./(vf*(0.5*2*b*rr(i) + Lb(i)))) - (2*b);
SMP1(i)=regstrengthfmf(Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=regstrengthfmf(Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP3(i)=regstrengthfmf(Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP4(i)=regstrengthfmf(Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP5(i)=regstrengthfmf(Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP6(i)=regstrengthfmf(Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);

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
ylabel ('Normalized strength (\sigma''_{reg}/\tau^m_{critical}), fmf','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
%of regularly staggered composite using Kim6 
axis square
legend('E_p/E_m=10','E_p/E_m=50','E_p/E_m=100','E_p/E_m=200','E_p/E_m=500','E_p/E_m=1000','fontsize',12)

subplot(1,2,2);
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=(2*b*rr(i)*2*b./(vf*(0.5*2*b*rr(i) + Lb(i)))) - (2*b);
SMP1(i)=swstrengthfmf(n,Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=swstrengthfmf(n,Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP3(i)=swstrengthfmf(n,Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP4(i)=swstrengthfmf(n,Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP5(i)=swstrengthfmf(n,Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP6(i)=swstrengthfmf(n,Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
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
ylabel ('Normalized strength (\sigma''''_{sw}/\tau^m_{critical}), fmf','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
axis square
legend('E_p/E_m=10','E_p/E_m=50','E_p/E_m=100','E_p/E_m=200','E_p/E_m=500','E_p/E_m=1000','fontsize',12)

figure
subplot(1,2,1)
%%ratios
rr=1:1:120;
[SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,Lb,h]=deal(zeros(size(rr)));

b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=(2*b*rr(i)*2*b./(vf*(0.5*2*b*rr(i) + Lb(i)))) - (2*b);
SMP1(i)=regstrengthfmf(Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/regstrengthsmf(Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=regstrengthfmf(Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/regstrengthsmf(Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP3(i)=regstrengthfmf(Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/regstrengthsmf(Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP4(i)=regstrengthfmf(Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/regstrengthsmf(Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP5(i)=regstrengthfmf(Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/regstrengthsmf(Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP6(i)=regstrengthfmf(Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/regstrengthsmf(Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
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
legend('E_p/E_m=10','E_p/E_m=50','E_p/E_m=100','E_p/E_m=200','E_p/E_m=500','E_p/E_m=1000','fontsize',12)

subplot(1,2,2)
rr=1:1:120;
[SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7,SMP8,SMP9,SMP10,Lb,h]=deal(zeros(size(rr)));
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;

[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7,SMP8,SMP9,SMP10]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=(2*b*rr(i)*2*b./(vf*(0.5*2*b*rr(i) + Lb(i)))) - (2*b);
SMP1(i)=swstrengthfmf(n,Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP2(i)=swstrengthfmf(n,Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP3(i)=swstrengthfmf(n,Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP4(i)=swstrengthfmf(n,Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP5(i)=swstrengthfmf(n,Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
SMP6(i)=swstrengthfmf(n,Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1)/swstrengthsmf(n,Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);

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
legend('E_p/E_m=10','E_p/E_m=50','E_p/E_m=100','E_p/E_m=200','E_p/E_m=500','E_p/E_m=1000','fontsize',12)
toc
