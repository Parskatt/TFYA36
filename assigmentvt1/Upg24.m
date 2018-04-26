x = -1:0.001:1;
%g = x.^3 - x + sqrt(2)/2;
g = (2*x.^3-sqrt(2)/2)./(3*x.^2-1);
plot(x,g,x,x)
axis([-0.2 1 -0.5 2])
xold = 1000;

%%
xnew = 0;
hold on
k = 0;
while k < 10%abs(xnew - xold) > 0.01
    xold = xnew;
    xnew = g(round(xold/0.001)+1001);
    if xnew > xold
        xvals = xold:0.001:xnew;
        plot(xold*ones(length(xvals)),xvals,'b')
        plot(xvals,xnew*ones(length(xvals)),'r')
    else
        xvals = xnew:0.001:xold;
        plot(xold*ones(length(xvals)), xvals,'g')
        plot(xvals,xnew*ones(length(xvals)),'m')
    end
    k = k + 1
end
hold off
