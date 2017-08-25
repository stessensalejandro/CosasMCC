function [ x_GS ] = GS(A,x,i1,b)
% devuelve la siguiente aproximación del vector resultado x.
% A: matriz de orden n.
% x: solución iteración anterior.
% b: vector resultado.

disp('Estoy en GS ')
x
i1

    orden = size(A);    %size(A) devuelve un vector de dos componentes: (cant filas, cant columnas)
    n = orden(1);
    
    %for i = 1:n
       % i: i-ésima variable.
       % s:
       %i
       s = 0
       
       for j = 1:(i1-1)            
            s = s + A(i1,j)*x(j)    % x(j): es el de la última iteración.
       end
       
       for j = (i1+1):n
            s = s + A(i1,j)*x(j)    % x(j): es el de la iteración anterior.
       end
       
       x_GS = (b(i1) - s)/A(i1,i1)       
       
    %end
    disp('fin GS')
end

