function [ y ] = TVE( f,a,b )
% Valor M�ximo y M�nimo
% Jorge Caballero
% Problema 5

% f: Funcion, variable tiene que ser x
% a: l�mite inferior del intervalo
% b: l�mite superior del intervalo

p0 = (a+b)/2;

sol = NR(f,p0,30);

end

