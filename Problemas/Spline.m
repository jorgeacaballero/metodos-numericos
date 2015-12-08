function [N,S] = Spline(X,Y,k)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%definir todas las variables que se necesitan
syms x1;
V = [x1];
E = [x1];
for i=1:length(X)-1
    eval(['syms a' num2str(i-1) ';']);
    eval(['V(end+1) = a' num2str(i-1) ';']);
    eval(['syms b' num2str(i-1) ';']);
    eval(['V(end+1) = b' num2str(i-1) ';']);
    eval(['syms c' num2str(i-1) ';']);
    eval(['V(end+1) = c' num2str(i-1) ';']);
    eval(['syms d' num2str(i-1) ';']);
    eval(['V(end+1) = d' num2str(i-1) ';']);
end
V2 = V([2:end]);
V = V2;
cont = 0;
%condiciones de ajuste
for i=1:length(X)-1
    eval(['eqn' num2str(cont) '= a' num2str(i-1) '== Y(i)' ';']);
    eval(['E(end+1) = eqn' num2str(cont) ';']);
    cont = cont+1;
end
eval(['eqn' num2str(cont) '=a' num2str(length(X)-2)...
    '+ b' num2str(length(X)-2) '*(X(length(X))-X(length(X)-1))'...
    '+ c' num2str(length(X)-2) '*(X(length(X))-X(length(X)-1))^2'...
    '+ d' num2str(length(X)-2) '*(X(length(X))-X(length(X)-1))^3'...
    '== Y(length(Y))' ';']);
eval(['E(end+1) = eqn' num2str(cont) ';']);
cont = cont+1;

%condiciones de continuidad
for i=1:length(X)-2
    eval(['eqn' num2str(cont) '= a' num2str(i-1)...
        '+ b' num2str(i-1) '*(X(i+1)-X(i))'...
        '+ c' num2str(i-1) '*(X(i+1)-X(i))^2'...
        '+ d' num2str(i-1) '*(X(i+1)-X(i))^3'...
        '== a' num2str(i) ';']);
    eval(['E(end+1) = eqn' num2str(cont) ';']);
    cont = cont+1;
end

%condiciones de derivabilidad
for i=1:length(X)-2
    eval(['eqn' num2str(cont)...
        '= b' num2str(i-1)...
        '+ 2*c' num2str(i-1) '*(X(i+1)-X(i))'...
        '+ 3*d' num2str(i-1) '*(X(i+1)-X(i))^2'...
        '== b' num2str(i) ';']);
    eval(['E(end+1) = eqn' num2str(cont) ';']);
    cont = cont+1;
end

%condiciones de 2da derivabilidad
for i=1:length(X)-2
    eval(['eqn' num2str(cont)...
        '= 2*c' num2str(i-1)...
        '+ 6*d' num2str(i-1) '*(X(i+1)-X(i))'...
        '==2*c' num2str(i) ';']);
    eval(['E(end+1) = eqn' num2str(cont) ';']);
    cont = cont+1;
    
end

%condiciones de trazador natural
eval(['eqn' num2str(cont) '= 2*c' num2str(0) '== 0' ';']);
eval(['E(end+1) = eqn' num2str(cont) ';']);
cont = cont+1;
eval(['eqn' num2str(cont) '= 2*c' num2str(length(X)-2) '+ 6*d' num2str(length(X)-2) '*((X(length(X))-X(length(X)-1))) == 0' ';']);
eval(['E(end+1) = eqn' num2str(cont) ';']);

E2 = E([2:end]);
E = E2;
[A,B] = equationsToMatrix(E, V);
Z = linsolve(A,B);

S = [x1];
cont = 1;

stem(X,Y,'*');hold on;
title('Plot Splines');
xlabel('x');
ylabel('y');
for i=1:length(X)-1
    syms x;
    eval(['equation(x) = Z(cont)+Z(cont+1)*(x-X(i))+Z(cont+2)*(x-X(i))^2+Z(cont+3)*(x-X(i))^3;']);
    S(end+1) = equation;
    cont = cont+4;
    x = X(i):0.1:X(i+1);
    plot(x,subs(equation));hold on;
end
Splines2 = S([2:end]);
S = Splines2;

m = '';
cont = 1;
syms x;
x = k;
for i=1:length(X)-1
    if i==length(X)-1
        eval(['equation = (Z(cont)+Z(cont+1)*(x-X(i))+Z(cont+2)*(x-X(i))^2+Z(cont+3)*(x-X(i))^3)* (X(i)<=x & x<=X(i+1));']);
    else
        eval(['equation = (Z(cont)+Z(cont+1)*(x-X(i))+Z(cont+2)*(x-X(i))^2+Z(cont+3)*(x-X(i))^3)* (X(i)<=x & x<X(i+1));']);
    end
    m = strcat(m,char(equation));
    m = strcat(m, '+');
    cont = cont+4;
end
syms Sp(x);
m = strcat(m,'0');
eval(['Sp(x) = m;']);
N = subs(Sp);

S
N
end



