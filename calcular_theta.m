function [theta] = calcular_theta(var,k,passo)
theta = zeros(k,round( (length(var)-500)/passo)); %inteiro de uma divisão
col=1;
    for x=500:passo:length(var)

        %Inicio em var(1:500)
        temp = var(x-499:x);



        %Inicio da matriz
        matriz = zeros(length(temp)-k,k);

        %linha 1 tem colunas de 1 até atraso - 1
        for i=0:k-1
            matriz(1,i+1) = temp(k-i);
        end

        for i=2:length(temp)-k+1 %i  linhas até tamanho de var -k + 1

            %matriz = [matriz; [var(i-1) var(i-2) var(i-3)] ];
            %Reduzo a(3) em uma posição ->a(2), depois em outra posição a(1)


            %matriz(i,1) = var(k+i-1);
            for j=0:k-1 % j atrasos de zero até k-1 colunas
                matriz(i,j+1) = temp(k+i-1-j);

            end
        end

        %Multiplicar theta_estimado = PINV*Acc[k]

        theta(:,col) = pinv(matriz)*temp(k:length(temp)); %inicio no valor var(k)
        col=col+1;
    end
end