clear all

format long

global n
global symp 
global hs
global age
global gen
global re
global rp

global b1
global b2
global b3
global b4
global b5
global b6
global b7
global b8

global picu
global phosp
global preco
global parp

global pmaicu pmlicu pmuicu
global pmahosp pmlhosp pmuhosp
global pmareco pmlreco pmureco
global pmarp pmlrp pmurp

data = csvread('COVID19eng.csv');

%data = load('value.txt');

d1 = size(data)
n = d1(1)
gen = data(:,6);
age = data(:,7);

ms1 = data(:,12);
ms2 = data(:,13);
ms3 = data(:,14);
ms4 = data(:,15);
ms5 = data(:,16);
ms6 = data(:,17);
ms7 = data(:,19);
ms8 = data(:,20);
ms9 = data(:,21);

ns10 = data(:,18);
ns11 = data(:,22);
ns12 = data(:,23);
ns13 = data(:,24);

ns1 = ms3;
ns2 = ms4;
ns3 = ms7;
ns4 = ms5;
ns5 = ms9;
ns6 = ms1;
ns7 = ms2;
ns8 = ms8;
ns9 = ms6;


hs = data(:,25);
re = data(:,26);
de = data(:,29);

ow = data(:,10);
rw = data(:,27);

for i = 1:n
    if (ow(i) < 99)&&(rw(i) < 99)
        rp(i) = rw(i)-ow(i);
    end
end  

rp1 = max(rp)
rp2 = min(rp)


sum1 = 0;
sum2 = 0;
sum3 = 0;
sum4 = 0;
sum5 = 0;
sum6 = 0;
sum7 = 0;
sum8 = 0;
sum9 = 0;
sum10 = 0;


for i = 1:n
    if ns1(i) > 1
        ns1(i) = 0;
    end
    sum1 = sum1 + ns1(i);
    
    if ns2(i) > 1
        ns2(i) = 0;
    end
    sum2 = sum2 + ns2(i);
    
    if ns3(i) > 1
        ns3(i) = 0;
    end
    sum3 = sum3 + ns3(i);
    
    if ns4(i) > 1
        ns4(i) = 0;
    end
    sum4 = sum4 + ns4(i);
    
    if ns5(i) > 1
        ns5(i) = 0;
    end
    sum5 = sum5 + ns5(i);
    
    if ns6(i) > 1
        ns6(i) = 0;
    end
    sum6 = sum6 + ns6(i);
    
    if ns7(i) > 1
        ns7(i) = 0;
    end
    sum7 = sum7 + ns7(i);
    
    if ns8(i) > 1
        ns8(i) = 0;
    end
    sum8 = sum8 + ns8(i);
    
    if ns9(i) > 1
        ns9(i) = 0;
    end
    sum9 = sum9 + ns9(i);
    
     if ns10(i) > 1
        ns10(i) = 0;
    end
    sum10 = sum10 + ns10(i);
    
end    

sum1v = sum1
sum2v = sum2
sum3v = sum3
sum4v = sum4
sum5v = sum5
sum6v = sum6
sum7v = sum7
sum8v = sum8
sum9v = sum9
sum10v = sum10

for i = 1:n
    sym11 = ns2(i)+2*ns3(i)+4*ns4(i)+8*ns5(i)+16*ns6(i);
    sym22 = 32*ns7(i)+64*ns8(i)+128*ns9(i);
    symp(i) = sym11+sym22;
end

symp1 = symp;

for j1 = 1:256
    j = j1-1;
    sum = 0;
    for i = 1:n
        if symp(i) == j
            sum = sum + 1;
        end
    end        
    nsymp(j1)= sum;
end

for j = 2:256
    j1 = j-1;
    nzsymp(j1) = nsymp(j);
end 

nzsymp1 = nzsymp;

   sumnz = 0;
   sumtot = 0;
for j = 1:255
    if nzsymp(j) >= 100
        sumnz = sumnz + 1;
    end
    
    sumtot = sumtot + nzsymp(j);
end

sumnz1 = sumnz
sumtot1 = sumtot

for j = 1:255
    mm(j) = j;
end 

figure(1)
plot(mm,nzsymp,'b.')

b11 = zeros(256,1);
b22 = zeros(256,1);
b33 = zeros(256,1);
b44 = zeros(256,1);
b55 = zeros(256,1);
b66 = zeros(256,1);
b77 = zeros(256,1);
b88 = zeros(256,1);

for i8 = 1:2
    i88 = i8 - 1;
    for i7 = 1:2
        i77 = i7 - 1;
        for i6 = 1:2
            i66 = i6 - 1;
            for i5 = 1:2
                i55 = i5 - 1;
                for i4 = 1:2
                    i44 = i4 - 1;
                    for i3 = 1:2
                        i33 = i3 - 1;
                        for i2 = 1:2
                            i22 = i2 - 1;
                            for i1 = 1:2
                                i11 = i1 - 1;
                                n1 = 128*i88+64*i77+32*i66+16*i55;
                                n2 = 8*i44+4*i33+2*i22+i11;
                                n12 = n1+n2+1;
                                b11(n12) = i11;
                                b22(n12) = i22;
                                b33(n12) = i33;
                                b44(n12) = i44;
                                b55(n12) = i55;
                                b66(n12) = i66;
                                b77(n12) = i77;
                                b88(n12) = i88;
                            end
                        end
                    end
                end
            end
        end
    end
end   

b8 = zeros(255,1);
b7 = zeros(255,1);
b6 = zeros(255,1);
b5 = zeros(255,1);
b4 = zeros(255,1);
b3 = zeros(255,1);
b2 = zeros(255,1);
b1 = zeros(255,1);

for j = 2:256
    j1 = j-1;
    b1(j1) = b11(j);
    b2(j1) = b22(j);
    b3(j1) = b33(j);
    b4(j1) = b44(j);
    b5(j1) = b55(j);
    b6(j1) = b66(j);
    b7(j1) = b77(j);
    b8(j1) = b88(j);
end    
    

U = table(b8,b7,b6,b5,b4,b3,b2,b1);

 picu = zeros(2040,1);
phosp = zeros(2040,1);
preco = zeros(2040,1);
 parp = zeros(2040,1);
 
npnum = zeros(2040,1);
 
 for j = 1:2040
     npnum(j) = j;
 end    

npa1g1 = patients(1);
npa2g1 = patients(2);
npa3g1 = patients(3);
npa4g1 = patients(4);
npa5g1 = patients(5);
npa6g1 = patients(6);
npa7g1 = patients(7);
npa8g1 = patients(8);


figure(10)
subplot(2,4,1)
plot(mm,npa1g1,'b.')
title('Age gr. 1')
xlabel('symptom number')
ylabel('Patients per 100')

subplot(2,4,2)
plot(mm,npa2g1,'b.')
title('Age gr. 2')
xlabel('symptom number')
ylabel('Patients per 100')

subplot(2,4,3)
plot(mm,npa3g1,'b.')
title('Age gr. 3')
xlabel('symptom number')
ylabel('Patients per 100')

subplot(2,4,4)
plot(mm,npa4g1,'b.')
title('Age gr. 4')
xlabel('symptom number')
ylabel('Patients per 100')

subplot(2,4,5)
plot(mm,npa5g1,'b.')
title('Age gr. 5')
xlabel('symptom number')
ylabel('Patients per 100')

subplot(2,4,6)
plot(mm,npa6g1,'b.')
title('Age gr. 6')
xlabel('symptom number')
ylabel('Patients per 100')

subplot(2,4,7)
plot(mm,npa7g1,'b.')
title('Age gr. 7')
xlabel('symptom number')
ylabel('Patients per 100')

subplot(2,4,8)
plot(mm,npa8g1,'b.')
title('Age gr. 8')
xlabel('symptom number')
ylabel('Patients per 100')


[ha1g1s1,ha1g1s2,ha1g1s3] = hosp(1);
[ha2g1s1,ha2g1s2,ha2g1s3] = hosp(2);
[ha3g1s1,ha3g1s2,ha3g1s3] = hosp(3);
[ha4g1s1,ha4g1s2,ha4g1s3] = hosp(4);
[ha5g1s1,ha5g1s2,ha5g1s3] = hosp(5);
[ha6g1s1,ha6g1s2,ha6g1s3] = hosp(6);
[ha7g1s1,ha7g1s2,ha7g1s3] = hosp(7);
[ha8g1s1,ha8g1s2,ha8g1s3] = hosp(8);

[pha1av,pha1lw,pha1up] = pdicu(1,mm,ha1g1s1);
[pha2av,pha2lw,pha2up] = pdicu(2,mm,ha2g1s1);
[pha3av,pha3lw,pha3up] = pdicu(3,mm,ha3g1s1);
[pha4av,pha4lw,pha4up] = pdicu(4,mm,ha4g1s1);
[pha5av,pha5lw,pha5up] = pdicu(5,mm,ha5g1s1);
[pha6av,pha6lw,pha6up] = pdicu(6,mm,ha6g1s1);
[pha7av,pha7lw,pha7up] = pdicu(7,mm,ha7g1s1);
[pha8av,pha8lw,pha8up] = pdicu(8,mm,ha8g1s1);


figure(11)
subplot(4,2,1)
plot(mm,ha1g1s1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 1','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ICU per 100','FontSize',14)
hold on
plot(mm,pha1av,'b-','LineWidth',2)
plot(mm,pha1up,'r-','LineWidth',2)
plot(mm,pha1lw,'g-','LineWidth',2)
hold off

subplot(4,2,2)
plot(mm,ha2g1s1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 2','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ICU per 100','FontSize',14)
hold on
plot(mm,pha2av,'b-','LineWidth',2)
plot(mm,pha2up,'r-','LineWidth',2)
plot(mm,pha2lw,'g-','LineWidth',2)
hold off

subplot(4,2,3)
plot(mm,ha3g1s1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 3','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ICU per 100','FontSize',14)
hold on
plot(mm,pha3av,'b-','LineWidth',2)
plot(mm,pha3up,'r-','LineWidth',2)
plot(mm,pha3lw,'g-','LineWidth',2)
hold off

subplot(4,2,4)
plot(mm,ha4g1s1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 4','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ICU per 100','FontSize',14)
hold on
plot(mm,pha4av,'b-','LineWidth',2)
plot(mm,pha4up,'r-','LineWidth',2)
plot(mm,pha4lw,'g-','LineWidth',2)
hold off

subplot(4,2,5)
plot(mm,ha5g1s1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 5','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ICU per 100','FontSize',14)
hold on
plot(mm,pha5av,'b-','LineWidth',2)
plot(mm,pha5up,'r-','LineWidth',2)
plot(mm,pha5lw,'g-','LineWidth',2)
hold off

subplot(4,2,6)
plot(mm,ha6g1s1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 6','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ICU per 100','FontSize',14)
hold on
plot(mm,pha6av,'b-','LineWidth',2)
plot(mm,pha6up,'r-','LineWidth',2)
plot(mm,pha6lw,'g-','LineWidth',2)
hold off

subplot(4,2,7)
plot(mm,ha7g1s1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 7','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ICU per 100','FontSize',14)
hold on
plot(mm,pha7av,'b-','LineWidth',2)
plot(mm,pha7up,'r-','LineWidth',2)
plot(mm,pha7lw,'g-','LineWidth',2)
hold off

subplot(4,2,8)
plot(mm,ha8g1s1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 8','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ICU per 100','FontSize',14)
hold on
plot(mm,pha8av,'b-','LineWidth',2)
plot(mm,pha8up,'r-','LineWidth',2)
plot(mm,pha8lw,'g-','LineWidth',2)
hold off

[phb1av,phb1lw,phb1up] = pdhosp(1,mm,ha1g1s2);
[phb2av,phb2lw,phb2up] = pdhosp(2,mm,ha2g1s2);
[phb3av,phb3lw,phb3up] = pdhosp(3,mm,ha3g1s2);
[phb4av,phb4lw,phb4up] = pdhosp(4,mm,ha4g1s2);
[phb5av,phb5lw,phb5up] = pdhosp(5,mm,ha5g1s2);
[phb6av,phb6lw,phb6up] = pdhosp(6,mm,ha6g1s2);
[phb7av,phb7lw,phb7up] = pdhosp(7,mm,ha7g1s2);
[phb8av,phb8lw,phb8up] = pdhosp(8,mm,ha8g1s2);

figure(12)
subplot(4,2,1)
plot(mm,ha1g1s2,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 1','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Hospitalized per 100','FontSize',14)
hold on
plot(mm,phb1av,'b-','LineWidth',2)
plot(mm,phb1up,'r-','LineWidth',2)
plot(mm,phb1lw,'g-','LineWidth',2)
hold off

subplot(4,2,2)
plot(mm,ha2g1s2,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 2','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Hospitalized per 100','FontSize',14)
hold on
plot(mm,phb2av,'b-','LineWidth',2)
plot(mm,phb2up,'r-','LineWidth',2)
plot(mm,phb2lw,'g-','LineWidth',2)
hold off

subplot(4,2,3)
plot(mm,ha3g1s2,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 3','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Hospitalized per 100','FontSize',14)
hold on
plot(mm,phb3av,'b-','LineWidth',2)
plot(mm,phb3up,'r-','LineWidth',2)
plot(mm,phb3lw,'g-','LineWidth',2)
hold off

subplot(4,2,4)
plot(mm,ha4g1s2,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 4','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Hospitalized per 100','FontSize',14)
hold on
plot(mm,phb4av,'b-','LineWidth',2)
plot(mm,phb4up,'r-','LineWidth',2)
plot(mm,phb4lw,'g-','LineWidth',2)
hold off

subplot(4,2,5)
plot(mm,ha5g1s2,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 5','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Hospitalized per 100','FontSize',14)
hold on
plot(mm,phb5av,'b-','LineWidth',2)
plot(mm,phb5up,'r-','LineWidth',2)
plot(mm,phb5lw,'g-','LineWidth',2)
hold off

subplot(4,2,6)
plot(mm,ha6g1s2,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 6','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Hospitalized per 100','FontSize',14)
hold on
plot(mm,phb6av,'b-','LineWidth',2)
plot(mm,phb6up,'r-','LineWidth',2)
plot(mm,phb6lw,'g-','LineWidth',2)
hold off

subplot(4,2,7)
plot(mm,ha7g1s2,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 7','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Hospitalized per 100','FontSize',14)
hold on
plot(mm,phb7av,'b-','LineWidth',2)
plot(mm,phb7up,'r-','LineWidth',2)
plot(mm,phb7lw,'g-','LineWidth',2)
hold off

subplot(4,2,8)
plot(mm,ha8g1s2,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 8','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Hospitalized per 100','FontSize',14)
hold on
plot(mm,phb8av,'b-','LineWidth',2)
plot(mm,phb8up,'r-','LineWidth',2)
plot(mm,phb8lw,'g-','LineWidth',2)
hold off


[rea1g1,dea1g1] = reco(1);
[rea2g1,dea2g1] = reco(2);
[rea3g1,dea3g1] = reco(3);
[rea4g1,dea4g1] = reco(4);
[rea5g1,dea5g1] = reco(5);
[rea6g1,dea6g1] = reco(6);
[rea7g1,dea7g1] = reco(7);
[rea8g1,dea8g1] = reco(8);

[pre5av,pre5lw] = pdicrec(5,mm,rea5g1);
[pre6av,pre6lw] = pdicrec(6,mm,rea6g1);
[pre7av,pre7lw] = pdicrec(7,mm,rea7g1);
[pre8av,pre8lw] = pdicrec(8,mm,rea8g1);



figure(13)
subplot(4,2,1)
plot(mm,rea1g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 1','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Recovered per 100','FontSize',14)

subplot(4,2,2)
plot(mm,rea2g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 2','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Recovered per 100','FontSize',14)

subplot(4,2,3)
plot(mm,rea3g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 3','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Recovered per 100','FontSize',14)

subplot(4,2,4)
plot(mm,rea4g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 4','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Recovered per 100','FontSize',14)

subplot(4,2,5)
plot(mm,rea5g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 5','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Recovered per 100','FontSize',14)
hold on
plot(mm,pre5av,'b-','LineWidth',2)
plot(mm,pre5lw,'r-','LineWidth',2)
hold off

subplot(4,2,6)
plot(mm,rea6g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 6','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Recovered per 100','FontSize',14)
hold on
plot(mm,pre6av,'b-','LineWidth',2)
plot(mm,pre6lw,'r-','LineWidth',2)
hold off

subplot(4,2,7)
plot(mm,rea7g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 7','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Recovered per 100','FontSize',14)
hold on
plot(mm,pre7av,'b-','LineWidth',2)
plot(mm,pre7lw,'r-','LineWidth',2)
hold off

subplot(4,2,8)
plot(mm,rea8g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 8','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('Recovered per 100','FontSize',14)
hold on
plot(mm,pre8av,'b-','LineWidth',2)
plot(mm,pre8lw,'r-','LineWidth',2)
hold off


rpa1g1 = repe(1);
rpa2g1 = repe(2);
rpa3g1 = repe(3);
rpa4g1 = repe(4);
rpa5g1 = repe(5);
rpa6g1 = repe(6);
rpa7g1 = repe(7);
rpa8g1 = repe(8);

[prp1av,prp1lw,prp1up] = pdicrep(1,mm,rpa1g1);
[prp2av,prp2lw,prp2up] = pdicrep(2,mm,rpa2g1);
[prp3av,prp3lw,prp3up] = pdicrep(3,mm,rpa3g1);
[prp4av,prp4lw,prp4up] = pdicrep(4,mm,rpa4g1);
[prp5av,prp5lw,prp5up] = pdicrep(5,mm,rpa5g1);
[prp6av,prp6lw,prp6up] = pdicrep(6,mm,rpa6g1);
[prp7av,prp7lw,prp7up] = pdicrep(7,mm,rpa7g1);
[prp8av,prp8lw,prp8up] = pdicrep(8,mm,rpa8g1);

figure(14)
subplot(4,2,1)
plot(mm,rpa1g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 1','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ARP (week)','FontSize',14)
hold on
plot(mm,prp1av,'b-','LineWidth',2)
plot(mm,prp1lw,'g-','LineWidth',2)
plot(mm,prp1up,'r-','LineWidth',2)
hold off

subplot(4,2,2)
plot(mm,rpa2g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 2','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ARP (week)','FontSize',14)
hold on
plot(mm,prp2av,'b-','LineWidth',2)
plot(mm,prp2lw,'g-','LineWidth',2)
plot(mm,prp2up,'r-','LineWidth',2)
hold off

subplot(4,2,3)
plot(mm,rpa3g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 3','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ARP (week)','FontSize',14)
hold on
plot(mm,prp3av,'b-','LineWidth',2)
plot(mm,prp3lw,'g-','LineWidth',2)
plot(mm,prp3up,'r-','LineWidth',2)
hold off

subplot(4,2,4)
plot(mm,rpa4g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 4','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ARP (week)','FontSize',14)
hold on
plot(mm,prp4av,'b-','LineWidth',2)
plot(mm,prp4lw,'g-','LineWidth',2)
plot(mm,prp4up,'r-','LineWidth',2)
hold off

subplot(4,2,5)
plot(mm,rpa5g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 5','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ARP (week)','FontSize',14)
hold on
plot(mm,prp5av,'b-','LineWidth',2)
plot(mm,prp5lw,'g-','LineWidth',2)
plot(mm,prp5up,'r-','LineWidth',2)
hold off

subplot(4,2,6)
plot(mm,rpa6g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 6','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ARP (week)','FontSize',14)
hold on
plot(mm,prp6av,'b-','LineWidth',2)
plot(mm,prp6lw,'g-','LineWidth',2)
plot(mm,prp6up,'r-','LineWidth',2)
hold off

subplot(4,2,7)
plot(mm,rpa7g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 7','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ARP (week)','FontSize',14)
hold on
plot(mm,prp7av,'b-','LineWidth',2)
plot(mm,prp7lw,'g-','LineWidth',2)
plot(mm,prp7up,'r-','LineWidth',2)
hold off

subplot(4,2,8)
plot(mm,rpa8g1,'k.','MarkerSize',10)
set(gca,'LineWidth',2,'FontSize',14,'Box','on')
title('Age gr. 8','FontSize',14)
xlabel('symptom label','FontSize',14)
ylabel('ARP (week)','FontSize',14)
hold on
plot(mm,prp8av,'b-','LineWidth',2)
plot(mm,prp8lw,'g-','LineWidth',2)
plot(mm,prp8up,'r-','LineWidth',2)
hold off


W = table(npnum,picu,phosp,preco,parp);

fileID = fopen ('icu.txt','w');
fprintf(fileID,'%12.8f\n',picu);
fclose(fileID);

fileID = fopen ('hosp.txt','w');
fprintf(fileID,'%12.8f\n',phosp);
fclose(fileID);

fileID = fopen ('reco.txt','w');
fprintf(fileID,'%12.8f\n',preco);
fclose(fileID);

fileID = fopen ('arp.txt','w');
fprintf(fileID,'%12.8f\n',parp);
fclose(fileID);

%------------------------------------

fileID = fopen ('paicu.txt','w');
fprintf(fileID,'%12.8f\n',pmaicu);
fclose(fileID);

fileID = fopen ('plicu.txt','w');
fprintf(fileID,'%12.8f\n',pmlicu);
fclose(fileID);

fileID = fopen ('puicu.txt','w');
fprintf(fileID,'%12.8f\n',pmuicu);
fclose(fileID);

fileID = fopen ('pahosp.txt','w');
fprintf(fileID,'%12.8f\n',pmahosp);
fclose(fileID);

fileID = fopen ('plhosp.txt','w');
fprintf(fileID,'%12.8f\n',pmlhosp);
fclose(fileID);

fileID = fopen ('puhosp.txt','w');
fprintf(fileID,'%12.8f\n',pmuhosp);
fclose(fileID);

fileID = fopen ('pareco.txt','w');
fprintf(fileID,'%12.8f\n',pmareco);
fclose(fileID);

fileID = fopen ('plreco.txt','w');
fprintf(fileID,'%12.8f\n',pmlreco);
fclose(fileID);

fileID = fopen ('pureco.txt','w');
fprintf(fileID,'%12.8f\n',pmureco);
fclose(fileID);

fileID = fopen ('parp.txt','w');
fprintf(fileID,'%12.8f\n',pmarp);
fclose(fileID);

fileID = fopen ('plrp.txt','w');
fprintf(fileID,'%12.8f\n',pmlrp);
fclose(fileID);

fileID = fopen ('purp.txt','w');
fprintf(fileID,'%12.8f\n',pmurp);
fclose(fileID);

%----------------------------
 pd1 = psymp(8)
 mm2 = size(pd1);
  mm = mm2(2)
  
      ii = 0;
  for jj = 1:mm
      if ha8g1s2(pd1(jj)) >= 1
          ii = ii+1;
          t(ii) = pd1(jj);
      y(ii) = ha8g1s2(pd1(jj));
      end
  end
  
  ymax = max(y);
  
  %ii = 0;
  %for jj = 1:255
  %    if ha1g1s1(jj) >= 1
  %        ii = ii+1;
  %        t(ii) = jj;
  %        y(ii) = ha1g1s1(jj);
  %    end
  %end
  
  %ysize = size(y)
  
   
 % for k = 1:17
 %     kk = k-1;
 %     sum = 0;
 %     k1 = 5*kk;
 %     sum = sum+y(k1+1)+y(k1+2)+y(k1+3)+y(k1+4)+y(k1+5);
 %     yave = sum/5;
 %     y(k1+1) = yave;
 %     y(k1+2) = yave;
 %     y(k1+3) = yave;
 %     y(k1+4) = yave;
 %     y(k1+5) = yave;
 % end
      
  
  figure(31)
  plot(t,y,'r.')
  title('Data points')
  
  %xdata = t;
  
  F = @(x,xdata)x(1)*exp(x(2)*(xdata).^x(3));
  x0 = [1 1 0.25];
  [x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,t,y)
  
  yp = F(x,t(end));
  
  z(1) = x(1);
  z(2) = log((ymax-yp)/x(1))/(t(end)^x(3));
  z(3) = x(3);
  F1 = @(z,xdata)z(1)*exp(z(2)*(xdata).^z(3));
  
  G = @(x1,xdata)x1(1)+x1(2)*(1+(x1(3)*xdata).^x1(4)).^(-1);
  x10 = [1 1 1 1];
  [x1,resnorm,~,exitflag,output] = lsqcurvefit(G,x10,t,y)
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,t,y)
  
  yp1 = H(x2,t(end));
  
  z1(1) = (ymax-yp1)/(t(end)^x2(2));
  z1(2) = x2(2);
  
  H1 = @(z1,xdata)z1(1)*(xdata).^z1(2);
  
  p = polyfit(t,y,5);
  y1 = polyval(p,t);
  
  %tol = (.05)^2*(t(end)-t(1));
  %randomStream = RandStream.create( 'mcg16807', 'Seed', 23 );
  %tol = sum((.3*(rand(randomStream, size(t))-.5)).^2);
  %[sp,ys,rho] = spaps(t,y,tol,ones(size(t)));
  
  epsilon = ((t(end)-t(1))/(numel(t)-1))^3/16;
  p = 1/(1+epsilon*10^(1-3));
  
  p1 = 0.001;
  
  yy = csaps(t,y,p,t);
  
  yy1 = csaps(t,y,p1,t);
  
  hold on
  plot(t,F(x,t)+F1(z,t),'r*')
  plot(t,F(x,t),'r+')
  %plot(t,G(x1,t),'g*')
  plot(t,H(x2,t)+H1(z1,t),'b*')
  plot(t,H(x2,t),'b+')
  plot(t,y1,'g-')
  %fnplt(sp)
  %plot(t,ys,'b-')
  plot(t,yy1,'k-')
  hold off
 

%---------------------------

  ii = 0;
  for jj = 1:255
      if ha8g1s2(jj) >= 1
          ii = ii+1;
          t(ii) = jj;
          y(ii) = ha8g1s2(jj);
      end
  end
  
   ymax = max(y);
   
  %ysize = size(y)
  
   
 % for k = 1:17
 %     kk = k-1;
 %     sum = 0;
 %     k1 = 5*kk;
 %     sum = sum+y(k1+1)+y(k1+2)+y(k1+3)+y(k1+4)+y(k1+5);
 %     yave = sum/5;
 %     y(k1+1) = yave;
 %     y(k1+2) = yave;
 %     y(k1+3) = yave;
 %     y(k1+4) = yave;
 %     y(k1+5) = yave;
 % end
      
  
  figure(32)
  plot(t,y,'r.')
  title('Data points')
  
  %xdata = t;
  
  F = @(x,xdata)x(1)*exp(x(2)*(xdata).^x(3));
  x0 = [1 1 0.25];
  [x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,t,y)
  
  yp = F(x,t(end));
  
  z(1) = x(1);
  z(2) = log((ymax-yp)/x(1))/(t(end)^x(3));
  z(3) = x(3);
  F1 = @(z,xdata)z(1)*exp(z(2)*(xdata).^z(3));
  
  G = @(x1,xdata)x1(1)+x1(2)*(1+(x1(3)*xdata).^x1(4)).^(-1);
  x10 = [1 1 1 1];
  [x1,resnorm,~,exitflag,output] = lsqcurvefit(G,x10,t,y)
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,t,y)
  
  yp1 = H(x2,t(end));
  
  z1(1) = (ymax-yp1)/(t(end)^x2(2));
  z1(2) = x2(2);
  
  H1 = @(z1,xdata)z1(1)*(xdata).^z1(2);
  
  p = polyfit(t,y,5);
  y1 = polyval(p,t);
  
  %tol = (.05)^2*(t(end)-t(1));
  %randomStream = RandStream.create( 'mcg16807', 'Seed', 23 );
  %tol = sum((.3*(rand(randomStream, size(t))-.5)).^2);
  %[sp,ys,rho] = spaps(t,y,tol,ones(size(t)));
  
  epsilon = ((t(end)-t(1))/(numel(t)-1))^3/16;
  p = 1/(1+epsilon*10^(1-3));
  
  p1 = 0.001;
  
  yy = csaps(t,y,p,t);
  
  yy1 = csaps(t,y,p1,t);
  
  hold on
  plot(t,F(x,t)+F1(z,t),'r*')
  plot(t,F(x,t),'r+')
  %plot(t,G(x1,t),'g*')
  plot(t,H(x2,t)+H1(z1,t),'b*')
  plot(t,H(x2,t),'b+')
  plot(t,y1,'g-')
  %fnplt(sp)
  %plot(t,ys,'b-')
  plot(t,yy1,'k-')
  hold off
 

%---------------------------

%---------------------------
 pd1 = psymp(8)
 mm2 = size(pd1);
  mm = mm2(2)
 
 %m1 = 255
  
        ii = 0;
  for jj = 1:mm
      if ha8g1s2(pd1(jj)) >= 1
          ii = ii+1;
          tp1(ii) = pd1(jj);
      yp1(ii) = ha8g1s2(pd1(jj));
      end
  end
  
  
  yp1min = min(yp1)
  
 % mm2 = size(yp1)
 % mm = mm2(2)
  
  ndiv = 5;
  
  nn = round(mm/ndiv)
  kk = mod(mm,ndiv)
  
  
  for i = 1:nn
       j = ndiv*(i-1)+1;
      maxy = yp1(j);
      tp2(i) = tp1(j);
      yp2(i) = maxy;
        if (i == nn)&&(kk > 1)
            n1 = kk-1
        else
            n1 = ndiv-1
        end
      for k = 1:n1
         
          if yp1(j+k) > maxy
              maxy = yp1(j+k);
              tp2(i) = tp1(j+k);
              yp2(i) = maxy;
          end
      end
  end
  
  
  %ii = 0;
  %for jj = 1:255
  %    if ha1g1s1(jj) >= 1
  %        ii = ii+1;
  %        t(ii) = jj;
  %        y(ii) = ha1g1s1(jj);
  %    end
  %end
  
  %ysize = size(y)
  
   
 % for k = 1:17
 %     kk = k-1;
 %     sum = 0;
 %     k1 = 5*kk;
 %     sum = sum+y(k1+1)+y(k1+2)+y(k1+3)+y(k1+4)+y(k1+5);
 %     yave = sum/5;
 %     y(k1+1) = yave;
 %     y(k1+2) = yave;
 %     y(k1+3) = yave;
 %     y(k1+4) = yave;
 %     y(k1+5) = yave;
 % end
      
  
  figure(33)
  plot(tp1,yp1,'r.')
  title('Data points')
  hold on
  plot(tp2,yp2,'bo')
  %xdata = t;
  
  F = @(x,xdata)x(1)*exp(-x(2)*(xdata).^x(3));
  x0 = [1 1 0.25];
  [x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,tp1,yp1)
  
  F9 = @(x9,xdata)x9(1)*exp(-x9(2)*(xdata).^x9(3));
  x90 = [1 1 0.25];
  [x9,resnorm,~,exitflag,output] = lsqcurvefit(F,x90,tp2,yp2)
  
  yp = F(x,tp1(end));
  
  z(1) = log(1.0/abs(yp-yp1min))/(tp1(end)^x(3));
  z(2) = x(3);
  F1 = @(z,xdata)exp(-z(1)*(xdata).^z(2));
  
  G = @(x1,xdata)x1(1)+x1(2)*(1+(x1(3)*xdata).^x1(4)).^(-1);
  x10 = [1 1 1 1];
  [x1,resnorm,~,exitflag,output] = lsqcurvefit(G,x10,tp1,yp1)
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,tp1,yp1)
  
  yp9 = H(x2,tp1(end));
  
  %z1(1) = x2(1);
  %z1(2) = log(abs((ymin-yp1)/x2(1)))/log(t(end));
  z1(1) = abs(2*yp1min-yp9)/(tp1(end)^x2(2));
  z1(2) = x2(2);
  
  H1 = @(z1,xdata)z1(1)*(xdata).^z1(2);
  
  H3 = @(x3,xdata)x3(1)*(xdata).^x3(2);
  x30 = [1 0.5];
  [x3,resnorm,~,exitflag,output] = lsqcurvefit(H3,x30,tp2,yp2)
  
  p = polyfit(tp1,yp1,2);
  y1 = polyval(p,tp1);
  
  %tol = (.05)^2*(t(end)-t(1));
  %randomStream = RandStream.create( 'mcg16807', 'Seed', 23 );
  %tol = sum((.3*(rand(randomStream, size(t))-.5)).^2);
  %[sp,ys,rho] = spaps(t,y,tol,ones(size(t)));
  
  epsilon = ((tp1(end)-tp1(1))/(numel(tp1)-1))^3/16;
  p = 1/(1+epsilon*10^(1-3));
  
  p1 = 0.001;
  
  yy = csaps(tp1,yp1,p,t);
  
  yy1 = csaps(tp1,yp1,p1,t);
  
  hold on
  %plot(tr1,F(x,tr1),'r+')
  %plot(tr1,F9(x9,tr1),'ro')
  %plot(t,G(x1,t),'g*')
  %plot(tr1,H(x2,tr1)-H1(z1,tr1),'b*')
  plot(tp1,H(x2,tp1),'b*')
  plot(tp1,H3(x3,tp1),'b>')
  %plot(tr1,y1,'g-')
  %fnplt(sp)
  %plot(t,ys,'b-')
  %plot(tr1,yy1,'k-')
  hold off
 

%---------------------------
%---------------------------


 pd1 = psympre(6)
 mm2 = size(pd1);
  mm = mm2(2)
  
  re22 = min(rea6g1)
  
      ii = 0;
  for jj = 1:mm
      if rea6g1(pd1(jj)) <= 99.999999999999
          ii = ii+1;
          tr1(ii) = pd1(jj);
      yr1(ii) = rea6g1(pd1(jj));
      end
  end
  
  yr1min = min(yr1)
  
  nn = round(mm/5)
  kk = mod(mm,5)
  
  
  for i = 1:nn
       j = 5*(i-1)+1;
      miny = yr1(j);
      tr2(i) = tr1(j);
      yr2(i) = miny;
        if i == nn
            n1 = kk-1
        else
            n1 = 5-1
        end
      for k = 1:n1
         
          if yr1(j+k) < miny
              miny = yr1(j+k);
              tr2(i) = tr1(j+k);
              yr2(i) = miny;
          end
      end
  end
  
  
  %ii = 0;
  %for jj = 1:255
  %    if ha1g1s1(jj) >= 1
  %        ii = ii+1;
  %        t(ii) = jj;
  %        y(ii) = ha1g1s1(jj);
  %    end
  %end
  
  %ysize = size(y)
  
   
 % for k = 1:17
 %     kk = k-1;
 %     sum = 0;
 %     k1 = 5*kk;
 %     sum = sum+y(k1+1)+y(k1+2)+y(k1+3)+y(k1+4)+y(k1+5);
 %     yave = sum/5;
 %     y(k1+1) = yave;
 %     y(k1+2) = yave;
 %     y(k1+3) = yave;
 %     y(k1+4) = yave;
 %     y(k1+5) = yave;
 % end
      
  
  figure(41)
  plot(tr1,yr1,'r.')
  title('Data points')
  hold on
  plot(tr2,yr2,'bo')
  %xdata = t;
  
  F = @(x,xdata)x(1)*exp(-x(2)*(xdata).^x(3));
  x0 = [1 1 0.25];
  [x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,tr1,yr1)
  
  F9 = @(x9,xdata)x9(1)*exp(-x9(2)*(xdata).^x9(3));
  x90 = [1 1 0.25];
  [x9,resnorm,~,exitflag,output] = lsqcurvefit(F,x90,tr2,yr2)
  
  yp = F(x,tr1(end));
  
  z(1) = log(1.0/abs(yp-yr1min))/(tr1(end)^x(3));
  z(2) = x(3);
  F1 = @(z,xdata)exp(-z(1)*(xdata).^z(2));
  
  G = @(x1,xdata)x1(1)+x1(2)*(1+(x1(3)*xdata).^x1(4)).^(-1);
  x10 = [1 1 1 1];
  [x1,resnorm,~,exitflag,output] = lsqcurvefit(G,x10,tr1,yr1)
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,tr1,yr1)
  
  yp1 = H(x2,tr1(end));
  
  %z1(1) = x2(1);
  %z1(2) = log(abs((ymin-yp1)/x2(1)))/log(t(end));
  z1(1) = abs(2*yr1min-yp1)/(tr1(end)^x2(2));
  z1(2) = x2(2);
  
  H1 = @(z1,xdata)z1(1)*(xdata).^z1(2);
  
  H3 = @(x3,xdata)x3(1)*(xdata).^x3(2);
  x30 = [1 0.5];
  [x3,resnorm,~,exitflag,output] = lsqcurvefit(H3,x30,tr2,yr2)
  
  p = polyfit(tr1,yr1,2);
  y1 = polyval(p,tr1);
  
  %tol = (.05)^2*(t(end)-t(1));
  %randomStream = RandStream.create( 'mcg16807', 'Seed', 23 );
  %tol = sum((.3*(rand(randomStream, size(t))-.5)).^2);
  %[sp,ys,rho] = spaps(t,y,tol,ones(size(t)));
  
  epsilon = ((tr1(end)-tr1(1))/(numel(tr1)-1))^3/16;
  p = 1/(1+epsilon*10^(1-3));
  
  p1 = 0.001;
  
  yy = csaps(tr1,yr1,p,t);
  
  yy1 = csaps(tr1,yr1,p1,t);
  
  hold on
  %plot(tr1,F(x,tr1),'r+')
  %plot(tr1,F9(x9,tr1),'ro')
  %plot(t,G(x1,t),'g*')
  %plot(tr1,H(x2,tr1)-H1(z1,tr1),'b*')
  plot(tr1,H(x2,tr1),'b*')
  plot(tr1,H3(x3,tr1),'b>')
  %plot(tr1,y1,'g-')
  %fnplt(sp)
  %plot(t,ys,'b-')
  %plot(tr1,yy1,'k-')
  hold off
 

%---------------------------

  ii = 0;
  for jj = 1:255
      if rea7g1(jj) <= 99.9999999999999999
          ii = ii+1;
          t(ii) = jj;
          y(ii) = rea7g1(jj);
      end
  end
  
   ymin = min(y);
   
  %ysize = size(y)
  
   
 % for k = 1:17
 %     kk = k-1;
 %     sum = 0;
 %     k1 = 5*kk;
 %     sum = sum+y(k1+1)+y(k1+2)+y(k1+3)+y(k1+4)+y(k1+5);
 %     yave = sum/5;
 %     y(k1+1) = yave;
 %     y(k1+2) = yave;
 %     y(k1+3) = yave;
 %     y(k1+4) = yave;
 %     y(k1+5) = yave;
 % end
      
  
  figure(42)
  plot(t,y,'r.')
  title('Data points')
  
  %xdata = t;
  
  F = @(x,xdata)x(1)*exp(-x(2)*(xdata).^x(3));
  x0 = [1 1 0.25];
  [x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,t,y)
  
  yp = F(x,t(end));
  
  z(1) = x(1);
  z(2) = log(abs(ymin-yp)/x(1))/(t(end)^x(3));
  z(3) = x(3);
  F1 = @(z,xdata)z(1)*exp(-z(2)*(xdata).^z(3));
  
  G = @(x1,xdata)x1(1)+x1(2)*(1+(x1(3)*xdata).^x1(4)).^(-1);
  x10 = [1 1 1 1];
  [x1,resnorm,~,exitflag,output] = lsqcurvefit(G,x10,t,y)
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,t,y)
  
  yp1 = H(x2,t(end));
  
  z1(1) = abs(ymin-yp1)/(t(end)^x2(2));
  z1(2) = x2(2);
  
  H1 = @(z1,xdata)z1(1)*(xdata).^z1(2);
  
  p = polyfit(t,y,2);
  y1 = polyval(p,t);
  
  %tol = (.05)^2*(t(end)-t(1));
  %randomStream = RandStream.create( 'mcg16807', 'Seed', 23 );
  %tol = sum((.3*(rand(randomStream, size(t))-.5)).^2);
  %[sp,ys,rho] = spaps(t,y,tol,ones(size(t)));
  
  epsilon = ((t(end)-t(1))/(numel(t)-1))^3/16;
  p = 1/(1+epsilon*10^(1-3));
  
  p1 = 0.001;
  
  yy = csaps(t,y,p,t);
  
  yy1 = csaps(t,y,p1,t);
  
  hold on
  plot(t,F(x,t)-F1(z,t),'r*')
  plot(t,F(x,t),'r+')
  %plot(t,G(x1,t),'g*')
  plot(t,H(x2,t)-H1(z1,t),'b*')
  plot(t,H(x2,t),'b+')
  plot(t,y1,'g-')
  %fnplt(sp)
  %plot(t,ys,'b-')
  plot(t,yy1,'k-')
  hold off
  
%--------------------------
%---------------------------
 %pd1 = psymp(8)
 %mm2 = size(pd1);
 % mm = mm2(2)
 
 m1 = 255
  
  re22 = max(rpa2g1)
  
      ii = 0;
  for jj = 1:m1
      if rpa2g1(jj) >= 1
          ii = ii+1;
          tp1(ii) = jj;
      yp1(ii) = rpa2g1(jj);
      end
  end
  
  yp1min = min(yp1)
  
  mm2 = size(yp1)
  mm = mm2(2)
  
  ndiv = 15;
  
  nn = round(mm/ndiv)
  kk = mod(mm,ndiv)
  
  
  for i = 1:nn
       j = ndiv*(i-1)+1;
      maxy = yp1(j);
      tp2(i) = tp1(j);
      yp2(i) = maxy;
        if (i == nn)&&(kk > 1)
            n1 = kk-1
        else
            n1 = ndiv-1
        end
      for k = 1:n1
         
          if yp1(j+k) > maxy
              maxy = yp1(j+k);
              tp2(i) = tp1(j+k);
              yp2(i) = maxy;
          end
      end
  end
  
  
  %ii = 0;
  %for jj = 1:255
  %    if ha1g1s1(jj) >= 1
  %        ii = ii+1;
  %        t(ii) = jj;
  %        y(ii) = ha1g1s1(jj);
  %    end
  %end
  
  %ysize = size(y)
  
   
 % for k = 1:17
 %     kk = k-1;
 %     sum = 0;
 %     k1 = 5*kk;
 %     sum = sum+y(k1+1)+y(k1+2)+y(k1+3)+y(k1+4)+y(k1+5);
 %     yave = sum/5;
 %     y(k1+1) = yave;
 %     y(k1+2) = yave;
 %     y(k1+3) = yave;
 %     y(k1+4) = yave;
 %     y(k1+5) = yave;
 % end
      
  
  figure(51)
  plot(tp1,yp1,'r.')
  title('Data points')
  hold on
  plot(tp2,yp2,'bo')
  %xdata = t;
  
  F = @(x,xdata)x(1)*exp(-x(2)*(xdata).^x(3));
  x0 = [1 1 0.25];
  [x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,tp1,yp1)
  
  F9 = @(x9,xdata)x9(1)*exp(-x9(2)*(xdata).^x9(3));
  x90 = [1 1 0.25];
  [x9,resnorm,~,exitflag,output] = lsqcurvefit(F,x90,tp2,yp2)
  
  yp = F(x,tp1(end));
  
  z(1) = log(1.0/abs(yp-yp1min))/(tp1(end)^x(3));
  z(2) = x(3);
  F1 = @(z,xdata)exp(-z(1)*(xdata).^z(2));
  
  G = @(x1,xdata)x1(1)+x1(2)*(1+(x1(3)*xdata).^x1(4)).^(-1);
  x10 = [1 1 1 1];
  [x1,resnorm,~,exitflag,output] = lsqcurvefit(G,x10,tp1,yp1)
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,tp1,yp1)
  
  yp9 = H(x2,tp1(end));
  
  %z1(1) = x2(1);
  %z1(2) = log(abs((ymin-yp1)/x2(1)))/log(t(end));
  z1(1) = abs(2*yp1min-yp9)/(tp1(end)^x2(2));
  z1(2) = x2(2);
  
  H1 = @(z1,xdata)z1(1)*(xdata).^z1(2);
  
  H3 = @(x3,xdata)x3(1)*(xdata).^x3(2);
  x30 = [1 0.5];
  [x3,resnorm,~,exitflag,output] = lsqcurvefit(H3,x30,tp2,yp2)
  
  p = polyfit(tp1,yp1,2);
  y1 = polyval(p,tp1);
  
  %tol = (.05)^2*(t(end)-t(1));
  %randomStream = RandStream.create( 'mcg16807', 'Seed', 23 );
  %tol = sum((.3*(rand(randomStream, size(t))-.5)).^2);
  %[sp,ys,rho] = spaps(t,y,tol,ones(size(t)));
  
  epsilon = ((tp1(end)-tp1(1))/(numel(tp1)-1))^3/16;
  p = 1/(1+epsilon*10^(1-3));
  
  p1 = 0.001;
  
  yy = csaps(tp1,yp1,p,t);
  
  yy1 = csaps(tp1,yp1,p1,t);
  
  hold on
  %plot(tr1,F(x,tr1),'r+')
  %plot(tr1,F9(x9,tr1),'ro')
  %plot(t,G(x1,t),'g*')
  %plot(tr1,H(x2,tr1)-H1(z1,tr1),'b*')
  plot(tp1,H(x2,tp1),'b*')
  plot(tp1,H3(x3,tp1),'b>')
  %plot(tr1,y1,'g-')
  %fnplt(sp)
  %plot(t,ys,'b-')
  %plot(tr1,yy1,'k-')
  hold off
 

%---------------------------
%---------------------------


function [np] = patients(nage)

global n
global symp 
global age
global gen

np = zeros(255,1);

for j = 1:255
    
    snp = 0;
    
    for i = 1:n
        if (symp(i) == j)&&(age(i) == nage)     
            snp = snp+1;
        end
    end
 
    np(j) = snp;
    
end
 
      sum = 0;
  for j = 1:255
      sum = sum + np(j);
  end
  
        
end



function [hs1,hs2,hs3] = hosp(nage)

global n
global symp 
global hs
global age
global gen

global picu
global phosp


hs1 = zeros(255,1);
hs2 = zeros(255,1);
hs3 = zeros(255,1);

for j = 1:255
    
    shs1 = 0;
    shs2 = 0;
    shs3 = 0;
    shs = 0;
    
    for i = 1:n
        if (symp(i) == j)&&(hs(i) == 1)&&(age(i) == nage)     
            shs1 = shs1+1;
        end
        if (symp(i) == j)&&(hs(i) == 2)&&(age(i) == nage) 
            shs2 = shs2+1;
        end
        if (symp(i) == j)&&(hs(i) == 3)&&(age(i) == nage) 
            shs3 = shs3+1;
        end
    end
    
    shs = shs1+shs2+shs3+0.0000001;
    hs1(j) = (shs1/shs)*100;
    hs2(j) = (shs2/shs)*100;
    hs3(j) = (shs3/shs)*100;
end
  for j = 1:255
    if hs1(j) >= 95
        hs1(j) = 0.5*(hs1(j-1)+hs1(j+1));
    end
    ip = 255*(nage - 1) + j;
    picu(ip) = hs1(j);
  end
  
  for j = 1:255
    if hs2(j) >= 95
        hs2(j) = 0.5*(hs2(j-1)+hs2(j+1));
    end
    ip = 255*(nage - 1) + j;
    phosp(ip) = hs2(j);
  end  
        
end

function [re1,de1] = reco(nage)

global symp
global re
global age
global gen
global n

global preco


for j = 1:255    
    sre1 = 0;
    sde1 = 0;
    stot = 0;
    
    for i = 1:n
        if (symp(i) == j)&&(re(i) == 1)&&(age(i) == nage)   
            sre1 = sre1+1;
        end
        if (symp(i) == j)&&(re(i) == 2)&&(age(i) == nage) 
            sde1 = sde1+1;
        end
        
    end
    stot = sre1+sde1+0.0000001;
    re1(j) = (sre1/stot)*100;
    de1(j) = (sde1/stot)*100;
    tot(j) = stot;
end

     for j = 1:255
         if (re1(j) == 0)&&(tot(j) <= 10)
             re1(j) = re1(j-1);
         end
          ip = 255*(nage - 1) + j;
          preco(ip) = re1(j); 
     end    

end

function rp1 = repe(nage)

global symp
global rp
global age
global gen
global n

global parp

for j = 1:255
    
    srp1 = 0;
    stot = 0;
    
    for i = 1:n
        if (symp(i) == j)&&(rp(i) >= 1)&&(age(i) == nage)  
            
            srp1 = srp1+rp(i);

            stot = stot+1;
        end    
        
    end
    rp1(j) = (srp1/(stot+0.0000001));
    
    ip = 255*(nage - 1) + j;
    parp(ip) = rp1(j);
end

end
%-------------------------------------

function pd = psymp(nage)

global n
global symp
global age

for j = 1:255
    sum = 0;
    for i = 1:n
        if (symp(i) == j)&&(age(i) == nage)
            sum = sum + 1;
        end
    end        
    nsymp(j)= sum;
end

   sumnz = 0;
   sumtot = 0;
       ii = 0;
for j = 1:255
    if nsymp(j) >= 10
        sumnz = sumnz + 1;
        ii = ii+1;
        pd(ii) = j;
    end
    
    sumtot = sumtot + nsymp(j);
end

sumnz1 = sumnz;
sumtot1 = sumtot;

end
%---------------------------------------

function pd = psympre(nage)

global n
global symp
global age

for j = 1:255
    sum = 0;
    for i = 1:n
        if (symp(i) == j)&&(age(i) == nage)
            sum = sum + 1;
        end
    end        
    nsymp(j)= sum;
end

   sumnz = 0;
   sumtot = 0;
       ii = 0;
for j = 1:255
    if nsymp(j) >= 20
        sumnz = sumnz + 1;
        ii = ii+1;
        pd(ii) = j;
    end
    
    sumtot = sumtot + nsymp(j);
end

sumnz1 = sumnz;
sumtot1 = sumtot;

end
%---------------------------------------

function md = reg(data)

global b1
global b2
global b3
global b4
global b5
global b6
global b7
global b8

X = [b8,b7,b6,b5,b4,b3,b2,b1];

md = fitlm(X,data)

end

%----------------------------------------------

function [phav,phlw,phup] = pdicu(nage,tp,hags)

global pmaicu pmlicu pmuicu

 %pd1 = psymp(nage)
 %mm2 = size(pd1);
 % mm = mm2(2)
 
 mm = 255
  
 %       ii = 0;
 % for jj = 1:mm
 %     if hags(pd1(jj)) >= 1
 %         ii = ii+1;
 %         tp1(ii) = pd1(jj);
 %     yp1(ii) = hags(pd1(jj));
 %     end
 % end
  
          ii = 0;
  for jj = 1:mm
      if hags(jj) > 0
          ii = ii+1;
          tp1(ii) = jj;
      yp1(ii) = hags(jj);
      end
  end
  
  yp1min = min(yp1)
  
  n2 = size(yp1)
  n3 = n2(2)
  
  if (nage < 3)
      ndage = 4;
  elseif (nage > 2) && (nage < 5)
      ndage = 15;
  elseif (nage > 4) && (nage < 7)
      ndage = 20;
  elseif (nage > 6)
      ndage = 25;
  end
  
  ndiv = fix(n3/ndage)
  
  nn = round(n3/ndiv)
  kk = mod(n3,ndiv)
  
  
  for i = 1:nn
       j = ndiv*(i-1)+1;
      maxy = yp1(j);
      tp2(i) = tp1(j);
      yp2(i) = maxy;
        if (i == nn)&&(kk > 1)
            n1 = kk-1;
        else
            n1 = ndiv-1;
        end
      for k = 1:n1
         
          if yp1(j+k) > maxy
              maxy = yp1(j+k);
              tp2(i) = tp1(j+k);
              yp2(i) = maxy;
          end
      end
  end
  
    for i = 1:nn
       j = ndiv*(i-1)+1;
      miny = yp1(j);
      tp3(i) = tp1(j);
      yp3(i) = miny;
        if (i == nn)&&(kk > 1)
            n1 = kk-1
        else
            n1 = ndiv-1
        end
      for k = 1:n1
         
          if yp1(j+k) < miny
              miny = yp1(j+k);
              tp3(i) = tp1(j+k);
              yp3(i) = miny;
          end
      end
  end
  
  %ii = 0;
  %for jj = 1:255
  %    if ha1g1s1(jj) >= 1
  %        ii = ii+1;
  %        t(ii) = jj;
  %        y(ii) = ha1g1s1(jj);
  %    end
  %end
  
  %ysize = size(y)
  
   
 % for k = 1:17
 %     kk = k-1;
 %     sum = 0;
 %     k1 = 5*kk;
 %     sum = sum+y(k1+1)+y(k1+2)+y(k1+3)+y(k1+4)+y(k1+5);
 %     yave = sum/5;
 %     y(k1+1) = yave;
 %     y(k1+2) = yave;
 %     y(k1+3) = yave;
 %     y(k1+4) = yave;
 %     y(k1+5) = yave;
 % end
      
  
  
  F = @(x,xdata)x(1)*exp(-x(2)*(xdata).^x(3));
  x0 = [1 1 0.25];
  [x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,tp1,yp1)
  
  F9 = @(x9,xdata)x9(1)*exp(-x9(2)*(xdata).^x9(3));
  x90 = [1 1 0.25];
  [x9,resnorm,~,exitflag,output] = lsqcurvefit(F,x90,tp2,yp2)
  
  yp = F(x,tp1(end));
  
  z(1) = log(1.0/abs(yp-yp1min))/(tp1(end)^x(3));
  z(2) = x(3);
  F1 = @(z,xdata)exp(-z(1)*(xdata).^z(2));
  
  G = @(x1,xdata)x1(1)+x1(2)*(1+(x1(3)*xdata).^x1(4)).^(-1);
  x10 = [1 1 1 1];
  [x1,resnorm,~,exitflag,output] = lsqcurvefit(G,x10,tp1,yp1)
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,tp1,yp1)
  
  yp9 = H(x2,tp1(end));
  
  %z1(1) = x2(1);
  %z1(2) = log(abs((ymin-yp1)/x2(1)))/log(t(end));
  z1(1) = abs(2*yp1min-yp9)/(tp1(end)^x2(2));
  z1(2) = x2(2);
  
  H1 = @(z1,xdata)z1(1)*(xdata).^z1(2);
  
  H3 = @(x3,xdata)x3(1)*(xdata).^x3(2);
  x30 = [1 0.5];
  [x3,resnorm,~,exitflag,output] = lsqcurvefit(H3,x30,tp2,yp2)
  
    H5 = @(x5,xdata)x5(1)*(xdata).^x5(2);
  x50 = [1 0.5];
  [x5,resnorm,~,exitflag,output] = lsqcurvefit(H5,x50,tp3,yp3)
  
  p = polyfit(tp1,yp1,2);
  y1 = polyval(p,tp1);
  
  %tol = (.05)^2*(t(end)-t(1));
  %randomStream = RandStream.create( 'mcg16807', 'Seed', 23 );
  %tol = sum((.3*(rand(randomStream, size(t))-.5)).^2);
  %[sp,ys,rho] = spaps(t,y,tol,ones(size(t)));
  

  phav = H(x2,tp);
  phup = H3(x3,tp);
  phlw = H5(x5,tp);
  
  for j = 1:255
      ip = 255*(nage - 1) + j;
      pmaicu(ip) = phav(j);
      pmlicu(ip) = phlw(j);
      pmuicu(ip) = phup(j);
  end

  
end

%----------------------------------------------

function [phav,phlw,phup] = pdhosp(nage,tp,hags)

global pmahosp pmlhosp pmuhosp


 %pd1 = psymp(nage)
 %mm2 = size(pd1);
 % mm = mm2(2)
 
 mm = 255
  
 %       ii = 0;
 % for jj = 1:mm
 %     if hags(pd1(jj)) >= 1
 %         ii = ii+1;
 %         tp1(ii) = pd1(jj);
 %     yp1(ii) = hags(pd1(jj));
 %     end
 % end
  
          ii = 0;
  for jj = 1:mm
      if hags(jj) > 0
          ii = ii+1;
          tp1(ii) = jj;
      yp1(ii) = hags(jj);
      end
  end
  
  yp1min = min(yp1)
  
  n2 = size(yp1)
  n3 = n2(2)
  
  if (nage < 3)
      ndage = 4;
  elseif (nage > 2) && (nage < 5)
      ndage = 15;
  elseif (nage > 4) && (nage < 7)
      ndage = 20;
  elseif (nage > 6)
      ndage = 25;
  end
  
  ndiv = fix(n3/ndage)
  
  nn = round(n3/ndiv)
  kk = mod(n3,ndiv)
  
  
  for i = 1:nn
       j = ndiv*(i-1)+1;
      maxy = yp1(j);
      tp2(i) = tp1(j);
      yp2(i) = maxy;
        if (i == nn)&&(kk > 1)
            n1 = kk-1;
        else
            n1 = ndiv-1;
        end
      for k = 1:n1
         
          if yp1(j+k) > maxy
              maxy = yp1(j+k);
              tp2(i) = tp1(j+k);
              yp2(i) = maxy;
          end
      end
  end
  
    for i = 1:nn
       j = ndiv*(i-1)+1;
      miny = yp1(j);
      tp3(i) = tp1(j);
      yp3(i) = miny;
        if (i == nn)&&(kk > 1)
            n1 = kk-1
        else
            n1 = ndiv-1
        end
      for k = 1:n1
         
          if yp1(j+k) < miny
              miny = yp1(j+k);
              tp3(i) = tp1(j+k);
              yp3(i) = miny;
          end
      end
  end
  
  %ii = 0;
  %for jj = 1:255
  %    if ha1g1s1(jj) >= 1
  %        ii = ii+1;
  %        t(ii) = jj;
  %        y(ii) = ha1g1s1(jj);
  %    end
  %end
  
  %ysize = size(y)
  
   
 % for k = 1:17
 %     kk = k-1;
 %     sum = 0;
 %     k1 = 5*kk;
 %     sum = sum+y(k1+1)+y(k1+2)+y(k1+3)+y(k1+4)+y(k1+5);
 %     yave = sum/5;
 %     y(k1+1) = yave;
 %     y(k1+2) = yave;
 %     y(k1+3) = yave;
 %     y(k1+4) = yave;
 %     y(k1+5) = yave;
 % end
      
  
  
  F = @(x,xdata)x(1)*exp(-x(2)*(xdata).^x(3));
  x0 = [1 1 0.25];
  [x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,tp1,yp1)
  
  F9 = @(x9,xdata)x9(1)*exp(-x9(2)*(xdata).^x9(3));
  x90 = [1 1 0.25];
  [x9,resnorm,~,exitflag,output] = lsqcurvefit(F,x90,tp2,yp2)
  
  yp = F(x,tp1(end));
  
  z(1) = log(1.0/abs(yp-yp1min))/(tp1(end)^x(3));
  z(2) = x(3);
  F1 = @(z,xdata)exp(-z(1)*(xdata).^z(2));
  
  G = @(x1,xdata)x1(1)+x1(2)*(1+(x1(3)*xdata).^x1(4)).^(-1);
  x10 = [1 1 1 1];
  [x1,resnorm,~,exitflag,output] = lsqcurvefit(G,x10,tp1,yp1)
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,tp1,yp1)
  
  yp9 = H(x2,tp1(end));
  
  %z1(1) = x2(1);
  %z1(2) = log(abs((ymin-yp1)/x2(1)))/log(t(end));
  z1(1) = abs(2*yp1min-yp9)/(tp1(end)^x2(2));
  z1(2) = x2(2);
  
  H1 = @(z1,xdata)z1(1)*(xdata).^z1(2);
  
  H3 = @(x3,xdata)x3(1)*(xdata).^x3(2);
  x30 = [1 0.5];
  [x3,resnorm,~,exitflag,output] = lsqcurvefit(H3,x30,tp2,yp2)
  
    H5 = @(x5,xdata)x5(1)*(xdata).^x5(2);
  x50 = [1 0.5];
  [x5,resnorm,~,exitflag,output] = lsqcurvefit(H5,x50,tp3,yp3)
  
  p = polyfit(tp1,yp1,2);
  y1 = polyval(p,tp1);
  
  %tol = (.05)^2*(t(end)-t(1));
  %randomStream = RandStream.create( 'mcg16807', 'Seed', 23 );
  %tol = sum((.3*(rand(randomStream, size(t))-.5)).^2);
  %[sp,ys,rho] = spaps(t,y,tol,ones(size(t)));
  

  phav = H(x2,tp);
  phup = H3(x3,tp);
  phlw = H5(x5,tp);
  
  for j = 1:255
      ip = 255*(nage - 1) + j;
      pmahosp(ip) = phav(j);
      pmlhosp(ip) = phlw(j);
      pmuhosp(ip) = phup(j);
  end

  
end
 
%---------------------------

function [prav,prlw] = pdicrec(nage,tp,rea)

global pmareco pmlreco pmureco

% pd1 = psympre(nage)
% mm2 = size(pd1);
%  mm = mm2(2)
   mm = 255  

  xre22 = min(rea)
  
      ii = 0;
  for jj = 1:mm
      if rea(jj) <= 99.999999999999
          ii = ii+1;
          tr1(ii) = jj;
      yr1(ii) = rea(jj);
      end
  end
  
  xyr1min = min(yr1)
  
  ndiv = 12
  
  nn = round(mm/ndiv)
  kk = mod(mm,ndiv)
  
  
  for i = 1:nn
       j = ndiv*(i-1)+1;
      miny = yr1(j);
      tr2(i) = tr1(j);
      yr2(i) = miny;
        if (i == nn)&&(kk > 1)
            n1 = kk-1;
        else
            n1 = ndiv-1;
        end
      for k = 1:n1
         
          if yr1(j+k) < miny
              miny = yr1(j+k);
              tr2(i) = tr1(j+k);
              yr2(i) = miny;
          end
      end
  end
  
  
  %ii = 0;
  %for jj = 1:255
  %    if ha1g1s1(jj) >= 1
  %        ii = ii+1;
  %        t(ii) = jj;
  %        y(ii) = ha1g1s1(jj);
  %    end
  %end
  
  %ysize = size(y)
  
   
 % for k = 1:17
 %     kk = k-1;
 %     sum = 0;
 %     k1 = 5*kk;
 %     sum = sum+y(k1+1)+y(k1+2)+y(k1+3)+y(k1+4)+y(k1+5);
 %     yave = sum/5;
 %     y(k1+1) = yave;
 %     y(k1+2) = yave;
 %     y(k1+3) = yave;
 %     y(k1+4) = yave;
 %     y(k1+5) = yave;
 % end
      
 
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,tr1,yr1)
  
  
  H3 = @(x3,xdata)x3(1)*(xdata).^x3(2);
  x30 = [1 0.5];
  [x3,resnorm,~,exitflag,output] = lsqcurvefit(H3,x30,tr2,yr2)
  
  
  prav = H(x2,tp);
 % phup = H3(x3,tp);
  prlw = H3(x3,tp);
  
  for j = 1:255
      if prav(j) > 100
          prav(j) = 100;
      end
      if prlw(j) > 100
          prlw(j) = 100;
      end
  end
  
  for k = 1:4
    for j = 1:255
      ip = 255*(k - 1) + j;
      pmareco(ip) = 100;
      pmlreco(ip) = 100;
      pmureco(ip) = 100;
    end
  end
  
  for j = 1:255
      ip = 255*(nage - 1) + j;
      pmareco(ip) = prav(j);
      pmlreco(ip) = prlw(j);
      pmureco(ip) = 100;
  end


end


%---------------------------

function [prpav,prplw,prpup] = pdicrep(nage,tp,rp)

global pmarp pmlrp pmurp

 %pd1 = psymp(8)
 %mm2 = size(pd1);
 % mm = mm2(2)
 
 m1 = 255
  
  re22 = max(rp)
  
      ii = 0;
  for jj = 1:m1
      if rp(jj) >= 1
          ii = ii+1;
          tp1(ii) = jj;
      yp1(ii) = rp(jj);
      end
  end
  
  yp1min = min(yp1)
  
  mm2 = size(yp1)
  mm = mm2(2)
  
  ndiv = 15;
  
  nn = round(mm/ndiv)
  kk = mod(mm,ndiv)
  
  
  for i = 1:nn
       j = ndiv*(i-1)+1;
      maxy = yp1(j);
      tp2(i) = tp1(j);
      yp2(i) = maxy;
        if (i == nn)&&(kk > 1)
            n1 = kk-1
        else
            n1 = ndiv-1
        end
      for k = 1:n1
         
          if yp1(j+k) > maxy
              maxy = yp1(j+k);
              tp2(i) = tp1(j+k);
              yp2(i) = maxy;
          end
      end
  end
  
    for i = 1:nn
       j = ndiv*(i-1)+1;
      miny = yp1(j);
      tp3(i) = tp1(j);
      yp3(i) = miny;
        if (i == nn)&&(kk > 1)
            n1 = kk-1
        else
            n1 = ndiv-1
        end
      for k = 1:n1
         
          if yp1(j+k) < miny
              miny = yp1(j+k);
              tp3(i) = tp1(j+k);
              yp3(i) = miny;
          end
      end
  end
  
      
  
  
  H = @(x2,xdata)x2(1)*(xdata).^x2(2);
  x20 = [1 0.5];
  [x2,resnorm,~,exitflag,output] = lsqcurvefit(H,x20,tp1,yp1)
  
  
  H3 = @(x3,xdata)x3(1)*(xdata).^x3(2);
  x30 = [1 0.5];
  [x3,resnorm,~,exitflag,output] = lsqcurvefit(H3,x30,tp2,yp2)
  
   H5 = @(x5,xdata)x5(1)*(xdata).^x5(2);
  x50 = [1 0.5];
  [x5,resnorm,~,exitflag,output] = lsqcurvefit(H5,x50,tp3,yp3)
  
   prpav = H(x2,tp);

   prpup = H3(x3,tp);
  
  prplw = H5(x5,tp);
  
 for j = 1:255
      ip = 255*(nage - 1) + j;
      pmarp(ip) = prpav(j);
      pmlrp(ip) = prplw(j);
      pmurp(ip) = prpup(j);
  end
 
end
%---------------------------