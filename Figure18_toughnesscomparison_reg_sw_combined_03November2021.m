tic
figure
subplot(1,2,1);
rr=1:1:120; %aspect ratio
Ep=7e5; %Young's modulus of platelet
Em=1960;%Young's modulus of matrix
num=0.4; %Poisson's ratio of matrix
sigmcrit=243.05; %Normal strength of matrix
sigpcrit=1400;%Normal strength of platelet
taumcrit=140; %shear strength of matrix
hnol= 1/50;%halfnonoverlap to overlaplength ratio
b=10; %%2b is the width of platelet
[Ereg,ar,sig,Lp,nmlztoughzhang,w,Lb,h,vf1,eqn1]=deal(zeros(size(rr)));
Gm1=Em/(2*(1+num)); %Shear modulus of matrix
gbe=Gm1/Ep;
z=0.5;
pr=0.5; %platelet volume fraction
for i=1:numel(rr)
    rrcrit=sigpcrit/taumcrit;
      ar(i)=(pr.*rr(i).*rr(i).*gbe)./(3*(1-pr));
    Ereg(i)=(((4./3)+((3*z.*(1-z).*ar(i)).^-1)).^-1)*pr*Ep;
    if rr(i)<=rrcrit
        sig(i)=pr*sigpcrit*rr(i)./(2*rrcrit);
    else
        sig(i)=pr*sigpcrit./2;
    end
    w(i)=(sig(i).^2)./(2*Ereg(i));
    wp=sigpcrit.^2/(2*Ep);
    nmlztoughzhang(i)=w(i)./wp;
end
plot(rr,nmlztoughzhang,':r','linewidth', 2)
hold on;

[SMP1,SMP2]=deal(zeros(size(rr)));
for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    vf=0.5;
    h(i)=((2*rr(i)*b*b)./(vf*(Lb(i)+(rr(i)*b))))-(2*b);
    vf1(i)=2*rr(i)*b*b/(((rr(i)*b)+Lb(i))*((2*b)+h(i))); %volume fraction
    SMP1(i)=regtoughsmf(Ep,Em,num,b,Lb(i),h(i),rr(i),sigpcrit,sigmcrit,taumcrit);
    SMP2(i)=regtoughsmfBzer(Ep,Em,num,b,Lb(i),h(i),rr(i),sigpcrit,sigmcrit,taumcrit);
end
plot(rr,SMP1,'-.b','linewidth', 2)
hold on;
plot(rr,SMP2,'g','linewidth', 1.5)
xlabel ('\rho', 'fontsize', 15,'fontweight','bold')
ylabel ('w^{reg}_{critical}/ w_{pcritical}','fontweight','bold', 'fontsize', 15)
z1=legend ('Zhang et al., 2010','Kim et al., 2018','Present study, VI ignored','fontsize',10);
set(z1,'FontSize',12);
set(gcf,'color','w')
set(gca,'fontsize',15)

axis square
subplot(1,2,2);

Ep=7e5;
Em=1960;
num=0.4;
sigmcrit=243.05;
sigpcrit=1400;
taumcrit=140;
hnol= 1/50;%halfnonoverlap to overlaplength ratio
b=10; %%2b is the width of platelet
Gm1=Em/(2*(1+num));
gbe=Gm1/Ep;
z=0.5;
n=5;
rr=1:1:120;
[Esw,ar,sig,Lp,nmlztoughzhang,w,Lb,h,vf1,eqn1]=deal(zeros(size(rr)));
pr=0.5;
for i=1:numel(rr)
    sigtotau=sigpcrit/taumcrit;
%      n=5;
     ar(i)=(pr.*rr(i).*rr(i).*gbe)./(3*(1-pr));
     Esw(i)=((n*((3*n)-4)./(3.*((n-1).^2)))+(n.*n./(3*(n-1).*ar(i)))).^-1;
        rr2crit=(n-1)*sigtotau;
  
    if rr(i)<=rr2crit
        nmlztoughzhang(i)=pr*(((n-1)*rr(i)).^2)/(n*n*rr2crit*rr2crit*Esw(i)); %we're not normalizing w.r.t
        %volume fraction, so the original terms are multiplied with pr
    else
        nmlztoughzhang(i)=pr*(n-1).^2/(n*Esw(i)*n);
    end
end
[SMP1,SMP2]=deal(zeros(size(rr)));

for i=1:numel(rr)
    Lb(i)=hnol*rr(i)*b/(1+hnol);
    vf=0.5;
    h(i)=((2*rr(i)*b*b)./(vf*(Lb(i)+(rr(i)*b))))-(2*b);
    vf1(i)=2*rr(i)*b*b/(((rr(i)*b)+Lb(i))*((2*b)+h(i))); %volume fraction
    SMP1(i)=swtoughsmf(n,Ep,Em,num,b,Lb(i),h(i),rr(i),sigpcrit,sigmcrit,taumcrit);
    SMP2(i)=swtoughsmfbzer(n,Ep,Em,num,b,Lb(i),h(i),rr(i),sigpcrit,sigmcrit,taumcrit);
end
plot(rr,nmlztoughzhang,':r','linewidth', 2)
hold on;
plot(rr,SMP1,'-.b','linewidth', 2)
hold on;
plot(rr,SMP2,'g','linewidth', 1.5)
hold on;
xlabel ('\rho', 'fontsize', 15,'fontweight','bold')
ylabel ('w^{sw}_{critical}/ w^p_{critical}','fontweight','bold', 'fontsize', 15)
z2=legend ('Zhang et al., 2010','Present study','Present study, VI ignored');
set(z2,'FontSize',12);
set(gcf,'color','w')
set(gca,'fontsize',15)
xlim([0,120])
axis square
toc

