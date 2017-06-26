clc
clear
r1 = [randn(5000,1) randn(5000,1) randn(5000,1)];
r2 = [rand(5000,1)+50 randn(5000,1) randn(5000,1)];
r3 = [rand(5000,1)+100 randn(5000,1) randn(5000,1)];

ar1 = [calcular_theta(r1(:,1),20,50)...
      calcular_theta(r1(:,2),20,50)...
      calcular_theta(r1(:,3),20,50)];

ar2 = [calcular_theta(r2(:,1),20,50)...
      calcular_theta(r2(:,2),20,50)...
      calcular_theta(r2(:,3),20,50)];
  
ar3 = [calcular_theta(r3(:,1),20,50)...
       calcular_theta(r3(:,2),20,50)...
       calcular_theta(r3(:,3),20,50)];

%Para fazer a covariância a matriz de regressores tem que estar transposta   
cov_ar1 = cov(ar1');
cov_ar2 = cov(ar2');
cov_ar3 = cov(ar3');

[V_ar1,D_ar1] = eig(cov_ar1);
[V_ar2,D_ar2] = eig(cov_ar2);
[V_ar3,D_ar3] = eig(cov_ar3);

D_ar1 = diag(D_ar1);
D_ar2 = diag(D_ar2);
D_ar3 = diag(D_ar3);

A1 = (ar1'*V_ar1);
A2 = (ar2'*V_ar2);
A3 = (ar3'*V_ar3);

figure(1)
plot3(r1(:,1),r1(:,2),r1(:,3),'*')
hold on
plot3(r2(:,1),r2(:,2),r2(:,3),'ro')
plot3(r3(:,1),r3(:,2),r3(:,3),'y-')

% figure(2)
% plot3(ar1(2:length(ar1),1),ar1(2:length(ar1),2),ar1(2:length(ar1),3),'*')
% hold on
% plot3(ar2(2:length(ar2),1),ar2(2:length(ar2),2),ar2(2:length(ar2),3),'ro')
% plot3(ar3(2:length(ar3),1),ar3(2:length(ar3),2),ar3(2:length(ar3),3),'go')

figure(3)
plot(A1(19,:),A1(20,:),'*')
hold on
plot(A2(19,:),A2(20,:),'ro')
plot(A3(19,:),A3(20,:),'go')