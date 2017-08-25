function [X]=Jacobi(A, b, P,tol,max)

% Datos de entrada
%   - A matriz de coeficientes y b el vector
%   - P es el dato inicial, un vector de orden nx1
%   - tol es la tolerancia
%   - max es el numero maximo de iteraciones
%
% Datos de salida
%   - X es una matriz de orden nx1 con la aproximacion a la
% solucion de AX=B obtenida por el metodo de Jacobi
%
format long

n=length(b);
c=0;
for k=1:max
% construccion de la siguiente iteracion por el metodo de Jacobi
    for j=1:n
        X(j)=(b(j)-A(j,[1:j-1,j+1:n])*P([1:j-1,j+1:n]))/A(j,j);
    end
    % condici¶oon de paro
    ea=abs(norm(X'-P));
    er=ea/(norm(X)+eps);
    if(ea<tol)|(er<tol)
      disp('Se alcanzo la tolerancia con exito en la iteracion')
      k
       disp('y la solucion aproximada es')
      X=X';
      c=1;
      break
    else
     P=X';
    end
end
% no cumplimiento de la condicion de paro
if c==0
    disp('El metodo no cumple el criterio de paro propuesto para')
    max
    disp('iteraciones.')

end

