x = zeros(1,39);
r =(0.1:0.001:5);
r_vec = [];
x_vec = [];
for r =(0.1:0.001:5)
    boi = zeros(1000,1);
    x = 0.9;
    x = min((max(0,sqrt(r)*(1/2 + randn(n)/4))),sqrt(r));
    for k = (1:2000)
        if x < 1
            x = r*x - x.^3;%x*r*(1-x);
        else
            x = 0;
        end
        if k > 1000)
            boi(k-1000) = x;
        end 
    end
    r_vec = [r_vec; r*ones(1000,1)];
    x_vec = [x_vec;boi];
end
scatter(r_vec,x_vec,1)