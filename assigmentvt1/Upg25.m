x = -1:0.001:1;
r = 3.2;
g = popgrowth(x,r);
g2 = funccomp(@popgrowth,x,r,2);
plot(x,g2,x,g,x,x)
axis([0 1 0 1])
xold = 1000;

%%
xnew = 0.1;
hold on
k = 0;
while k < 20%abs(xnew - xold) > 0.01
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