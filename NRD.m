function [ di] = NRD( x_values,y_values, n ,h )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[b,a] = lagrange(x_values,y_values,(x_values(1)+x_values(length(x_values))/2) );
xo0 = double((x_values(1)+x_values(length(x_values)))/2);


fx = inline(a);
%fxd = inline(diff(sym(a)));

fxd = inline(diff(sym(a)));


inte = 0;

valante = xo0 ;
answ = 0;


di = zeros(n,3);
disp('Se ocupa informacion extra por el usuario para la funcion de DNumerica: ')
while (1==1)
   inte = inte + 1;
    if inte > n 
        break
    else 
       
       %answ =  valante - (fx(valante)/DNumerica(sym(a), xo0, 2, .1));
       answ =  valante - (fx(valante)/DNumerica(sym(a), valante, 2, .1));
       
       di(inte,1) = inte;
       di(inte,2) = answ;
       di(inte,3) = answ - valante;
       
       valante = answ;
   
       
       
     
      
    end
end
disp(di)
end

