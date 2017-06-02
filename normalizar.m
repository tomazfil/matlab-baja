close all, clear all, clc, format compact
load('BA Pista 2.mat')

long1 = L006_GPS_LonAcc;
long2 = R02L003_GPS_LonAcc;
lat1 = L006_GPS_LatAcc;
lat2 = R02L003_GPS_LatAcc;
format long
[m n1] = size(lat1);
for i=1:n1;
    long1(i) = (long1(i)-min(long1))/( max(long1) - min(long1));
    
    long2(i) = (long2(i)-min(long2))/( max(long2) - min(long2));
end
[m n2] = size(lat2);
for i=1:n2;
    lat1(i) = (lat1(i)-min(lat1))/( max(lat1) - min(lat1));
    
    lat2(i) = (lat2(i)-min(lat2))/( max(lat2) - min(lat2));
end

% X_lat_lap1 = zeros(length(lat1),2);
% X_long_lap1 = zeros(length(long1),2);
% 
% X_lat_lap2 = zeros(length(lat2),2);
% X_long_lap2 = zeros(length(long2),2);
%Condi��es Iniciais: Acelera��o longitudinal e lateral. Volta 1 e 2.

% X_lat_lap1(1,1) = lat1(2);
% X_lat_lap1(1,2) = lat1(1);
% 
% X_lat_lap2(1,1) = lat2(2);
% X_lat_lap2(1,2) = lat2(1);
% 
% X_long_lap1(1,1) = long1(2);
% X_long_lap1(1,2) = long1(1);
% 
% X_long_lap2(1,1) = long2(2);
% X_long_lap2(1,2) = long2(1);

%Primeiros 500
% for i=3:length(lat1)+1;
%    
%     %Reduzo a(3) em uma posi��o ->a(2), depois em outra posi��o a(1)
%     X_lat_lap1 = [X_lat_lap1; [lat1(i-1) lat1(i-2)] ];
%     X_long_lap1= [X_long_lap1; [long1(i-1) long1(i-2)] ];
%     
% end
% 
% for i=3:length(lat2)+1;
%    
%     %Reduzo a(3) em uma posi��o ->a(2), depois em outra posi��o a(1)
%     X_lat_lap2 = [ X_lat_lap2; [lat2(i-1) lat2(i-2)] ];
%     X_long_lap2 = [X_long_lap2; [long2(i-1) long2(i-2)] ];
% end

%calcular PINV para cada vari�vel
 

%Multiplicar theta_estimado = PINV*Acc[k]
% theta_lat_lap1 = pinv(X_lat_lap1)*lat1
% theta_lat_lap2 = pinv(X_lat_lap2)*lat2
% 
% theta_long_lap1 = pinv(X_long_lap1)*long1
% theta_long_lap2 = pinv(X_long_lap2)*long2

%primeira janela de tempo
theta_lat_lap1 = calcular_theta(lat1(1:500));
theta_lat_lap2 = calcular_theta(lat2(1:500));
theta_long_lap1 = calcular_theta(long1(1:500));
theta_long_lap2 = calcular_theta(long2(1:500));

figure(1)

plot(theta_lat_lap1(1),theta_lat_lap1(2),'*');
hold on
plot(theta_lat_lap2(1),theta_lat_lap2(2),'*');

figure(2)

plot(theta_long_lap1(1),theta_long_lap1(2),'*');
hold on
plot(theta_long_lap2(1),theta_long_lap2(2),'*');

%segunda janela de tempo
theta_lat_lap1 = calcular_theta(lat1(501:1000));
theta_lat_lap2 = calcular_theta(lat2(501:1000));
theta_long_lap1 = calcular_theta(long1(501:1000));
theta_long_lap2 = calcular_theta(long2(501:1000));

figure(1)
plot(theta_lat_lap1(1),theta_lat_lap1(2),'*');
hold on
plot(theta_lat_lap2(1),theta_lat_lap2(2),'*');

figure(2)
plot(theta_long_lap1(1),theta_long_lap1(2),'*');
hold on
plot(theta_long_lap2(1),theta_long_lap2(2),'*');

%terceira janela de tempo
theta_lat_lap1 = calcular_theta(lat1(1001:1500));
theta_lat_lap2 = calcular_theta(lat2(1001:1500));
theta_long_lap1 = calcular_theta(long1(1001:1500));
theta_long_lap2 = calcular_theta(long2(1001:1500));

figure(1)
plot(theta_lat_lap1(1),theta_lat_lap1(2),'*');
hold on
plot(theta_lat_lap2(1),theta_lat_lap2(2),'*');

figure(2)
plot(theta_long_lap1(1),theta_long_lap1(2),'*');
hold on
plot(theta_long_lap2(1),theta_long_lap2(2),'*');

%quarta janela de tempo
theta_lat_lap1 = calcular_theta(lat1(1501:2000));
theta_lat_lap2 = calcular_theta(lat2(1501:2000));
theta_long_lap1 = calcular_theta(long1(1501:2000));
theta_long_lap2 = calcular_theta(long2(1501:2000));

figure(1)
plot(theta_lat_lap1(1),theta_lat_lap1(2),'*');
hold on
plot(theta_lat_lap2(1),theta_lat_lap2(2),'*');

figure(2)
plot(theta_long_lap1(1),theta_long_lap1(2),'*');
hold on
plot(theta_long_lap2(1),theta_long_lap2(2),'*');

%quinta janela de tempo
theta_lat_lap1 = calcular_theta(lat1(2001:2500));
theta_lat_lap2 = calcular_theta(lat2(2001:2500));
theta_long_lap1 = calcular_theta(long1(2001:2500));
theta_long_lap2 = calcular_theta(long2(2001:2500));

figure(1)
plot(theta_lat_lap1(1),theta_lat_lap1(2),'*');
hold on
plot(theta_lat_lap2(1),theta_lat_lap2(2),'*');

figure(2)
plot(theta_long_lap1(1),theta_long_lap1(2),'*');
hold on
plot(theta_long_lap2(1),theta_long_lap2(2),'*');

%sexta janela de tempo
theta_lat_lap1 = calcular_theta(lat1(2501:3000));
theta_lat_lap2 = calcular_theta(lat2(2501:3000));
theta_long_lap1 = calcular_theta(long1(2501:3000));
theta_long_lap2 = calcular_theta(long2(2501:3000));

figure(1)
grid on
plot(theta_lat_lap1(1),theta_lat_lap1(2),'*');
hold on
plot(theta_lat_lap2(1),theta_lat_lap2(2),'*');

figure(2)
grid on
plot(theta_long_lap1(1),theta_long_lap1(2),'*');
hold on
plot(theta_long_lap2(1),theta_long_lap2(2),'*');
