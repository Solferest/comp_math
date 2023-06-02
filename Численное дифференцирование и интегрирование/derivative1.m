function C = cheb(X,Y)
for i=1:length(X)
   for j=1:length(Y)
       A(i, j)=(X(i))^(j-1);
   end;
end;
C=A^-1*Y';
endfunction
function y = derivative(x, X, Y)
    # X - узлы интерполяции
    # Y - значения оригинальной функции в узлах интерполяции
    # x - точка, в которой считается значение производной
    h=X(2)-X(1);
    n=length(X);
    C=cheb(X,Y);
    C(1)=[];  
    y=0;
    for i=1:n-1
        y+=i*C(i)*x^(i-1);
    end
end
