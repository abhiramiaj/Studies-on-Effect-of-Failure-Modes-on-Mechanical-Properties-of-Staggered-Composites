clc; clear all;
figure
Em1=4000;%Young's modulus of matrix
Ep1=[10*Em1 100*Em1 500*Em1 10*Em1]; %Young's modulus of platelet
num1=0.38; %poisson's ratio nof matrix
sigmcrit1=43.4; %Normal strength of matrix
sigpcrit1=2500; %Normal strength of platelet
taumcrit1=25;   %Shear strength of matrix
%taumcrit is 0.576 times sigmamcrit
subplot(1,2,1);
b=10; %2b is the width of platelet
hnol=1/50; %half non-overlap length to overlap length ratio
vf=0.8; %platelet volume fraction
rr=4:1:120; %aspect ratio
[SMP1,SMP2,SMP3,SMP4,SMP5,SMP6,Lb,h]=deal(zeros(size(rr)));
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1(i)=(Eregkim(Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i));
SMP2(i)=(Eregkim(Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i));
SMP3(i)=(Eregkim(Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i));
SMP4(i)=(Eregkim(Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i));
% SMP5(i)=(Eregkim(Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i));
% SMP6(i)=(Eregkim(Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i)))./EregkimBzer(Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i));
end
semilogx(rr,SMP1,'linewidth',1.5)
hold on;
semilogx(rr,SMP2,'linewidth',1.5)
hold on;
semilogx(rr,SMP3,'linewidth',1.5)
hold on;
semilogx(rr,SMP4,'linewidth',1.5)
hold on;
% semilogx(rr,SMP5,'linewidth',1.5)
% hold on;
% semilogx(rr,SMP6,'linewidth',1.5)
% hold on;

plot(rr,1*ones(size(rr)),'--','linewidth', 1.5,'color',"#A2142F");
hold on;
set(gca,'fontsize',15,'YTick',[0 1 2 4 6 8 10 12 14])
hold on;
str1 = 'E_{\rho=\infty} = 1';
text(40,1.7,str1,'fontsize',15,'color',"#A2142F");

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('E/E_{B=0}, Regularly Staggered','fontweight','bold', 'fontsize', 15)

set(gcf,'color','w')
%of regularly staggered composite using Kim6 
axis square
legend('E_p/E_m=10','E_p/E_m=100','E_p/E_m=500','E_p/E_m=1000','fontsize',12)



subplot(1,2,2);
n=5;
b=10; %%2b is the width of platelet
% h=5;
% Lb=2.5;
hnol= 1/50;
for i=1:numel(rr)
Lb(i)=hnol*rr(i)*b/(1+hnol);
h(i)=((2*b*b*rr(i))./(vf*(b*rr(i) + Lb(i)))) - (2*b);
vf1(i)=(2*b*b*rr(i))./((2*b + h(i))*(rr(i)*b + Lb(i)));
SMP1(i)=(Eswkim(n,Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep1(1),Em1,num1,b,Lb(i),h(i),rr(i));
SMP2(i)=(Eswkim(n,Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep1(2),Em1,num1,b,Lb(i),h(i),rr(i));
SMP3(i)=(Eswkim(n,Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep1(3),Em1,num1,b,Lb(i),h(i),rr(i));
SMP4(i)=(Eswkim(n,Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep1(4),Em1,num1,b,Lb(i),h(i),rr(i));
% SMP5(i)=(Eswkim(n,Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep1(5),Em1,num1,b,Lb(i),h(i),rr(i));
% SMP6(i)=(Eswkim(n,Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i)))./EswkimBzer(n,Ep1(6),Em1,num1,b,Lb(i),h(i),rr(i));
end
semilogx(rr,SMP1,'linewidth',1.5)
hold on;
semilogx(rr,SMP2,'linewidth',1.5)
hold on;
semilogx(rr,SMP3,'linewidth',1.5)
hold on;
semilogx(rr,SMP4,'linewidth',1.5)
hold on;
plot(rr,1*ones(size(rr)),'--','linewidth', 1.5,'color',"#A2142F");
hold on;
% semilogx(rr,SMP5,'linewidth',1.5)
% hold on;
% semilogx(rr,SMP6,'linewidth',1.5)
% hold on;

xlabel ('\rho','fontweight','bold', 'fontsize', 15)
ylabel ('E/E_{B=0}, Stairwise Staggered','fontweight','bold', 'fontsize', 15)
set(gcf,'color','w')
set(gca,'fontsize',15,'YTick',[0 1 2:2:20])
str2 = 'E_{\rho=\infty} = 1';
text(40,2,str2,'fontsize',15,'color',"#A2142F");
axis square
legend('E_p/E_m=10','E_p/E_m=100','E_p/E_m=500','E_p/E_m=1000','fontsize',12)
