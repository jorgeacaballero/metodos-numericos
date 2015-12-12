function [ output_args ] = NRD( x_values,y_values, n ,h )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[b,a] = lagrange(x_values,y_values,(x_values(1)+x_values(length(x_values))/2) );
xo0 = double(x_values(1)+x_values(length(x_values))/2);


fx = inline(a);
fxd = inline(diff(sym(a)));
disp(fxd);

inte = 0

valante = xo0 
answ = 0
while (1==1)
   inte = inte + 1;
    if inte > n 
        break
    else 
       
       answ =  valante - (fx(valante)/fxd(valante));
       valante = answ;
       disp(inte)
       disp(answ)
      
    end
end

end

