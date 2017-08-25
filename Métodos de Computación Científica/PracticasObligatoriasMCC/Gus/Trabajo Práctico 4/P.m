function [ P_xy ] = P( a , b)
% Eval�a al polinomio de interpolaci�n de Lagrange en (a,b) que aproxima a la
% funci�n f(x,y) definida a continuaci�n.
% P(x,y) = P(a,b) => a=x, b=y

x = [0 1 2];
y = [0 2 4];

suma = 0;

for i = 1:1:3
    for j = 1:1:3
        prod = X_i(a,x,i) * Y_j(b,y,j) * f(x(i),y(j));
        suma = suma + prod;
    end
end

P_xy = suma;

end

