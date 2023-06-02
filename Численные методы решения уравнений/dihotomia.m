i = str2num(input("","s"));
temp = str2num(input("","s"));
a = temp(1);
b = temp(2);
eps = str2num(input("","s"));
if i == 1
    function y = f(x)
        y = 5*x+6;
    end
elseif i == 2
    function y = f(x)
        y = x.^2-5*x-6;
    end
elseif i == 3
    function y = f(x)
        y = exp(sin(1./x))-1;
    end
elseif i == 4
    function y = f(x)
        y = cos(pi*x);
    end
end
function root = dihotomia(a,b,eps)
    # a, b - границы интервала, на котором ищется корень
    # eps - точность, с которой вычисляется корень
end
