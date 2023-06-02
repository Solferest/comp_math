function y = func(x)
    y = abs(x-3);
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
