function [di] = Biseccion(fz,a,b,err)
%Biseccion Introduce una funcion, limite inferior, Limite exterior, y el
%error en el formato 10^-e. y te da devuelve un vector con todas las
%iteraciones


fh = inline(fz);


%creacion de la funcion
syms x
eqn = log(1/err)/log(2) == x;
solx = ceil(solve(eqn,x));


%sacar iteraciones

iter = 0;
di = zeros(double(solx),6);


while(iter < solx)
    pm = (b+a)/2;
  
    
    iter= iter +1;
    if iter == 1
        di(iter,1) = iter;
        di(iter,2) = a;
        di(iter,3) = pm;
        di(iter,4) = b;
        di(iter,5) = fh(pm);
        di(iter,6) = 0;
        
      %  di(iter) = [ iter; a; pm; b;fh(pm); '-----'];
    else
        apm2 = abs(pm2-pm);
        
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





