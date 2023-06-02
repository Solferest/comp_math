function y = func(x)
    y = sin(5*x);
endfunction
function Y=polynome(X,C)
    Y=C(1)*X^3+C(2)*X^2+C(3)*X+C(4);
endfunction;
function C = spline(x)
    n=length(x);
    for i=1:n
       y(i)=func(x(i));
    end;
    for i = 1:n-1
        h(i) = (x(i + 1) - x(i));
        b(i) = (y(i + 1) - y(i)) / h(i);
    end;
    for i=1:n-2
        v(i)=2*(h(i)+h(i+1));
        u(i)=6*(b(i+1)-b(i));
    end;
    h1=h;
    h1(1)=[];
    h1(n-2)=[];
    matr=diag(v)+diag(h1,1)+diag(h1,-1);
    z=matr^(-1)*u';
    z=[0;z;0];
    for i=1:n-1
       C(i,1)=(z(i+1)-z(i))/(6*h(i));
       C(i,2)=-z(i+1)*x(i)/(2*h(i))+z(i)*x(i+1)/(2*h(i));
       C(i,3)=z(i+1)*x(i)^2/(2*h(i))-z(i)*x(i+1)^2/(2*h(i))+y(i+1)/h(i)-z(i+1)/6*h(i)-(y(i)/h(i)-h(i)/6*z(i));
       C(i,4)=-z(i+1)/(6*h(i))*x(i)^3+z(i)/(6*h(i))*x(i+1)^3-(y(i+1)/h(i)-z(i+1)/6*h(i))*x(i)+(y(i)/h(i)-h(i)/6*z(i))*x(i+1);
    end;
endfunction
A = str2num(input("","s"));
a = A(1);
b = A(2);
# a - начало интервала, b - конец
for n = 3:10
   x = linspace(a,b,n);
   h=abs(a-b)/(n-1);
   hs=abs(a-b)/(100*n);
   for i=1:n
       Y(i)=func(x(i));
   end;
   x;
   C=spline(x);
   for i=1:n-1
       ai(i)=C(i,1);
       bi(i)=C(i,2);
       ci(i)=C(i,3);
       di(i)=C(i,4);
   end;
   i=1;
   j=1;
   Ci=[ai(1),bi(1),ci(1),di(1)];
   for xi = a:hs:b
        if xi > x(i+1)
            Ci = [ai(i + 1), bi(i + 1), ci(i + 1), di(i + 1)];
            i += 1;
        end;
        Yi(j) = abs(polynome(xi, Ci) - func(xi));
        j += 1;
   end;
   In(n-2)=max(Yi);  
end;
for i=1:7
   k(i) = (0.5+log(In(i+1)))/log(In(i));
end;
