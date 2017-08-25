function [ r ] = radioEspectralSOR( A, w)
% Calcula el radio espectral de la matriz de iteración del método SOR
% para un parámetro w dado.

% Obtiene la descomposición de A en D, L y U
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

% Matriz de iteración SOR
M = inv(D + w*L)*(-w*U + D*(1 - w));

radioEspectral = max( abs( eig( M ) ) );

r = radioEspectral;

end

