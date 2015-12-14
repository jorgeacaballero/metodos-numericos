function [z] = Rtan (fx,x0)
%Esta función suma dos números x e y
%y devuelve el resultado de la suma en z
 syms x;
    d=diff(fx,x);
    y0=subs(fx,x0);
    m=subs(d,x0);
    
    z=m*x+1*(y0-m*x0); %efectúa la suma
end

