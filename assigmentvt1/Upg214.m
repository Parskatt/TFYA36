x = -1:0.001:1;
r = 3.835;
c = 0.251
g = mod(x.^2+c,1)
plot(x,g,x,x)
axis([-1 1 -1 1])
xold = 1000;

%%
xnew = 0.3;
hold on
k = 0;
while k < 500%abs(xnew - xold) > 0.01
    xold = xnew;
    xnew = g(round(xold/0.001)+1001);
    if xnew > xold
        xvals = xold:0.001:xnew;
        plot(xold*ones(length(xvals)),xvals,'-k')%(1/(k+1)).*[1 1 1])
        plot(xvals,xnew*ones(length(xvals)),'-k')%(1/(k+1)).*[1 1 1])
    else
        xvals = xnew:0.001:xold;
        plot(xold*ones(length(xvals)), xvals,'-k')%(1/(k+1)).*[1 1 1])
        plot(xvals,xnew*ones(length(xvals)),'-k')%(1/(k+1)).*[1 1 1])
    end
    k = k + 1
end
hold off