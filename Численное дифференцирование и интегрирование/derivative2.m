function dr = der_R(x,m,X)
    # x - точка, в которой считается значение остатка
    # m - значение f''(ξ)
    # X - узлы интерполяции
    n=length(X);
    dr=m/(factorial(n));
    for i=1:n
        if x!=X(i)
            dr*=(x-X(i));
        end
    end
    dr=abs(dr);
end
