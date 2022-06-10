clc;clear all;
figure


%Ep: Young's modulus of platelet
%Em: Young's modulus of matrix
%num1: Poisson's ratio of matrix
%sigmcrit: Normal strength of matrix
%sigpcrit: Normal strenght of platelet
%taumcrit: Shear strength of matrix

%%%%%%%%%%MP1%%%%%%%%%%
Ep1=1200;
Em1=0.67; 
num1=0.4;
sigmcrit1=1;
sigpcrit1=40;
taumcrit1=0.576;

%%%%%%%%%%MP2%%%%%%%%%%
Ep2=1e5;
Em2=200;   
num2=0.4;
sigmcrit2=20;
sigpcrit2=200;
taumcrit2=11.52;

%%%%%%%%%%MP3%%%%%%%%%%
Ep3=2.2e5;
Em3=1100;
num3=0.4;
sigmcrit3=30;
sigpcrit3=3250;
taumcrit3=17.3;

%%%%%%%%%%MP4%%%%%%%%%%
Ep4=2.2e5;
Em4=3000;
%num4=0.38;
num4=0.4;
sigmcrit4=40;
sigpcrit4=3250;
taumcrit4=23.1;

%%%%%%%%%%MP5%%%%%%%%%%
Ep5=1e5;
Em5=4000;  
num5=0.4;
sigmcrit5=20;
sigpcrit5=200;
taumcrit5=11.52;

subplot(1,2,1);
vf=0.8;%volume fraction
b=10;%2b is the width of platelet
hnol=1/50; %half non-overlap length to overlap length ratio
rr=1:1:120;%platelet aspect ratio
[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5]=deal(zeros(size(rr)));
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=(2*b*rr(i)*b./(vf*(0.5*2*b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    SMP2(i)=regstrengthsmf(Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    SMP3(i)=regstrengthsmf(Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    SMP4(i)=regstrengthsmf(Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    SMP5(i)=regstrengthsmf(Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
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

set(gca,'fontsize',15)
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''''_{reg}/\tau^m_{critical}), SMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
axis square
legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)


subplot(1,2,2);
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    SMP2(i)=swstrengthsmf(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    SMP3(i)=swstrengthsmf(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    SMP4(i)=swstrengthsmf(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    SMP5(i)=swstrengthsmf(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
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
ylabel ('Normalized strength (\sigma''''_{sw}/\tau^m_{critical}), SMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
axis square
legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)


figure 
subplot(1,2,1)
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;
rr=1:1:120;
%%%MP1
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    SMP2(i)=regstrengthfmf(Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    SMP3(i)=regstrengthfmf(Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    SMP4(i)=regstrengthfmf(Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    SMP5(i)=regstrengthfmf(Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
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

set(gca,'fontsize',15)
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''_{reg}/\tau^m_{critical}), FMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
axis square
legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)

subplot(1,2,2)
rr=1:1:120;
[SMP1,SMP2,SMP3,SMP4,SMP5,Lb,h]=deal(zeros(size(rr)));
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    SMP2(i)=swstrengthfmf(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    SMP3(i)=swstrengthfmf(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    SMP4(i)=swstrengthfmf(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    SMP5(i)=swstrengthfmf(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
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

set(gca,'fontsize',15)
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''_{sw}/\tau^m_{critical}), FMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
axis square
legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)


figure
subplot(1,2,1)
rr=1:1:120;
[SMP1,SMP2,SMP3,SMP4,SMP5,Lb,h]=deal(zeros(size(rr)));

b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1(i)=(regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1))/(regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1));
    SMP2(i)=(regstrengthfmf(Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2))/(regstrengthsmf(Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2));
    SMP3(i)=(regstrengthfmf(Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3))/(regstrengthsmf(Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3));
    SMP4(i)=(regstrengthfmf(Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4))/(regstrengthsmf(Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4));
    SMP5(i)=(regstrengthfmf(Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5))/(regstrengthsmf(Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5));
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

set(gca,'fontsize',15)
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength ratio (FMF/SMF)','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
axis square
legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)

subplot(1,2,2)
rr=1:1:120;
[SMP1,SMP2,SMP3,SMP4,SMP5,Lb,h]=deal(zeros(size(rr)));
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1(i)=(swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1))/(swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1));
    SMP2(i)=(swstrengthfmf(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2))/(swstrengthsmf(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2));
    SMP3(i)=(swstrengthfmf(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3))/(swstrengthsmf(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3));
    SMP4(i)=(swstrengthfmf(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4))/(swstrengthsmf(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4));
    SMP5(i)=(swstrengthfmf(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5))/(swstrengthsmf(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5));
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

set(gca,'fontsize',15)
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength ratio ,sw (FMF/SMF)','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
axis square
legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)



