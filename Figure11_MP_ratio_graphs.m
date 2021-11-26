% VERTICAL INTERFACE FAILURE 
% sigpcrit/sigmcrit=sig5/sig4
% HORIZONTAL INTERFACE FAILURE 
% sigpcrit/taumcrit=sig5/taumax


Ep1=1200;
Em1=0.67; 
num1=0.4;
sigmcrit1=1;
sigpcrit1=40;
taumcrit1=0.576;


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
    %f2(i)=regstress(x2(i),Ep,Em,num,b,Lb(i),h(i),s5,rho(i));
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
