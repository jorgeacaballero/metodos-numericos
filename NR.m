function y  = NR(a,n,p0,tol)
% Newton Raphson
% Jorge Caballero
% Problema 4

% a: Funcion, variable tiene que ser x
% n: numero de iteraciones
% p0: aproximacion inicial
% tol: precision (ej. 0.0001)

    disp('hola');
    i = 0;
    f = inline(a);
    dif=diff(sym(a));
    d = inline(dif);
    while(i <= n)
        p = p0 -(f(p0)/d(p0));
        if(abs(p-p0) < tol)
            y = p;
            disp(y);
            break
        end
        p0 = p;
        i = i+1;
    end
end

