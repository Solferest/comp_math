function y = func(x)       %  | не меняйте код здесь
    y = -exp(x)+x.^2;      %  /
end                        % /
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
function [delta, i] = delta(Y1,Y2)
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

n = str2num(input("","s"));%\
a = -2;                    % \
b = 4;
h=abs(a-b)/(100*n);
for i=1:n
   X(i)=(1/2)*(a+b)+(1/2)*(b-a)*cos((2*i-1)*pi/(2*n));
   Y(i)=func(X(i));
end;
i=1;
for x0=a:h:b
    Y1(i)=func(x0);
    Y2(i)=lagrange(X, Y, x0);
    i+=1;
end;
[delta_max, i]=delta(Y1, Y2);
x_delta_max=a+(i-1)*h;
