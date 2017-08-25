function [ coef_X_i ] = X_i( a, x, i )
% Calcula el coeficiente de interpolaci�n X_i para el punto de la abscisa
% "a"
%   a: abscisa. P(a,b).
%   x: vector de coeficientes x = [0 2 4]
%   i: �ndice que indica el valor actual del vector x.

prod = 1;

for k = 1:1:3
    if (k ~= i)
        prod = prod * ((a - x(k))/(x(i) - x(k)));
    end
end

coef_X_i = prod;

end

