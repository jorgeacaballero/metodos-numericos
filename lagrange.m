function [valorNumerico,polinomio] = lagrange( x_values,y_values,xk )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    n = size(x_values,2);
    if (n~=size(y_values,2))
       fprintf(1,'\nx_values e y_values deben tener el mismo tama�o.\n');
       
       valorNumerico=0;
    else
        valorNumerico=0;
        poli = '';
        M = '';
        for i=1:n
            numerador = 1;
            numX = '';
            denominador = 1;
            
            
            xmin = '*(x-';
            closee = ')';
            for j=1:n
                if(i==j)
                    
                else
                    numerador = numerador*(xk-x_values(j));
                    denominador = denominador*(x_values(i)-x_values(j));
                    %numX = numX+'(x-'+x_values(j)+')';
                    %numX = [numX xmin num2str(x_values(j)) closee];
                    numX =strcat(numX,xmin);
                    numX =strcat(numX,num2str(x_values(j)));
                    numX =strcat(numX,closee);
                end
            end
            denInv = (1/denominador)*y_values(i);
            if(i==1)
                poli = [poli '(' num2str(denInv) ')' numX];
                M = strcat(M,'(');
                M = strcat(M,num2str(denInv));
                M = strcat(M,')');
                M = strcat(M,numX);
            else
                poli = [poli '+' '(' num2str(denInv) ')' numX];
                M = strcat(M,'+(');
                M = strcat(M,num2str(denInv));
                M = strcat(M,')');
                M = strcat(M,numX);
            end
            
            
            
            L = numerador/denominador;
            
            valorNumerico = valorNumerico+y_values(i)*(L);
        end
        polinomio = M;
        disp(['f(x)=' polinomio]); 
        syms x;
        x = x_values(1):0.1:x_values(n);
        figure
        plot(x,subs(M));hold on;
        scatter(x_values,y_values,'P','red');
        %stem(x_values,y_values);
    end

end

