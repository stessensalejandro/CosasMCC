function [ wOpt] = wOptimo( A )
% Calcula un valor �ptimo para el par�metro de relajaci�n sucesiva w.
% A: matriz original a partir de la cual se obtiene el radio espectral de
% su matriz de iteraci�n SOR
    
    %inicializa el valor m�nimo en el peor caso
    %inicializa wOpt en un valor inv�lido para detectar errores.
    min = 2;
    wOpt = -1;
    k = 0;
    % Calcula wOpt con 4 decimales de precisi�n
    % prueba por fuerza bruta valores para w entre 0.0001 y 1.9999
    % con pasos de 0.0001
    for w = 0.1:0.1:1.9
        
        r = radioEspectralSOR(A,w);
        [r w]
        
        if(r < min) 
            min = r;
            wOpt=w;
        end;
        
        if( w == 1.0)
            r = radioEspectralSOR(A,0.9178);
            [r 0.9178]
            if(r < min) 
                min = r;
                wOpt=0.9178;
            end;
        end;
        
    
    end
    
end

