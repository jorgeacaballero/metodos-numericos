function[ans] = PFijo (g,n,a,b)
%Para usa PFijo, se usan como parametros 
%una funcion g
%n como numero de iteraciones
%a como el primer extremo del intervalo
%y b como el otro extremo 
syms x;

pN = (a+b)/2;
ans = pN;
n = n -1;
for i = 0:n
    %primero se hace la vertical
    c = double(subs(g,x,pN));
    plot([pN,pN],[pN,c],'r');hold on;
    %segundo se hace la horizontal
    plot([pN,c],[c,c],'r');hold on;
    pN = c;
    ans = pN;
    
end
q = get(gca,'xlim');
q(1) = q(1) - 0.2;
q(2) = q(2) + 0.2;
plot(q,subs(g,x,q),'g');hold on;
plot(q,q,'k');hold on;

end