close all, clear all, clc, format compact

%ba
load('BA Pista 2.mat')
%vaneli
load('Vaneli Pista 2.mat')
% format long

lap_p1 = 'L002_';
lap_p2 = 'L006_';

passo = 50;
k = 20;
%NORMALIZAÇÃO #################################3
lat_p1 = normalizar( eval([lap_p1 'GPS_LatAcc']) );
lat_p2 = normalizar( eval([lap_p2 'GPS_LatAcc']) );

long_p1 = normalizar( eval([lap_p1 'GPS_LonAcc']) );
long_p2 = normalizar( eval([lap_p2 'GPS_LonAcc']) );

GSUM_p1 = sqrt(long_p1.^2 + lat_p1.^2);
GSUM_p2 = sqrt(long_p2.^2 + lat_p2.^2);

velo_p1 = normalizar( eval([lap_p1 'GPS_Speed']) );
velo_p2 = normalizar( eval([lap_p2 'GPS_Speed']) );

rpm_p1 = normalizar( eval([lap_p1 'Engine']) );
rpm_p2 = normalizar( eval([lap_p2 'Engine']) );

%CALCULO DE THETA ###############################
theta_lat_p1 = calcular_theta(lat_p1,k,passo);
theta_long_p1 = calcular_theta(long_p1,k,passo);
theta_velo_p1 = calcular_theta(velo_p1,k,passo);
theta_rpm_p1 = calcular_theta(rpm_p1,k,passo);
theta_GSUM_p1 = calcular_theta(GSUM_p1,k,passo);

theta_lat_p2 = calcular_theta(lat_p2,k,passo);
theta_long_p2 = calcular_theta(long_p2,k,passo);
theta_velo_p2 = calcular_theta(velo_p2,k,passo);
theta_rpm_p2 = calcular_theta(rpm_p2,k,passo);
theta_GSUM_p2 = calcular_theta(GSUM_p2,k,passo);

%Matriz de Correlação ##########################
cov_rpm_p1 = cov(theta_rpm_p1');
cov_rpm_p2 = cov(theta_rpm_p2');
[V_rpm_p1,D_rpm_p1] = eig(cov_rpm_p1);
[V_rpm_p2,D_rpm_p2] = eig(cov_rpm_p2);
D_rpm_p1 = diag(D_rpm_p1);
D_rpm_p2 = diag(D_rpm_p2);

pca_rpm_p1 = theta_rpm_p1'*V_rpm_p1;
pca_rpm_p2 = theta_rpm_p2'*V_rpm_p2;
% proj1_rpm_p1 = sum(theta_rpm_p1(:,20).*V_rpm_p1(:,20))/...
%                 (norm(V_rpm_p1(:,20)))^2*V_rpm_p1(:,20)
% proj2_rpm_p1 = sum(theta_rpm_p1(:,19).*V_rpm_p1(:,19))/...
%                 (norm(V_rpm_p1(:,19))^2)*V_rpm_p1(:,19)
% 
% proj1_rpm_p2 = sum(theta_rpm_p2(:,19).*V_rpm_p2(:,19))/...
%                 (norm(V_rpm_p2(:,19))^2)*V_rpm_p2(:,19)
% proj2_rpm_p2 = sum(theta_rpm_p2(:,20).*V_rpm_p2(:,20))/...
%                 (norm(V_rpm_p2(:,20))^2)*V_rpm_p2(:,20)

cov_GSUM_p1 = cov(theta_GSUM_p1' );
cov_GSUM_p2 = cov(theta_GSUM_p2' );
[V_GSUM_p1,D_GSUM_p1] = eig(cov_GSUM_p1);
[V_GSUM_p2,D_GSUM_p2] = eig(cov_GSUM_p2);
D_GSUM_p1 = diag(D_GSUM_p1);
D_GSUM_p2 = diag(D_GSUM_p2);

% proj1_GSUM_p1 = sum(theta_GSUM_p1(:,20).*V_GSUM_p1(:,20))/...
%                 (norm(V_GSUM_p1(:,20)))^2*V_GSUM_p1(:,20)
% proj2_GSUM_p1 = sum(theta_GSUM_p1(:,19).*V_GSUM_p1(:,19))/...
%                 (norm(V_GSUM_p1(:,19))^2)*V_GSUM_p1(:,19)
% 
% proj1_GSUM_p2 = sum(theta_GSUM_p2(:,19).*V_GSUM_p2(:,19))/...
%                 (norm(V_GSUM_p2(:,19))^2)*V_GSUM_p2(:,19)
% proj2_GSUM_p2 = sum(theta_GSUM_p2(:,20).*V_GSUM_p2(:,20))/...
%                 (norm(V_GSUM_p2(:,20))^2)*V_GSUM_p2(:,20)

% figure(1)
% plot(proj1_GSUM_p1,proj2_GSUM_p1,'ro');
% hold on
% plot(proj1_GSUM_p2,proj2_GSUM_p2,'bo')

figure(2)
plot(pca_rpm_p1(:,19),pca_rpm_p1(:,20),'ro');
hold on
plot(pca_rpm_p2(:,19),pca_rpm_p2(:,20),'bo')

% %PLOTS ##########################################
% %Velocidades
% figure(1)
% plot(theta_velo_p2(1,:),theta_velo_p2(2,:),'b*')
% hold on
% plot(theta_velo_p1(1,:),theta_velo_p1(2,:),'r*')
% title('Coeficientes para Velocidade');
% 
% %Aceleração Lateral
% figure(2)
% plot(theta_lat_p2(1,:),theta_lat_p2(2,:),'b*')
% hold on
% plot(theta_lat_p1(1,:),theta_lat_p1(2,:),'r*')
% title('Coeficientes para Aceleração Lateral');
% 
% %Aceleração Longitudinal
% figure(3)
% plot(theta_long_p2(1,:),theta_long_p2(2,:),'b*')
% hold on
% plot(theta_long_p1(1,:),theta_long_p1(2,:),'r*')
% title('Coeficientes para Aceleração Longitudinal'); 
% 
% %Somatório Long + Lat
% figure(3)
% plot(theta_GSUM_p2(1,:),theta_GSUM_p2(2,:),'b*')
% hold on
% plot(theta_GSUM_p1(1,:),theta_GSUM_p1(2,:),'r*')
% title('Coeficientes para GSUM'); 
% 
% %RPM
% figure(5)
% plot(theta_rpm_p2(1,:),theta_rpm_p2(2,:),'b*')
% hold on
% plot(theta_rpm_p1(1,:),theta_rpm_p1(2,:),'r*')
% title('Coeficientes para RPM');       
