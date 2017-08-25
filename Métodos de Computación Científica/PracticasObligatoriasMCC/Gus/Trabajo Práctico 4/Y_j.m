function [ coef_Y_j ] = Y_j( b, y, j )
% Calcula el coeficiente de interpolación Y_i para el punto de la ordenada
% al origen "b"
%   b: ordenada al orígen de P(a,b).
%   y: vector de coeficientes x = [0 1 2]
%   j: índice que indica el valor actual del vector y.

prod = 1;

for k = 1:1:3
    if (k ~= j)
        prod = prod * ((b - y(k))/(y(j) - y(k)));
    end
end

coef_Y_j = prod;

end