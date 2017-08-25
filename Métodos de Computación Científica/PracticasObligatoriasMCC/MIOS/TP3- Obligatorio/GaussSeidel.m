function [X]=GaussSeidel(A, b, P,tol,max)
% Datos de entrada
%   - la matriz de coeficientes A y el vector b
%   - P es el dato inicial, un vector de orden nx1
%   - tol es la tolerancia
%   - max es el numero maximo de iteraciones
%
% Datos de salida
%   - X es una matriz de orden nx1 con la aproximacion a la
% solucion de AX=B obtenida por el metodo de GaussSeidel
%
format long

n=length(b);
c=0;
for k=1:max
    % construccion de la siguiente iteracion por el metodo de GaussSeidel
    for j=1:n
        if j==1
            X(1)=(b(1)-A(1,2:n)*P(2:n))/A(1,1);
        else
            if j==n
                 X(n)=(b(n)-A(n,1:n-1)*(X(1:n-1))')/A(n,n);
            else
                X(j)=(b(j)-A(j,1:j-1)*(X(1:j-1))'-A(j,j+1:n)*P(j+1:n))/A(j,j);
            end
        end
        % condicion de paro
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
end