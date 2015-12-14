function[response] = PTaylor(f,x0,n)
%Para usar PTaylor, Ejemplo:
%syms x
%f = cos(x)
%PTaylor(f,0,4)
x = sym('x');
b = subs(f,x,x0);
p = b;
ans = '';
for i = 1:n
    D = diff(f,i);
    c = (x-x0)^i;
    v = subs(D,x,x0)*c/factorial(i);
    p = [p,v]; %#ok<AGROW>
end
for i = 1:length(p)
    s = char(p(i));
    if i == 1
        ans = strcat(ans,char(p(i)));
    else
        if s(1) == '-' 
             ans = strcat(ans,char(p(i)));
        else
            ans = strcat(ans,'+',s); %#ok<*NOANS>
           
        end
    end

end
response = ans;
end