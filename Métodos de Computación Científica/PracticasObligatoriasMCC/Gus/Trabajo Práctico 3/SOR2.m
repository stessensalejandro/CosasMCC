function [ x ] = SOR2( A, b, xViejo, w, tol, maxIt )
% Aproxima la soluci�n del sistema Ax = b mediante el m�todo iterativo SOR
% Inputs:
%           A        matriz de coeficientes del sistema lineal (debe ser una
%                    matriz cuadrada.
%           b        vector del lado derecho del sistema lineal.
%           xViejo   vector que contiene los valores iniciales para la
%                    soluci�n del sistema lineal.
%           w        par�metro de relajaci�n.
%           tol      tolerancia de convergencia. Aplicada a la m�xima norma
%                    de la diferencia entre las sucesivas aproximaciones.
%           maxIt    cantidad m�xima de iteraciones a realizar.
%           
% Output:
%           x        soluci�n aproximada del sistema lineal.

n = length(b);
[f c] = size(A);

if (c ~= n)
    disp ('error: la dimensi�n de la matriz y del vector no son compatibles')
    return
end;

xNuevo = zeros(1,n);

for k = 1:maxIt
    k
    xNuevo(1) = (1 - w) * xViejo(1) + w * (b(1) - sum(A(1,2:n) .* xViejo(2:n))) / A(1,1)
    
    for i = 2:(n-1)
        xNuevo(i) = (1 - w) * xViejo(i) + w * (b(i) - sum(A(i,1:i-1) .* xNuevo(1:i-1)) - sum(A(i,i+1:n) .* xViejo(i+1:n))) / A(i,i)    
    end;
  
    xNuevo(n) = (1 - w) * xViejo(n) + w * (b(n) - sum(A(n,1:n-1) .* xNuevo(1:n-1))) / A(n,n)
    
    convergencia = max( abs( xNuevo - xViejo ) );
    
    if(convergencia < tol)
        break;
    else
        xViejo = xNuevo;
    end;
    
end
x = xNuevo;

end

