close all, clear all, clc, format compact
load('BA Pista 2.mat')

%ba
long1 = L006_GPS_LonAcc;
long2 = R02L003_GPS_LonAcc;
lat1 = L006_GPS_LatAcc;
lat2 = R02L003_GPS_LatAcc;

%vaneli
% long1 = L002_GPS_LonAcc;
% long2 = L005_GPS_LonAcc;
% lat1 = L002_GPS_LatAcc;
% lat2 = L005_GPS_LatAcc;
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
%Condições Iniciais: Aceleração longitudinal e lateral. Volta 1 e 2.

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
%     %Reduzo a(3) em uma posição ->a(2), depois em outra posição a(1)
%     X_lat_lap1 = [X_lat_lap1; [lat1(i-1) lat1(i-2)] ];
%     X_long_lap1= [X_long_lap1; [long1(i-1) long1(i-2)] ];
%
% end
%
% for i=3:length(lat2)+1;
%
%     %Reduzo a(3) em uma posição ->a(2), depois em outra posição a(1)
%     X_lat_lap2 = [ X_lat_lap2; [lat2(i-1) lat2(i-2)] ];
%     X_long_lap2 = [X_long_lap2; [long2(i-1) long2(i-2)] ];
% end

%calcular PINV para cada variável


%Multiplicar theta_estimado = PINV*Acc[k]
% theta_lat_lap1 = pinv(X_lat_lap1)*lat1
% theta_lat_lap2 = pinv(X_lat_lap2)*lat2
%
% theta_long_lap1 = pinv(X_long_lap1)*long1
% theta_long_lap2 = pinv(X_long_lap2)*long2

%primeira janela de tempo
j=1;
for i=500:500:length(lat1)
    
    theta_lat(j,:) = calcular_theta(lat1(i-499:i));
    theta_long(j,:) = calcular_theta(long1(i-499:i));
    
    
    j = j+1;
end

for i=500:500:length(lat2)
    
    theta_lat(j,:) = calcular_theta(lat2(i-499:i));
    theta_long(j,:) = calcular_theta(long2(i-499:i));
    
    figure(2)
    plot(theta_long(1),theta_long(2),'*');
    hold on
    grid on
    j = j+1;
end

    figure(1)
    plot(theta_lat(1),theta_lat(2),'*');
    hold on
    grid on
