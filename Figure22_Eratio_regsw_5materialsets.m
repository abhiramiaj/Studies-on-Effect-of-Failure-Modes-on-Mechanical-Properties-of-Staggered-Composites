clc; clear all;
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
rr=4:1:120; %platelet aspect ratio
[SMP1,SMP2,SMP3,SMP4,SMP5]=deal(zeros(size(rr)));
hnol=1/50;%half non-overlap length to overlap length ratio
vf=0.8;%volume fraction
b=10; %%2b is the width of platelet


for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));SMP1(i)=(Eregkim(Ep1,Em1,num1,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep1,Em1,num1,b,Lb(i),h(i),rr(i));
    SMP2(i)=(Eregkim(Ep2,Em2,num2,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep2,Em2,num2,b,Lb(i),h(i),rr(i));
    SMP3(i)=(Eregkim(Ep3,Em3,num3,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep3,Em3,num3,b,Lb(i),h(i),rr(i));
    SMP4(i)=(Eregkim(Ep4,Em4,num4,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep4,Em4,num4,b,Lb(i),h(i),rr(i));
    SMP5(i)=(Eregkim(Ep5,Em5,num5,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep5,Em5,num5,b,Lb(i),h(i),rr(i));
end
plot(rr,SMP1,'linewidth', 1.5)
hold on;
plot(rr,SMP2,'linewidth', 1.5)
hold on;
plot(rr,SMP3,'linewidth', 1.5)
hold on;
plot(rr,SMP4,'linewidth', 1.5)
hold on;
plot(rr,SMP5,'linewidth', 1.5)
hold on;

set(gca,'fontsize',15)
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('E/E_{B=0}, Regularly Staggered','fontweight','bold', 'fontsize', 15)
axis square
set(gcf,'color','w')

legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)
subplot(1,2,2);

rr=4:1:120;
n=5;
[SMP1,SMP2,SMP3,SMP4,SMP5]=deal(zeros(size(rr)));
h=5;
b=10; %%2b is the width of platelet
Lb=2.5;
%%MP1
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf2(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));SMP1(i)=(Eswkim(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i));
    SMP2(i)=(Eswkim(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i));
    SMP3(i)=(Eswkim(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i));
    SMP4(i)=(Eswkim(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i));
    SMP5(i)=(Eswkim(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i));
end
plot(rr,SMP1,'linewidth', 1.5)
hold on;
plot(rr,SMP2,'linewidth', 1.5)
hold on;

plot(rr,SMP3,'linewidth', 1.5)
hold on;

plot(rr,SMP4,'linewidth', 1.5)
hold on;

plot(rr,SMP5,'linewidth', 1.5)
hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('E/E_{B=0}, Stairwise Staggered','fontweight','bold', 'fontsize', 15)
axis square
set(gcf,'color','w')
legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)
set(gca,'fontsize',15)
