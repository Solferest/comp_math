function y0=original_function(x0)
    y0 = exp(x0); % не меняйте это выражение
endfunction
N=length(X)-1;
h = (X(N+1)-X(1))/(100*N);
for i=1:N+1
    Y(i)=original_function(X(i));
end;
i=1;
for x0=X(1):h:X(N+1)
    Y1(i)=original_function(x0);
    Y2(i)=lagrange(X, Y, x0);
    i+=1;
end;
[delta, i]=delta_max(Y1, Y2);
x_delta_max=X(1)+(i-1)*h;
