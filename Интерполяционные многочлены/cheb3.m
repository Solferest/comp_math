a = -2;
b = 4;
function y = func(x)
        y = -exp(x)+x.^2;
endfunction

function y0 = lagrange(X,Y,x0)
   y0=0;
   for i=1:length(Y)
      pr=1;
      for j=1:length(X)
         if i!=j
            pr=pr*(x0-X(j))/(X(i)-X(j));
         end;
      end;
      y0=y0+pr*Y(i);
   end;
endfunction
function C = cheb_interpolation(a,b,n,Y, X)
for i=1:length(X)
   for j=1:length(Y)
       A(i, j)=(X(i))^(j-1);
   end;
end;
C=A^-1*Y';
endfunction
for n= 2:2:16
   h=abs(a-b)/(n-1);
   hs=abs(a-b)/100;
   for i=1:n
       X1(i)=(1/2)*(a+b)+(1/2)*(b-a)*cos((2*i-1)*pi/(2*n));
       Y1(i)=func(X1(i));
       X2(i)=a+h*(i-1);
       Y2(i)=func(X2(i));
   end;
   C1=cheb_interpolation(a,b,n,Y1, X1);
   C2=cheb_interpolation(a,b,n,Y2, X2);
   i=1;
   for x=a:hs:b
       Y11(i)=abs(lagrange(X1, Y1, x)-func(x));
       Y22(i)=abs(lagrange(X2, Y2, x)-func(x));
       i+=1;
   end;
   In1(n/2)=max(Y11);
   In2(n/2)=max(Y22);
end;
a=0.5;
for i=1:6
    k1(i) = (-a+log(In1(i+1)))/log(In1(i));
    k2(i) = (-a+log(In2(i+1)))/log(In2(i));
end;
