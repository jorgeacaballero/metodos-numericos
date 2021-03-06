function [di] = Biseccion(fz,a,b,err)
%Biseccion Introduce una funcion, limite inferior, Limite exterior, y el
%error en el formato 10^-e. y te da devuelve un vector con todas las
%iteraciones
%fz en esta forma 'x^2'
%a es limite inferior
%b es el limite exterior
%err es el error deseado
%11141132 Cesar Welchez

fh = inline(fz);


%creacion de la funcion
syms x
eqn = log(1/err)/log(2) == x;
solx = ceil(solve(eqn,x));
%sacar iteraciones

%Programa
ban = 0;
    if(b<a)
        disp('Datos incorrectos, el limite inferior es mayor que el superior');
        ban = 1;
    end
    if (err>.1)
            disp('Datos incorrectos, el error es mas grande que el esperado, usar e<.1');
        ban = 1;
    end
    
if ban == 0
    
    iter = 0;
    di = zeros(double(solx),6);
    
    
    while(iter < solx)
        pm = (b+a)/2;
        
        
        iter= iter +1;
        
        if iter == 1
            
            a1= sprintf('n = %1.0f',iter);
            disp(a1)
            a2 = sprintf(' a(%0.0f) = %0.15f',iter,a);
            disp(a2)
            a3= sprintf(' p(%0.0f) = %0.15f',iter,pm);
            disp(a3)
            a3= sprintf(' b(%0.0f) = %0.15f',iter,b);
            disp(a3)
            a5 = sprintf(' f(%0.0f) = %0.15f',pm,fh(pm));
            disp(a5)
            a6= sprintf(' e(%0.0f) = ------',iter);
            disp(a6)
            
            di(iter,1) = iter;
            di(iter,2) = a;
            di(iter,3) = pm;
            di(iter,4) = b;
            di(iter,5) = fh(pm);
            di(iter,6) = 0;
            
            %  di(iter) = [ iter; a; pm; b;fh(pm); '-----'];
        else
            apm2 = abs(pm2-pm);
            
            
            a1= sprintf('n = %1.0f',iter);
            disp(a1)
            a2 = sprintf(' a(%0.0f) = %0.15f',iter,a);
            disp(a2)
            a3= sprintf(' p(%0.0f) = %0.15f',iter,pm);
            disp(a3)
            a3= sprintf(' b(%0.0f) = %0.15f',iter,b);
            disp(a3)
            a5 = sprintf(' f(%0.0f) = %0.15f',pm,fh(pm));
            disp(a5)
            a6= sprintf(' e(%0.0f) = %0.15f',iter,apm2);
            disp(a6)
            
            di(iter,1) = iter;
            di(iter,2) = a;
            di(iter,3) = pm;
            di(iter,4) = b;
            di(iter,5) = fh(pm);
            di(iter,6) = apm2;
            
        end
        
        
        if  fh(pm) < 0
            a = pm;
        else
            b = pm;
        end
        pm2 = pm;
    end
    
end

    
end





