X = str2num(input("","s"));
epsilon = str2num(input("","s"));
# Считанные точки альтернанса находятся в переменной X
# Счиатнное значение эпсилон находится в переменной epsilon
function y = func(x)
    y = abs(abs(x-3)-1);
endfunction
function [P, sigma] = Poly_quasialternance(X)
    for i=1:length(X)
        Y(i)=func(X(i));
    end;
    for i=1:length(X)
       for j=1:length(Y)-1
           A(i, j)=(X(i))^(j-1);
       end;
       A(i,j+1)=(-1)^(i+1);
    end;
    P=A^-1*Y';
    sigma=P(length(P));
    P(length(P))=[];
endfunction
function Y=polynome(X,C)
    Y=0;
    for i=1:length(C)
        Y=Y*X+C(length(C)+1-i);
    end;
endfunction;
function [sigma, P] = shuffle(X, epsilon)
    # X - набор точек квазиальтернанса для f(x)-P(x)
    # P - коэффициенты полинома "наименее отклоняющегося" от f(x)
    # x_max - максимум модуля отклонения
sigma(1)=-1;
p=0;
j=1;
while p!=1
    [P, sigma(j+1)]=Poly_quasialternance(X);
    P=P';
    h=abs(X(1)-X(length(X)))/500;
    k=1;
    delta=-1;
    for x=X(1):h:X(length(X))
        if x>X(k)
            k+=1;
        end;
        Y=abs(func(x)-polynome(x,P));
        if Y>delta
            delta=Y;
            x_delta=x;
            i=k-1;   
        end;
    end;
    if x_delta<X(1)
        if sign(func(X(1))-polynome(X(1), P))==sign(func(x_delta)-polynome(x_delta, P))
            X(1)=x_delta;
        else
            for j=1:length(X)-1
                X(length(X)+1-j)=X(length(X)-j);
            end;
            X(1)=x_delta;
        end;
    elseif x_delta>X(length(X))
         if sign(func(X(length(X)))-polynome(X(length(X)), P))==sign(func(x_delta)-polynome(x_delta, P))
            X(length(X))=x_delta;
        else
            for j=1:length(X)
                X(j)=X(j+1);
            end;
            X(length(X))=x_delta;
        end;       
    else
        if sign(func(X(i))-polynome(X(i), P))==sign(func(x_delta)-polynome(x_delta, P))
            X(i)=x_delta;
        elseif sign(func(X(i+1))-polynome(X(i+1), P))==sign(func(x_delta)-polynome(x_delta, P))
            X(i+1)=x_delta;
        end;
    if abs(sigma(j+1)-sigma(j))<epsilon
       break
    end;
end;
    j+=1;
end;
endfunction
[sigma, P]=shuffle(X, epsilon);
sigma(1)=[];
