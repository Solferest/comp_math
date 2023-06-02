i = str2num(input("","s"));
x_0 = str2num(input("","s"));
eps = str2num(input("","s"));
if i == 1
    function y = f(x)
        y = 5*x+6;
    end
    function y = df(x)
        y = 5;
    end
elseif i == 2
    function y = f(x)
        y = x.^2-5*x-6;
    end
    function y = df(x)
        y = 2*x-5;
    end
elseif i == 3
    function y = f(x)
        y = exp(sin(1./x))-1;
    end
    function y = df(x)
        y = exp(sin(1./x)).*cos(1./x).*(-1./x.^2);
    end
elseif i == 4
    function y = f(x)
        y = cos(pi*x);
    end
    function y = df(x)
        y = -pi*sin(pi*x);
    end
end
function root = Newton_root(x_0,eps)
    # x_0 - точка начального приближения
    # eps - точность, с которой вычисляется корень
    j=1;
    x(1)=x_0;
    x(2)=x_0+2*eps;
    while true
        x(j+1)=x(j)-f(x(j))/df(x(j));
        if abs(x(j+1)-x(j))<eps
            break;
        end
        j+=1;
    end
    root=x;
end
