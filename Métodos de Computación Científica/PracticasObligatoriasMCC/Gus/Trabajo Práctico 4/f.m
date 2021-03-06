function [ f_val ] = f( x_i, y_j )
% x_i: abscisa. 
% y_j: ordenada al origen.
% el primer valor posible para x_i e y_j es 0 y como el primer indice
% accesible de un vector en Matlab es 1 y no 0, se acomodan los valores de
% la funci�n. Por ejemplo f(0,0) pasa a ser f(1,1).

f =[];

f(1,1) = 1;
f(1,3) = 7.3891;
f(1,5) = 54.5982;
f(2,1) = 2.7183;
f(2,3) = 20.0855;
f(2,5) = 148.4132;
f(3,1) = 7.3891;
f(3,3) = 54.5982;
f(3,5) = 403.4288;

f_val = f(x_i + 1, y_j + 1); %se suma uno para acceder correctamente al elemento de la matriz.

end

