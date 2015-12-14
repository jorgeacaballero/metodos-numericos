function [answ] = NRD( x_values,y_values, e ,h )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%x_values son los valores en x,en forma de vector [x1,x2,x3,....,xn]
%x_values son los valores en y,en forma de vector [y1,y2,y3,....,yn]
%e es el error iterativo deseado
%h es el un numero requerido para la funcion de Dnumerica.
%11141132 Cesar Welchez

ban = 0;

    if (e>.1)
            disp('Datos incorrectos, el error es mas grande que el esperado, usar e<.1');
        ban = 1;
    end
    
if ban == 0
    
[b,a] = lagrange(x_values,y_values,(x_values(1)+x_values(length(x_values))/2) );
xo0 = double((x_values(1)+x_values(length(x_values)))/2);


fx = inline(a);
%fxd = inline(diff(sym(a)));

fxd = inline(diff(sym(a)));


inte = 0;

valante = xo0 ;
answ = 0;



disp('Se ocupa informacion extra por el usuario para la funcion de DNumerica: ')
error = 1;

n = 0;


    

while error>=e
    n = n+1;
    inte = inte + 1;
    %answ =  valante - (fx(valante)/DNumerica(sym(a), xo0, 2, .1));
    answ =  valante - (fx(valante)/DNumerica(sym(a), valante, 2, h));
    a1= sprintf('n = %1.0f',n);
    disp(a1)
    a3 = sprintf(' p(%0.0f) = %0.15f',n,answ);
    disp(a3)
    a2= sprintf(' e(%0.0f) = %0.15f',n,error);
    disp(a2)
    error = abs(answ - valante);
    valante = answ;
    
    
    
end


end

end

