function [theta] = calcular_theta(var)
% X_lat_lap1(1,1) = lat1(2);
% X_lat_lap1(1,2) = lat1(1);
%var = entrada(inicio:fim,1);
%matriz = zeros(fim-inicio,1);
matriz(1,1) = var(2);
matriz(1,2) = var(1);
for i=3:length(var)+1 %2 posições a frente do inicio
   
    %Reduzo a(3) em uma posição ->a(2), depois em outra posição a(1)
    matriz = [matriz; [var(i-1) var(i-2)] ];
   
    
end

%Multiplicar theta_estimado = PINV*Acc[k]
 theta = pinv(matriz)*var;

end