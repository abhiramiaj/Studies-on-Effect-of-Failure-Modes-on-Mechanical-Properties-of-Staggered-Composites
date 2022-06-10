% % Code to plot the A1/A2 vs rho for different material-sets
clc; clear all;
rr=1:1:120; %platelet aspect ratio
b=10; %%2b is the width of platelet
hnol= 1/50; %half non-overlap length to overlap length ratio
vf=0.8; %volume fraction

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

for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);    
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    SMP2s(i)=regstrengthsmf(Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    SMP3s(i)=regstrengthsmf(Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    SMP4s(i)=regstrengthsmf(Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    SMP5s(i)=regstrengthsmf(Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
    SMP1f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    SMP2f(i)=regstrengthfmf(Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    SMP3f(i)=regstrengthfmf(Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    SMP4f(i)=regstrengthfmf(Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    SMP5f(i)=regstrengthfmf(Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
    if SMP1s(i)~=SMP1f(i)
        rr1(i)=rr(i);
        SMP1(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    end
    if SMP2s(i)~=SMP2f(i)
        rr2(i)=rr(i);
        SMP2(i)=A1toA2regsmf(Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    end
    if SMP3s(i)~=SMP3f(i)
        rr3(i)=rr(i);
        SMP3(i)=A1toA2regsmf(Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    end
    if SMP4s(i)~=SMP4f(i)
        rr4(i)=rr(i);
        SMP4(i)=A1toA2regsmf(Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    end
    if SMP5s(i)~=SMP5f(i)
        rr5(i)=rr(i);
        SMP5(i)=A1toA2regsmf(Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
    end
end
plot(rr1,SMP1,'linewidth',1.5)
hold on;
plot(rr2,SMP2,'linewidth',1.5)
hold on;
plot(rr3,SMP3,'linewidth',1.5)
hold on;
plot(rr4,SMP4,'linewidth',1.5)
hold on;
plot(rr5,SMP5,'linewidth',1.5)
hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('A_1/A_2, reg','fontweight','bold', 'fontsize', 15)
axis square
set(gca,'fontsize',15)
legend('MP1','MP2','MP3','MP4','MP5','MP6','MP7','MP8','MP9','MP10','fontsize',12)



rr=1:1:120;
subplot(1,2,2); 
n=5;
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    SMP1s(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    SMP2s(i)=swstrengthsmf(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    SMP3s(i)=swstrengthsmf(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    SMP4s(i)=swstrengthsmf(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    SMP5s(i)=swstrengthsmf(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
    SMP1f(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    SMP2f(i)=swstrengthfmf(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    SMP3f(i)=swstrengthfmf(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    SMP4f(i)=swstrengthfmf(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    SMP5f(i)=swstrengthfmf(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
    if SMP1s(i)~=SMP1f(i)
        rr11(i)=rr(i);
        SMP11(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1,sigmcrit1,taumcrit1);
    end
    if SMP2s(i)~=SMP2f(i)
        rr22(i)=rr(i);
        SMP22(i)=A1toA2swsmf(n,Ep2,Em2,num2,b,Lb(i),h(i),rr(i),sigpcrit2,sigmcrit2,taumcrit2);
    end
    if SMP3s(i)~=SMP3f(i)
        rr33(i)=rr(i);
        SMP33(i)=A1toA2swsmf(n,Ep3,Em3,num3,b,Lb(i),h(i),rr(i),sigpcrit3,sigmcrit3,taumcrit3);
    end
    if SMP4s(i)~=SMP4f(i)
        rr44(i)=rr(i);
        SMP44(i)=A1toA2swsmf(n,Ep4,Em4,num4,b,Lb(i),h(i),rr(i),sigpcrit4,sigmcrit4,taumcrit4);
    end
    if SMP5s(i)~=SMP5f(i)
        rr55(i)=rr(i);
        SMP55(i)=A1toA2swsmf(n,Ep5,Em5,num5,b,Lb(i),h(i),rr(i),sigpcrit5,sigmcrit5,taumcrit5);
    end
end
plot(rr11,SMP11,'linewidth',1.5)
hold on;
plot(rr22,SMP22,'linewidth',1.5)
hold on;
plot(rr33,SMP33,'linewidth',1.5)
hold on;
plot(rr44,SMP44,'linewidth',1.5)
hold on;
plot(rr55,SMP55,'linewidth',1.5)
hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('A_1/A_2, sw','fontweight','bold', 'fontsize', 15)
axis square
set(gca,'fontsize',15)
set(gcf,'color','w')
legend('MP1','MP2','MP3','MP4','MP5','fontsize',12)
