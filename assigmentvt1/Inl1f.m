x = zeros(1,39);
r =(0.1:0.0005:5);
r_vec = [];
x_vec = [];
for r =(0.1:0.001:2.5)
    boi = zeros(1000,1);
    x = 0.5;
    for k = (1:2000)
        x = r*x - x.^3;%x*r*(1-x);
        if k > 1000
            boi(k-1000) = x;
        end 
    end
    r_vec = [r_vec; r*ones(1000,1)];
    x_vec = [x_vec;boi];
end
%%
scatter(r_vec,x_vec,1)
title('Bifurcation diagram for rx-x^3')
xlabel('r')