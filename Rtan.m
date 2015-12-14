function [z] = Rtan (fx,x0)
%Esta funci�n suma dos n�meros x e y
%y devuelve el resultado de la suma en z
 syms x;
    d=diff(fx,x);
    y0=subs(fx,x0);
    m=subs(d,x0);
    
    z=m*x+1*(y0-m*x0); %efect�a la suma
end

