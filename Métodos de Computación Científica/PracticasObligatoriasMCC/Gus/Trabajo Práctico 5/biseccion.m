function [ raiz ] = biseccion(f, a, b, maxIt )
% f: function handler
% [a,b]: extremos del intervalo en donde se busca la raiz.

if ( f(a) == 0 )
	raiz = a;
	return;
elseif ( f(b) == 0 )
	raiz = b;
	return;
elseif ( f(a) * f(b) > 0 )
        error( 'f(a) and f(b) no tienen distinto signo' );
end

iteraciones = 0;
tol_f = eps;
tol_x = eps;

while (((b - a) >= tol_x )|| (( abs(f(a)) >= tol_f && abs(f(b))  >= tol_f))&&(iteraciones < maxIt))
    c = (a + b)/2; %punto medio.
    if ( f(c) == 0 ) %se encontró la raíz.
       break;
    elseif ( f(a)*f(c) < 0 ) %hay cambio de signo.
       b = c;
    else
       a = c;
    end
end

raiz = c;

end

