Подтвердите, что истинная погрешность интерполяции оказывается меньше расчитанной раньше оценки. Для этого используйте функции, описанные ранее (здесь они не предопределены).
Рассчитайте максимальное отклонение многочлена интерполяции, рассчитанного методом Ньютона, от оригинальной функции, представленной на предыдущем степе в узлах интерполяции из предыдущего степа.
  Максимум модуля отклонения запишите в переменную delta_max, а точку, в которой этот максимум достигается в x_delta_max.
Шаг полного перебора точек для поиска максимального отклонения возьмите из рассчёта 100 точек на один интервал.
Убедитесь, что ваша программа ничего не выводит на экран.




function y0 = newton(X,Y,x0)
    y0=Y(1);
    prX=1;
    for i=2:length(X)
        prX*=(x0-X(i-1));
        fi=0;
        for j=1:i
            difX=1;
            for k=1:i
                if k!=j
                    difX*=X(j)-X(k);
                end;
            end;
            fi+=Y(j)/difX;
        end;
        y0+=fi*prX;
    end;
endfunction
function y=original_function(x)
    y=-exp(x)+x^2;
endfunction
function [delta, i] = delta_f(Y1,Y2)
    delta=-1;
    i=0;
    for j=1:length(Y1)
        delta_j=abs(Y2(j)-Y1(j));
        if delta_j>delta
            delta=delta_j;
            i=j;
        end;
    end;
endfunction
X=[-2, 1, 4];
N=length(X)-1;
h = (X(N+1)-X(1))/(100*N);
for i=1:N+1
    Y(i)=original_function(X(i));
end;
i=1;
for x0=X(1):h:X(N+1)
    Y1(i)=original_function(x0);
    Y2(i)=newton(X, Y, x0);
    i+=1;
end;
[delta_max, i]=delta_f(Y1, Y2);
x_delta_max=X(1)+(i-1)*h;
