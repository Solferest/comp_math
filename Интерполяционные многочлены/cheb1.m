function C = cheb_interpolation(a,b,n,Y)
for i=1:n
   X(i)=(1/2)*(a+b)+(1/2)*(b-a)*cos((2*i-1)*pi/(2*n));
end;
for i=1:length(X)
   for j=1:length(Y)
       A(i, j)=(X(i))^(j-1);
   end;
end;
C=A^-1*Y';
endfunction
