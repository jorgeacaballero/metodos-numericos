function [ resultado ] = CGauss( funcion, a, b, n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if(a==-1 && b==1)
        %fx = @(x) funcion(x);
        fx = inline(funcion);
    else
        %r = b-a;
        %r2 = a+b;
        %dififx = @(t) (t*(b-a)+a+b)/2;
        %fx =@(t) funcion(((t*(b-a)+a+b)/2)*diff(func2str(dififx)));
        syms t;
        fxder = diff(sym(eval('(t*(b-a)+a+b)/2')));
        fxant = inline(funcion);
        fx =@(t) fxant((t*(b-a)+a+b)/2)*fxder;
        
    end
    
    %sym(funcion);
    if(n==2)
        resultado = fx(sqrt(3)/3)+fx(-sqrt(3)/3);
    else
        if(n==3)
            resultado = (5/9)*fx(sqrt(15)/5)+(5/9)*fx(-sqrt(15)/5)+(8/9)*fx(0);

        else
            
            if(n==4)
                resultado = (0.3478548451)*fx(0.8611363116)+(0.6521451549)*fx(0.3399810436)+(0.6521451549)*fx(-0.3399810436)+(0.3478548451)*fx(-0.8611363116);
            else
                if(n==5)
                    resultado = (0.5688888889)*fx(0)+(0.2369268850)*fx(0.9061798459)+(0.2369268850)*fx(-0.9061798459)+(0.4786286705)*fx(0.5384693101)+(0.4786286705)*fx(-0.5384693101);
                    
                else
                   fprintf(1,'Debe ser 2 <= n <=5');
                   resultado = NaN; 
                end
            end
            
        end
    end
    
                
              

end

