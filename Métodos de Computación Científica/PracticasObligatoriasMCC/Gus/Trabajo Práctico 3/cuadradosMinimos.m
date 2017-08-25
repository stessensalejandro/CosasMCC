function [ a, b, c ] = cuadradosMinimos( x, y )
% Calcula los coeficientes a, b y c de una ecuación cuadrática
% que mejor aproxima los puntos de datos  (x,y)
% Inputs:
%       x: vector de abscisas.
%       y: vector de ordenadas al orígen.

% Armamos un sistema Au = v donde el vector "u" de incógnitas está formado por
% los coeficientes a, b y c. La matriz de coeficientes está formada por las
% correspondientes sumatorias del lado izquierdo del sistema. Por último el
% vector v está formado por las sumatorias del lado derecho del sistema
% lineal.

    n = length(x); %n es la cantidad de datos.
    
    if(n ~= length(y))
        disp('La cantidad de datos en x e y deben coincidir')
        return    
    end;

    % A: se inicializa la matriz de coeficientes A
    A = zeros(3);

    % se cargan los coeficientes en A.
    % cabe notar que el coeficiente en la posición (i,j) es igual a la
    % sumatoria de todos los x_i elevados a la (i + j - 2).
    for i = 1:3

        for j = 1:3

            A(i,j) = sum(x(1:n).^(i+j-2));

        end

    end
    %A

    % v: se inicializa el vector del lado derecho del sistema lineal.
    v = diag(zeros(3));

    % se cargan los coeficientes del vector v.
    % notar que dichos coeficientes son la sumatoria de los y_i multiplicados
    % por el x_i elevado a la (i-1) donde i es el número de fila.

    for i = 1:3

        v(i) = sum((x(1:n).^(i-1)).*y(1:n));

    end;
    
    %v

    % Ahora una vez obtenidos la matriz A y el vector b procedemos a hallar la
    % solución del sistema lineal que da como resultado un vector con los
    % coeficientes [a b c]

    u = inv(A)*v;

    a = u(1); b = u(2); c = u(3);

end

