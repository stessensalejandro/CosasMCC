function [ x ] = SOR( A , x , b , w , maxIt )
%
    orden = size(A);
    n = orden(1);

    for k = 1:maxIt
        
        for i = 1:n
            
            i
            s = 0
            
            for j = 1:(i-1)
                j
                disp('lalalla')
                x_GS = GS(A,x,j,b)
                s = s + A(i,j)*x_GS
            end
            
            for j = i:n
                j
                disp('asdfasdf')
                s = s + A(i,j)*x(j)
            end
            
            x(i) = x(i) + w*(b(i) - s)/A(i,i)
            x
        end
        
    end


end

