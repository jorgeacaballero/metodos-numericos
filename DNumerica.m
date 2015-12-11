function [x0] = DNumerica(f, x, n, h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
switch n
    case 2
        opcion = input('1) Formula hacia atras \n2) Formula hacia adelante \nIngrese el numero de su opcion: ');
        if opcion == 1
            x0 = (f(x)-f(x-h))/h;
        else
           if opcion == 2
               x0 = (-f(x)+f(x+h))/h;
           else
               disp('Opcion no valida.');
           end
        end
    case 3
        opcion = input('1) Formula hacia atras \n2) Formula hacia adelante \n3) Formula centrada \nIngrese el numero de su opcion: ');
        if opcion == 1
            x0 = (3*f(x)-4*f(x-h)+f(x-2*h))/2*h;
        else
           if opcion == 2
               x0 = (-3*f(x)+4*f(x+h)-f(x+2*h))/2*h;
           else
               if opcion == 3
                   x0 = (-f(x-h)+f(x+h))/2*h;
               else
                   disp('Opcion no valida.');
               end
               
           end
        end
    case 4
        opcion = input('1) Formula hacia atras \n2) Formula hacia adelante \n3) Formula asimetrica x-h,x,x+h,x+2h \n4) Formula asimetrica x-2h,x-h,x,x+h \nIngrese el numero de su opcion: ');
        if opcion == 1
            x0 = (-2*f(x-3*h)+9*f(x-2*h)-18*f(x-h)+11*f(x))/6*h;
        else
           if opcion == 2
               x0 = (2*f(x+3*h)-9*f(x+2*h)+18*f(x+h)-11*f(x))/6*h;
           else
               if opcion == 3
                   x0 = (-2*f(x-h)-3*f(x)+6*f(x+h)-f(x+2*h))/6*h;
               else
                   if opcion == 4
                       x0 = (2*f(x+h)+3*f(x)-6*f(x-h)+f(x-2*h))/6*h;
                   else
                       disp('Opcion no valida.');
                   end
                   
               end
               
           end
        end
    otherwise
        disp('Ingrese un n entre 2 y 4');
end
end

