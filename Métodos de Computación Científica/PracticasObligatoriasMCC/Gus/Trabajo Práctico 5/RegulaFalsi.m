function [ raiz ]= RegulaFalsi(f,a,b,maxIt)

%Input - f funcion a evaluar su raíz
% - a y b son los extremos sobre los cuales se calcula la raiz.
% - maxIt es el máximo número de iteraciones.
%Output - raiz es el cero de la función.
    delta = eps;
    epsilon = eps;
    
	ya=feval(f,a);
	yb=feval(f,b);
	
	if (ya*yb>0)
		error('f(a) y f(b) tienen el mismo signo');
	end
	
	for k=1:maxIt
		dx = yb*(b-a)/(yb-ya);
		c = b-dx
		ac = c-a;
		yc = feval(f,c);
		
		if ( yc == 0 )
			break;
		elseif (yb*yc > 0)
				b = c;
				yb = yc;
			else
				a = c;
				ya = yc;
		end
	
		dx = min(abs(dx),ac);
		
		if (abs(dx)<delta)
			break;
		end
		
		if (abs(yc)<epsilon)
			break;
		end
	end

	raiz = c;
    
end

