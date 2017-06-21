function normalizado = normalizar(vetor)
format long
n = length(vetor);
normalizado = zeros(n,1);

    for i=1:n;
        normalizado(i) = (vetor(i)-min(vetor))/( max(vetor) - min(vetor));

    end

end


