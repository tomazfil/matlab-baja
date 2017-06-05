close all, clear all, clc, format compact
load('Vaneli Pista 2.mat')

%ba
% long1 = L006_GPS_LonAcc;
% long2 = R02L003_GPS_LonAcc;
% lat1 = L006_GPS_LatAcc;
% lat2 = R02L003_GPS_LatAcc;

%vaneli
long1 = L002_GPS_LonAcc;
long2 = L005_GPS_LonAcc;
lat1 = L002_GPS_LatAcc;
lat2 = L005_GPS_LatAcc;
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
%primeira janela de tempo
j=1;
for i=500:50:length(lat1)
   
    theta_lat(j,:) = calcular_theta(lat1(i-499:i));
    theta_long(j,:) = calcular_theta(long1(i-499:i));
    
    figure(1)
    plot(theta_lat(j,1),theta_lat(j,2),'*');
    hold on
    grid on
    
    figure(2)
    plot(theta_long(j,1),theta_long(j,2),'*');
    hold on
    grid on
    j = j+1;
end

%Janela de Tempo de tamanho 500 unidades.
%Percorrendo o vetor em um passo de 50 unidades
for i=500:50:length(lat2)
    
    theta_lat(j,:) = calcular_theta(lat2(i-499:i));
    theta_long(j,:) = calcular_theta(long2(i-499:i));
    
    figure(1)
    plot(theta_lat(j,1),theta_lat(j,2),'*');
    hold on
    grid on
    
    figure(2)
    plot(theta_long(j,1),theta_long(j,2),'*');
    hold on
    grid on
    j = j+1;
end

