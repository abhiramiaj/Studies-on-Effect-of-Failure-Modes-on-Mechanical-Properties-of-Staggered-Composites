clc;clear all;
figure
Ep1=220e3;%Young's modulus of platelet
Em1=1.1e3; %Young's modulus of matrix
%Ep/Em set as 200
num1=0.38; %Poisson's ratio of matrix
sigmcrit1=30; %Normal strength of matrix
taumcrit1=17.3; %Shear strength of matrix
sigpcrit1=[10*taumcrit1 25*taumcrit1 50*taumcrit1 100*taumcrit1 150*taumcrit1 200*taumcrit1];%Normal strength of platelet
%taumcrit is 0.576 times sigmamcrit
subplot(1,2,1);
b=10; %2b is the width of platelet
hnol=1/50;%half non-overlap length to overlap length ratio
rr=1:1:120; %platelet aspect ratio
vf=0.8;%volume fraction

for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
    SMP2s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
    %%%%%%%%%%3,4,5,6 are same as that of 2, for both reg and sw
    % SMP3s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
    % SMP4s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
    % SMP5s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
    % SMP6s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
    SMP1f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
    SMP2f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
    % SMP3f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
    % SMP4f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
    % SMP5f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
    % SMP6f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
    if SMP1s(i)~=SMP1f(i)
        rr1(i)=rr(i);
        SMP1(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
    end
    if SMP2s(i)~=SMP2f(i)
        rr2(i)=rr(i);
        SMP2(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
    end
    % if SMP3s(i)~=SMP3f(i)
    %     rr3(i)=rr(i);
    %     SMP3(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
    % end
    % if SMP4s(i)~=SMP4f(i)
    %     rr4(i)=rr(i);
    %     SMP4(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
    % end
    % if SMP5s(i)~=SMP5f(i)
    %     rr5(i)=rr(i);
    %     SMP5(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
    % end
    % if SMP6s(i)~=SMP6f(i)
    %     rr6(i)=rr(i);
    %     SMP6(i)=A1toA2regsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
    % end
end
plot(rr1,SMP1,'linewidth',1.5)
hold on;
plot(rr2,SMP2,'--','linewidth',1.5)
hold on;
% plot(rr3,SMP3,'linewidth',1.5)
% hold on;
% plot(rr4,SMP4,'linewidth',1.5)
% hold on;
% plot(rr5,SMP5,'linewidth',1.5)
% hold on;
% plot(rr5,SMP6,'linewidth',1.5)
% hold on;


set(gca,'fontsize',15)
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('A_1/A_2, reg','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
axis square
% legend('\sigma^p_{crit}=200','\sigma^p_{crit}=400','\sigma^p_{crit}=600','\sigma^p_{crit}=800','\sigma^p_{crit}=1000','\sigma^p_{crit}=1200','\sigma^p_{crit}=1400','fontsize',12)
lg1=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$',...
    '$\frac{\sigma^p_{critical}}{\tau^m_{critical}}\geq25$');
lg1.FontSize=12;
set(lg1 ,'Interpreter','latex')
subplot(1,2,2);
n=5;
b=10; %%2b is the width of platelet
hnol= 1/50;
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1ss(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
    SMP2ss(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
    % SMP3ss(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
    % SMP4ss(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
    % SMP5ss(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
    % SMP6ss(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
    SMP1ff(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
    SMP2ff(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
    % SMP3ff(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
    % SMP4ff(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
    % SMP5ff(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
    % SMP6ff(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
    if SMP1ss(i)~=SMP1ff(i)
        rr11(i)=rr(i);
        SMP11(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
    end
    if SMP2ss(i)~=SMP2ff(i)
        rr22(i)=rr(i);
        SMP22(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
    end
    % if SMP3ss(i)~=SMP3ff(i)
    %     rr33(i)=rr(i);
    %     SMP33(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
    % end
    % if SMP4ss(i)~=SMP4ff(i)
    %     rr44(i)=rr(i);
    %     SMP44(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
    % end
    % if SMP5ss(i)~=SMP5ff(i)
    %     rr55(i)=rr(i);
    %     SMP55(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
    % end
    % if SMP6ss(i)~=SMP6ff(i)
    %     rr66(i)=rr(i);
    %     SMP66(i)=A1toA2swsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
    % end
end
plot(rr11,SMP11,'linewidth',1.5)
hold on;
plot(rr22,SMP22,'--','linewidth',1.5)
hold on;
% plot(rr33,SMP33,'linewidth',1.5)
% hold on;
% plot(rr44,SMP44,'linewidth',1.5)
% hold on;
% plot(rr55,SMP55,'linewidth',1.5)
% hold on;
% plot(rr66,SMP66,'linewidth',1.5)
% hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('A_1/A_2, sw','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
axis square
% lg2=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',11);
% set(lg2,'Interpreter','latex')
lg2=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$',...
    '$\frac{\sigma^p_{critical}}{\tau^m_{critical}}\geq25$');
lg2.FontSize=12;
set(lg2 ,'Interpreter','latex')
