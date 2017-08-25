function [ r ] = radioEspectralSOR( A, w)
% Calcula el radio espectral de la matriz de iteraci�n del m�todo SOR
% para un par�metro w dado.

% Obtiene la descomposici�n de A en D, L y U
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

% Matriz de iteraci�n SOR
M = inv(D + w*L)*(-w*U + D*(1 - w));

radioEspectral = max( abs( eig( M ) ) );

r = radioEspectral;

end

