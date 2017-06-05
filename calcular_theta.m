function [theta] = calcular_theta(var,k)
% X_lat_lap1(1,1) = lat1(2);
% X_lat_lap1(1,2) = lat1(1);

%Inicio da matriz
matriz = zeros(length(var)-k,k);

%primeira linha
%matriz(1,:) = [var(1) 0 0 ] ;
%Segunda Linha
%matriz(2,:) = [var(2) var(1) 0];
%Terceira Linha
%matriz(3,:) = [var(3) var(2) var(1)];

%linha 1 tem colunas de 1 at� atraso - 1
for i=0:k-1
matriz(1,i+1) = var(k-i);
end

for i=2:length(var)-k+1 %3 posi��es a frente do inicio
    
    %matriz = [matriz; [var(i-1) var(i-2) var(i-3)] ];
    %Reduzo a(3) em uma posi��o ->a(2), depois em outra posi��o a(1)
    
    
     %matriz(i,1) = var(k+i-1);
    for j=0:k-1 %atraso de zero at� k-1 colunas
        matriz(i,j+1) = var(k+i-1-j);
    
    end
end

%Multiplicar theta_estimado = PINV*Acc[k]
%var � reduzido de uma unidade
theta = pinv(matriz)*var(k:length(var));

end