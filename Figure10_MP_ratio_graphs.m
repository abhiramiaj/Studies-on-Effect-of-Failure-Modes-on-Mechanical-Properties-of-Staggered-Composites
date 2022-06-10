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
num3=0.4;
sigmcrit3=30;
sigpcrit3=3250;
taumcrit3=17.3;


Ep4=2.2e5;
Em4=3000;
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
rho=1:1:120;

n=5;
hnol=1/50;
b=10;
vf=0.8;
figure;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%MP1
subplot(1,2,1);
[f1,f2,f3,f4,f5,f6,f7,f8,f9,Lp,x1,x2,L,Lb,h,vf1]=deal(zeros(size(rho)));
for i=1:numel(rho)    
    Lb(i)=hnol*rho(i)*b/(1+hnol);
    h(i)=(2*b*b*rho(i)/(vf*((b*rho(i)) + Lb(i))))-(2*b);
    vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
    Lp(i)=rho(i)*2*b;
    L(i)=Lp(i)+(2*Lb(i));
    x1(i)=Lp(i);
    x2(i)=(L(i)/n)-(2*Lb(i));
    f1(i)=regstress(x1(i),Ep1,Em1,num1,b,Lb(i),h(i),sigpcrit1,rho(i));   %%sig4
    f5(i)=regshear(x2(i),Ep1,Em1,num1,b,Lb(i),h(i),sigpcrit1,rho(i)); %%taumax
    double(f5(i));
    double(f1(i));
    f6(i)=f1(i)./f5(i); %%sig4/taumax
    f3(i)=sigpcrit1/f1(i);
    double(f3(i));
    f7(i)=sigmcrit1./f1(i);%sig_matrixcritical/sig4
    f8(i)=taumcrit1./f5(i);%taumcritical/taumax
    f9(i)=sigpcrit1./sigpcrit1;%sigpcrit/sig5
end

plot(rho,f7,'-.','linewidth',2);
hold on;
plot(rho,f8,'linewidth',2);
hold on;
plot(rho,f9,':','linewidth',2);
hold on;
set(gca,'fontsize',14)
xlabel ('\rho','fontweight','bold', 'fontsize', 14)
legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
axis square
set(gcf,'color','w')

subplot(1,2,2);
[f1,f2,f3,f4,f5,f6,f7,f8,f9,Lp,x1,x2,L,Lb,h,vf1]=deal(zeros(size(rho)));
for  i=1:numel(rho)    
    Lb(i)=hnol*rho(i)*b/(1+hnol);
    h(i)=((2*b*b*rho(i))./(vf*(b*rho(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
    Lp(i)=rho(i)*2*b;
    L(i)=Lp(i)+(2*Lb(i));
    x1(i)=Lp(i);
    x2(i)=(L(i)/n)-(2*Lb(i));
    f1(i)=swstress(x1(i),n,Ep1,Em1,num1,b,Lb(i),h(i),sigpcrit1,rho(i));   %%sig4
    f5(i)=swshear(x2(i),n,Ep1,Em1,num1,b,Lb(i),h(i),sigpcrit1,rho(i)); %%taumax
    double(f5(i));
    double(f1(i));
    f6(i)=f1(i)./f5(i); %%sig4/taumax
    f3(i)=sigpcrit1/f1(i);
    double(f3(i));
    f7(i)=sigmcrit1./f1(i);%sigcritical/sig4
    f8(i)=taumcrit1./f5(i);%taumcritical/taumax
    f9(i)=sigpcrit1./sigpcrit1;%sigpcrit/sig5
end

plot(rho,f7,'-.','linewidth',2);
hold on;
plot(rho,f8,'linewidth',2);
hold on;
plot(rho,f9,':','linewidth',2);
hold on;
set(gca,'fontsize',14)
xlabel ('\rho','fontweight','bold', 'fontsize', 14)
legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
axis square
set(gcf,'color','w')



%%%%%%%%%%UNCOMMENT TO PLOT FOR OTHER MATERIAL SETS%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%MP2
% figure
% subplot(1,2,1)
% for i=1:numel(rho)
%     Lb(i)=hnol*rho(i)*b/(1+hnol);
%     h(i)=((2*b*b*rho(i))./(vf*(b*rho(i) + Lb(i)))) - (2*b);
%     vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
%     Lp(i)=rho(i)*2*b;
%     L(i)=Lp(i)+(2*Lb(i));
%     x1(i)=Lp(i);
%     x2(i)=(L(i)/n)-(2*Lb(i));
%     f1(i)=regstress(x1(i),Ep2,Em2,num2,b,Lb(i),h(i),sigpcrit2,rho(i));   %%sig4
%     f5(i)=regshear(x2(i),Ep2,Em2,num2,b,Lb(i),h(i),sigpcrit2,rho(i)); %%taumax
%     double(f5(i));
%     double(f1(i));
%     f6(i)=f1(i)./f5(i); %%sig4/taumax
%     f3(i)=sigpcrit2/f1(i);
%     double(f3(i));
%     f7(i)=sigmcrit2./f1(i);%sigcritical/sig4
%     f8(i)=taumcrit2./f5(i);%taumcritical/taumax
%     f9(i)=sigpcrit2./sigpcrit2;%sigpcrit/sig5
% end
% 
% plot(rho,f7,'-.','linewidth',2);
% hold on;
% plot(rho,f8,'linewidth',2);
% hold on;
% plot(rho,f9,':','linewidth',2);
% hold on;
% set(gca,'fontsize',14)
% xlabel ('\rho','fontweight','bold', 'fontsize', 14)
% legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
% axis square
% set(gcf,'color','w')
% 
% subplot(1,2,2);
% [f1,f2,f3,f4,f5,f6,f7,f8,f9,Lp,x1,x2,L]=deal(zeros(size(rho)));
% for  i=1:numel(rho)
%     Lb(i)=hnol*rho(i)*b/(1+hnol);
%     h(i)=(2*b*b*rho(i)/(vf*((b*rho(i)) + Lb(i))))-(2*b);
%     vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
%     Lp(i)=rho(i)*2*b;
%     L(i)=Lp(i)+(2*Lb(i));
%     x1(i)=Lp(i);
%     x2(i)=(L(i)/n)-(2*Lb(i));
%     f1(i)=swstress(x1(i),n,Ep2,Em2,num2,b,Lb(i),h(i),sigpcrit2,rho(i));   %%sig4
%     f5(i)=swshear(x2(i),n,Ep2,Em2,num2,b,Lb(i),h(i),sigpcrit2,rho(i)); %%taumax
%     double(f5(i));
%     double(f1(i));
%     f6(i)=f1(i)./f5(i); %%sig4/taumax
%     f3(i)=sigpcrit2/f1(i);
%     double(f3(i));
%     f7(i)=sigmcrit2./f1(i);%sigcritical/sig4
%     f8(i)=taumcrit2./f5(i);%taumcritical/taumax
%     f9(i)=sigpcrit2./sigpcrit2;%sigpcrit/sig5
% end
% 
% plot(rho,f7,'-.','linewidth',2);
% hold on;
% plot(rho,f8,'linewidth',2);
% hold on;
% plot(rho,f9,':','linewidth',2);
% hold on;
% set(gca,'fontsize',14)
% xlabel ('\rho','fontweight','bold', 'fontsize', 14)
% legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
% axis square
% set(gcf,'color','w')
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%MP3
% figure
% subplot(1,2,1)
% for i=1:numel(rho)
%     Lb(i)=hnol*rho(i)*b/(1+hnol);
%     h(i)=(2*b*b*rho(i)/(vf*((b*rho(i)) + Lb(i))))-(2*b);
%     vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
%     Lp(i)=rho(i)*2*b;
%     L(i)=Lp(i)+(2*Lb(i));
%     x1(i)=Lp(i);
%     x2(i)=(L(i)/n)-(2*Lb(i));
%     f1(i)=regstress(x1(i),Ep3,Em3,num3,b,Lb(i),h(i),sigpcrit3,rho(i));   %%sig4
%     f5(i)=regshear(x2(i),Ep3,Em3,num3,b,Lb(i),h(i),sigpcrit3,rho(i)); %%taumax
%     double(f5(i));
%     double(f1(i));
%     f6(i)=f1(i)./f5(i); %%sig4/taumax
%     f3(i)=sigpcrit3/f1(i);
%     double(f3(i));
%     f7(i)=sigmcrit3./f1(i);%sigcritical/sig4
%     f8(i)=taumcrit3./f5(i);%taumcritical/taumax
%     f9(i)=sigpcrit3./sigpcrit3;%sigpcrit/sig5
% end
% 
% plot(rho,f7,'-.','linewidth',2);
% hold on;
% plot(rho,f8,'linewidth',2);
% hold on;
% plot(rho,f9,':','linewidth',2);
% hold on;
% set(gca,'fontsize',14)
% xlabel ('\rho','fontweight','bold', 'fontsize', 14)
% legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
% axis square
% set(gcf,'color','w')
% 
% subplot(1,2,2);
% [f1,f2,f3,f4,f5,f6,f7,f8,f9,Lp,x1,x2,L]=deal(zeros(size(rho)));
% for  i=1:numel(rho)
%     Lb(i)=hnol*rho(i)*b/(1+hnol);
%     h(i)=(2*b*b*rho(i)/(vf*((b*rho(i)) + Lb(i))))-(2*b);
%     vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
%     Lp(i)=rho(i)*2*b;
%     L(i)=Lp(i)+(2*Lb(i));
%     x1(i)=Lp(i);
%     x2(i)=(L(i)/n)-(2*Lb(i));
%     f1(i)=swstress(x1(i),n,Ep3,Em3,num3,b,Lb(i),h(i),sigpcrit3,rho(i));   %%sig4
%     f5(i)=swshear(x2(i),n,Ep3,Em3,num3,b,Lb(i),h(i),sigpcrit3,rho(i)); %%taumax
%     double(f5(i));
%     double(f1(i));
%     f6(i)=f1(i)./f5(i); %%sig4/taumax
%     f3(i)=sigpcrit3/f1(i);
%     double(f3(i));
%     f7(i)=sigmcrit3./f1(i);%sigcritical/sig4
%     f8(i)=taumcrit3./f5(i);%taumcritical/taumax
%     f9(i)=sigpcrit3./sigpcrit3;%sigpcrit/sig5
% end
% 
% plot(rho,f7,'-.','linewidth',2);
% hold on;
% plot(rho,f8,'linewidth',2);
% hold on;
% plot(rho,f9,':','linewidth',2);
% hold on;
% set(gca,'fontsize',14)
% xlabel ('\rho','fontweight','bold', 'fontsize', 14)
% legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
% axis square
% set(gcf,'color','w')
% %%%%%%%%%%%%%%%%%%%%%%MP4
% figure
% subplot(1,2,1)
% for i=1:numel(rho)
%     Lb(i)=hnol*rho(i)*b/(1+hnol);
%     h(i)=(2*b*b*rho(i)/(vf*((b*rho(i)) + Lb(i))))-(2*b);
%     vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
%     Lp(i)=rho(i)*2*b;
%     L(i)=Lp(i)+(2*Lb(i));
%     x1(i)=Lp(i);
%     x2(i)=(L(i)/n)-(2*Lb(i));
%     f1(i)=regstress(x1(i),Ep4,Em4,num4,b,Lb(i),h(i),sigpcrit4,rho(i));   %%sig4
%     f5(i)=regshear(x2(i),Ep4,Em4,num4,b,Lb(i),h(i),sigpcrit4,rho(i)); %%taumax
%     double(f5(i));
%     double(f1(i));
%     f6(i)=f1(i)./f5(i); %%sig4/taumax
%     f3(i)=sigpcrit4/f1(i);
%     double(f3(i));
%     f7(i)=sigmcrit4./f1(i);%sigcritical/sig4
%     f8(i)=taumcrit4./f5(i);%taumcritical/taumax
%     f9(i)=sigpcrit4./sigpcrit4;%sigpcrit/sig5
% end
% 
% plot(rho,f7,'-.','linewidth',2);
% hold on;
% plot(rho,f8,'linewidth',2);
% hold on;
% plot(rho,f9,':','linewidth',2);
% hold on;
% set(gca,'fontsize',14)
% xlabel ('\rho','fontweight','bold', 'fontsize', 14)
% legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
% axis square
% set(gcf,'color','w')
% 
% subplot(1,2,2);
% [f1,f2,f3,f4,f5,f6,f7,f8,f9,Lp,x1,x2,L]=deal(zeros(size(rho)));
% for  i=1:numel(rho)
%     Lb(i)=hnol*rho(i)*b/(1+hnol);
%     h(i)=(2*b*b*rho(i)/(vf*((b*rho(i)) + Lb(i))))-(2*b);
%     vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
%     Lp(i)=rho(i)*2*b;
%     L(i)=Lp(i)+(2*Lb(i));
%     x1(i)=Lp(i);
%     x2(i)=(L(i)/n)-(2*Lb(i));
%     f1(i)=swstress(x1(i),n,Ep4,Em4,num4,b,Lb(i),h(i),sigpcrit4,rho(i));   %%sig4
%     f5(i)=swshear(x2(i),n,Ep4,Em4,num4,b,Lb(i),h(i),sigpcrit4,rho(i)); %%taumax
%     double(f5(i));
%     double(f1(i));
%     f6(i)=f1(i)./f5(i); %%sig4/taumax
%     f3(i)=sigpcrit4/f1(i);
%     double(f3(i));
%     f7(i)=sigmcrit4./f1(i);%sigcritical/sig4
%     f8(i)=taumcrit4./f5(i);%taumcritical/taumax
%     f9(i)=sigpcrit4./sigpcrit4;%sigpcrit/sig5
% end
% 
% plot(rho,f7,'-.','linewidth',2);
% hold on;
% plot(rho,f8,'linewidth',2);
% hold on;
% plot(rho,f9,':','linewidth',2);
% hold on;
% set(gca,'fontsize',14)
% xlabel ('\rho','fontweight','bold', 'fontsize', 14)
% legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
% axis square
% set(gcf,'color','w')
% %%%%%%%%%%%%%%%%%%%%%%MP5
% figure
% subplot(1,2,1)
% for i=1:numel(rho)
%     Lb(i)=hnol*rho(i)*b/(1+hnol);
%     h(i)=(2*b*b*rho(i)/(vf*((b*rho(i)) + Lb(i))))-(2*b);
%     vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
%     Lp(i)=rho(i)*2*b;
%     L(i)=Lp(i)+(2*Lb(i));
%     x1(i)=Lp(i);
%     x2(i)=(L(i)/n)-(2*Lb(i));
%     f1(i)=regstress(x1(i),Ep5,Em5,num5,b,Lb(i),h(i),sigpcrit5,rho(i));   %%sig4
%     f5(i)=regshear(x2(i),Ep5,Em5,num5,b,Lb(i),h(i),sigpcrit5,rho(i)); %%taumax
%     double(f5(i));
%     double(f1(i));
%     f6(i)=f1(i)./f5(i); %%sig4/taumax
%     f3(i)=sigpcrit5/f1(i);
%     double(f3(i));
%     f7(i)=sigmcrit5./f1(i);%sigcritical/sig4
%     f8(i)=taumcrit5./f5(i);%taumcritical/taumax
%     f9(i)=sigpcrit5./sigpcrit5;%sigpcrit/sig5
% end
% 
% plot(rho,f7,'-.','linewidth',2);
% hold on;
% plot(rho,f8,'linewidth',2);
% hold on;
% plot(rho,f9,':','linewidth',2);
% hold on;
% set(gca,'fontsize',14)
% xlabel ('\rho','fontweight','bold', 'fontsize', 14)
% legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
% axis square
% set(gcf,'color','w')
% 
% subplot(1,2,2);
% [f1,f2,f3,f4,f5,f6,f7,f8,f9,Lp,x1,x2,L]=deal(zeros(size(rho)));
% for  i=1:numel(rho)
%     Lb(i)=hnol*rho(i)*b/(1+hnol);
%     h(i)=(2*b*b*rho(i)/(vf*((b*rho(i)) + Lb(i))))-(2*b);
%     vf1(i)=(2*b*b*rho(i))./((2*b + h(i))*(rho(i)*b + Lb(i)));
%     Lp(i)=rho(i)*2*b;
%     L(i)=Lp(i)+(2*Lb(i));
%     x1(i)=Lp(i);
%     x2(i)=(L(i)/n)-(2*Lb(i));
%     f1(i)=swstress(x1(i),n,Ep5,Em5,num5,b,Lb(i),h(i),sigpcrit5,rho(i));   %%sig4
%     f5(i)=swshear(x2(i),n,Ep5,Em5,num5,b,Lb(i),h(i),sigpcrit5,rho(i)); %%taumax
%     double(f5(i));
%     double(f1(i));
%     f6(i)=f1(i)./f5(i); %%sig4/taumax
%     f3(i)=sigpcrit5/f1(i);
%     double(f3(i));
%     f7(i)=sigmcrit5./f1(i);%sigcritical/sig4
%     f8(i)=taumcrit5./f5(i);%taumcritical/taumax
%     f9(i)=sigpcrit5./sigpcrit5;%sigpcrit/sig5
% end
% 
% plot(rho,f7,'-.','linewidth',2);
% hold on;
% plot(rho,f8,'linewidth',2);
% hold on;
% plot(rho,f9,':','linewidth',2);
% hold on;
% set(gca,'fontsize',14)
% xlabel ('\rho','fontweight','bold', 'fontsize', 14)
% legend ('\sigma_{critical}^m/\sigma^m_{max} (Vertical interface Failure)', '\tau_{critical}^m/\tau^m_{max}(Horizontal interface Failure)','\sigma_{critical}^p/\sigma^p_{max}(Platelet Failure)','fontsize', 12)
% axis square
% set(gcf,'color','w')
