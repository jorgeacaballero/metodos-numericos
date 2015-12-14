function [ minf, maxf ] = TVE( f,a,b )
% Valor Máximo y Mínimo
% Jorge Caballero
% Problema 5

% f: Funcion, variable tiene que ser x
% a: límite inferior del intervalo
% b: límite superior del intervalo

p0 = (a+b)/2;

sol = NR(f,p0,0.0000000000001);

if sol > a && sol < b
    disp('p pertenece al conjunto [a,b]');
    bis = Biseccion(f,a,b,0.0001);
    disp(sort(bis));
    
end

min = fminbnd(inline(f),a,b);
g = inline(sym(['(' char(f) ')*(' char('-1') ')']));
maxi = fminbnd(g,a,b);

disp('min = ');
disp(min);
disp('max = ');
disp(maxi);

minf = min;
maxf = maxi;
end

