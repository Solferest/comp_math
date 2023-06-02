x = str2num(input("","s"));
function y = func(x)
    y = sin(5*x);
endfunction

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
