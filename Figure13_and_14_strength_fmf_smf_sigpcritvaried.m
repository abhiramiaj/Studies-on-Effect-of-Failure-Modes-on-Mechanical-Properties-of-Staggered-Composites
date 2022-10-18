tic
clc;clear all;
figure
Ep1=220e3; %Youg's modulus of platelet
Em1=1.1e3; %Young's modulus of matrix
%Ep/Em set as 200
num1=0.38; %Poisson's ratio of matrix
sigmcrit1=30; %Normal strength of matrix
%sigpcrit1=200:200:1400;
taumcrit1=17.3; %Shear strength of matrix
sigpcrit1=[10*taumcrit1 25*taumcrit1 50*taumcrit1 100*taumcrit1 150*taumcrit1 200*taumcrit1];%Normal strength of platelet
%taumcrit is 0.576 times sigmamcrit
subplot(1,2,1);
b=10; %2b is the width of platelet
hnol=1/50; %half non-overlap length to overlap length ratio
vf=0.8; %platelet volume fraction
n=5; %number of platelets in a period (n) in sw staggered config.
rr=1:1:250;
%% SMP3,4,5 and 6; i.e, sigpcrit/taumcrit=50,100,150 and 200 has been commented ...
%since it is same as sigpcrit/taumcrit=25
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
    vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
    SMP1s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
    SMP2s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
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
        SMP1(i)=SMP1s(i);
    end
    if SMP2s(i)~=SMP2f(i)
        rr2(i)=rr(i);
        SMP2(i)=SMP2s(i);
    end
    % if SMP3s(i)~=SMP3f(i)
    %     rr3(i)=rr(i);
    %     SMP3(i)=SMP3s(i);
    % end
    % if SMP4s(i)~=SMP4f(i)
    %     rr4(i)=rr(i);
    %     SMP4(i)=SMP4s(i);
    % end
    % if SMP5s(i)~=SMP5f(i)
    %     rr5(i)=rr(i);
    %     SMP5(i)=SMP5s(i);
    % end
    % if SMP6s(i)~=SMP6f(i)
    %     rr6(i)=rr(i);
    %     SMP6(i)=SMP6s(i);
    % end
    SMP8(i)=zhangstrengthsw(2,b,Lb(i),h(i),sigpcrit1(1),taumcrit1,rr(i));
end
plot(rr1,SMP1,'r-*','MarkerIndices',1:7:length(rr1),'linewidth',1.5)
hold on;
plot(rr2,SMP2,'m--s','MarkerIndices',1:11:length(rr2),'linewidth',1.5)
hold on;
plot(rr1(length(rr1)),SMP1(length(rr1)),'r*','linewidth',1.5,'HandleVisibility','off')
plot(rr2(length(rr2)),SMP2(length(rr2)),'ms','linewidth',1.5,'HandleVisibility','off')

% plot(rr3,SMP3,'linewidth',1.5)
% hold on;
% plot(rr4,SMP4,'linewidth',1.5)
% hold on;
% plot(rr5,SMP5,'linewidth',1.5)
% hold on;
% plot(rr6,SMP6,'linewidth',1.5)
% hold on;

plot(rr,SMP8,':','Color', [0.4660 0.6740 0.1880],'linewidth',1.5)
hold on;
set(gca,'fontsize',15)
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''''_{reg}/\tau^m_{critical}), SMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')

axis square
ylim([0 10])
%lg1=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$',...
%'$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$',...
%'$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$',...
%'$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$',...
%'Zhang et al., 2010, $\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','fontsize',9);
lg1=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$',...
    '$\frac{\sigma^p_{critical}}{\tau^m_{critical}}\geq25$',...
    'Zhang et al., 2010, $\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','fontsize',9);
lg1.FontSize=12;
set(lg1,'Interpreter','latex')
subplot(1,2,2);

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
        SMP11(i)=SMP1ss(i);
    end
    if SMP2ss(i)~=SMP2ff(i)
        rr22(i)=rr(i);
        SMP22(i)=SMP2ss(i);
    end
    % if SMP3ss(i)~=SMP3ff(i)
    %     rr33(i)=rr(i);
    %     SMP33(i)=SMP3ss(i);
    % end
    % if SMP4ss(i)~=SMP4ff(i)
    %     rr44(i)=rr(i);
    %     SMP44(i)=SMP4ss(i);
    % end
    % if SMP5ss(i)~=SMP5ff(i)
    %     rr55(i)=rr(i);
    %     SMP55(i)=SMP5ss(i);
    % end
    % if SMP6ss(i)~=SMP6ff(i)
    %     rr66(i)=rr(i);
    %     SMP66(i)=SMP6ss(i);
    % end

    SMP8s(i)=zhangstrengthsw(n,b,Lb(i),h(i),sigpcrit1(1),taumcrit1,rr(i));
end
plot(rr11,SMP11,'r-*','MarkerIndices',1:5:length(rr11),'linewidth',1.5)
hold on;
plot(rr22,SMP22,'m--s','MarkerIndices',1:7:length(rr22),'linewidth',1.5)
hold on;
plot(rr22(length(rr22)),SMP22(length(rr22)),'ms','linewidth',1.5,'HandleVisibility','off')

% plot(rr33,SMP33,'linewidth',1.5)
% hold on;
% plot(rr44,SMP44,'linewidth',1.5)
% hold on;
% plot(rr55,SMP55,'linewidth',1.5)
% hold on;
% plot(rr66,SMP66,'linewidth',1.5)
% hold on;

plot(rr,SMP8s,':','Color', [0.4660 0.6740 0.1880],'linewidth',1.5)
hold on;
xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''''_{sw}/\tau^m_{critical}), SMF','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
ylim([0 10])
axis square
%lg2=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$',...
%'$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$',...
%'$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$',...
%'$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$', ...
%'Zhang et al., 2010, $\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','fontsize',9);
lg2=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$',...
    '$\frac{\sigma^p_{critical}}{\tau^m_{critical}}\geq25$',...
    'Zhang et al., 2010, $\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','fontsize',9);

lg2.FontSize=12;
set(lg2,'Interpreter','latex')




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

axis square

%lg3=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',9);
lg3=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$',...
    '$\frac{\sigma^p_{critical}}{\tau^m_{critical}}\geq25$','fontsize',9);

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
plot(rr,SMP5,'linewidth',1.5)
hold on;
plot(rr,SMP6,'linewidth',1.5)
hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength (\sigma''''_{sw}/\tau^m_{critical}), fmf','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
axis square
%lg4=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',9);
lg4=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$',...
        '$\frac{\sigma^p_{critical}}{\tau^m_{critical}}\geq25$','fontsize',9);
lg4.FontSize=12;
set(lg4,'Interpreter','latex')


%%%%%%%%%%UNCOMMENT TO PLOT STRENGTH RATI(FMF/SMF)%%%%%%%%%%%%%%
clc; clear all;
figure
Ep1=220e3;
Em1=1.1e3;
%Ep/Em set as 200
num1=0.38;
sigmcrit1=30;
%sigpcrit1=200:200:1400;
taumcrit1=17.3;
sigpcrit1=[10*taumcrit1 25*taumcrit1 50*taumcrit1 100*taumcrit1 150*taumcrit1 200*taumcrit1];   
%taumcrit is 0.576 times sigmamcrit
subplot(1,2,1);
b=10;
hnol=1/50;
vf=0.8;
n=5;
rr=1:1:250;
%[Lb,h,SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,SMP7,SMP8]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6s(i)=regstrengthsmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
SMP1f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6f(i)=regstrengthfmf(Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
if SMP1s(i)~=SMP1f(i)
    rr1(i)=rr(i);
    SMP1(i)=SMP1f(i)/SMP1s(i);
end
if SMP2s(i)~=SMP2f(i)
    rr2(i)=rr(i);
    SMP2(i)=SMP2f(i)/SMP2s(i);
end
if SMP3s(i)~=SMP3f(i)
    rr3(i)=rr(i);
    SMP3(i)=SMP3f(i)/SMP3s(i);
end
if SMP4s(i)~=SMP4f(i)
    rr4(i)=rr(i);
    SMP4(i)=SMP4f(i)/SMP4s(i);
end
if SMP5s(i)~=SMP5f(i)
    rr5(i)=rr(i);
    SMP5(i)=SMP5f(i)/SMP5s(i);
end
if SMP6s(i)~=SMP6f(i)
    rr6(i)=rr(i);
    SMP6(i)=SMP6f(i)/SMP6s(i);
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
plot(rr6,SMP6,'linewidth',1.5)
hold on;

set(gca,'fontsize',15)

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength ratio, reg (FMF/SMF)','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')

axis square
ylim([0 10])
lg1=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',9);
lg1.FontSize=12;
set(lg1,'Interpreter','latex')

subplot(1,2,2);

for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1s(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2s(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3s(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4s(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5s(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6s(i)=swstrengthsmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
SMP1f(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(1),sigmcrit1,taumcrit1);
SMP2f(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(2),sigmcrit1,taumcrit1);
SMP3f(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(3),sigmcrit1,taumcrit1);
SMP4f(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(4),sigmcrit1,taumcrit1);
SMP5f(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(5),sigmcrit1,taumcrit1);
SMP6f(i)=swstrengthfmf(n,Ep1,Em1,num1,b,Lb(i),h(i),rr(i),sigpcrit1(6),sigmcrit1,taumcrit1);
if SMP1s(i)~=SMP1f(i)
    rr11(i)=rr(i);
    SMP11(i)=SMP1f(i)/SMP1s(i);
end
if SMP2s(i)~=SMP2f(i)
    rr22(i)=rr(i);
    SMP22(i)=SMP2f(i)/SMP2s(i);
end
if SMP3s(i)~=SMP3f(i)
    rr33(i)=rr(i);
    SMP33(i)=SMP3f(i)/SMP3s(i);
end
if SMP4s(i)~=SMP4f(i)
    rr44(i)=rr(i);
    SMP44(i)=SMP4f(i)/SMP4s(i);
end
if SMP5s(i)~=SMP5f(i)
    rr55(i)=rr(i);
    SMP55(i)=SMP5f(i)/SMP5s(i);
end
if SMP6s(i)~=SMP6f(i)
    rr66(i)=rr(i);
    SMP66(i)=SMP6f(i)/SMP6s(i);
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
plot(rr66,SMP66,'linewidth',1.5)
hold on;


xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('Normalized strength ratio, sw (FMF/SMF)','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15)
ylim([0 20])
axis square
lg2=legend('$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=10$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=25$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=50$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=100$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=150$','$\frac{\sigma^p_{critical}}{\tau^m_{critical}}=200$','fontsize',9);
lg2.FontSize=12;
set(lg2 ,'Interpreter','latex')
toc
