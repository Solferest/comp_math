function C = cheb(X,Y)
for i=1:length(X)
   for j=1:length(Y)
       A(i, j)=(X(i))^(j-1);
   end;
end;
C=A^-1*Y';
endfunction
function I = integral(X,Y,n)
    # X - точки интервала, с помощью который необходимо вычислить интеграл
    # Y - значения оригинальной функции в этих точках
    # n - количество точек интерполяции для апроксимации функции полиномом
    j=1;
    I=0;
    for i=1:(length(X)-n)/(n-1)+1
        a=X(j);
        b=X(j+n-1);
        da=0;
        db=0;
        X1=X(j:j+n-1);
        Y1=Y(j:j+n-1);
        C=cheb(X1,Y1);
        for k=1:n
           da+=C(k)/k*a^(k);
           db+=C(k)/k*b^(k);
        end;
        j+=n-1;
        I+=db-da;
    end
    I=abs(I);
end
