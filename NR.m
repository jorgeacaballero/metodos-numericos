function X = NR(a,p0,n)
% Function :
% Newton Raphson
% Jorge Caballero
% Problema 4

% a: Funcion, variable tiene que ser x
% n: numero de iteraciones
% p0: aproximacion inicial
fx = inline(a);
fxd = inline(diff(sym(a)));
disp(fxd);

x0 = p0;
disp('NEWTON RAPHSON');
disp(['F(X) = ' a]);
disp(['X0 = ' num2str(x0)]);
% Iterating
for i = 1 : n
    s1=sprintf('n = %1.0f',i);
    disp(s1);
    x1 = x0 - (fx(x0)/fxd(x0));
    s2=sprintf(' X(%0.0f) = %0.15f',i,x1);
    disp(s2);
    if x1 == x0
        break;
    else
        x0 = x1;        
    end
end

X = x1;
