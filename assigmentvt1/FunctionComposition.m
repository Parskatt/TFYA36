%Plots the 2 composition of the population mapping for 2 <= r <= 4
hold on
jetboi = spring(201);
for r = (2:0.001:3.45)
    x = (0:0.01:1);
    f1 = x.*r.*(1-x);
    f2 = f1.*r.*(1-f1);
    %statpoints = f1(abs(f1 - x) < 0.015);
    Colorboi = jetboi(round((r-2)/0.01 +1),:);
    plot(x,f2,'Color',Colorboi)
end
plot(x,x)
%%
x = (0:0.001:1);
r = 3.83;
f3 = funccomp(@popgrowth,x,r,3);
plot(x,f3,x,x)
%%