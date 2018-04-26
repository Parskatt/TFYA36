function [x_new,y_new] = mapxy(x,y)
%MAPXY maps x_n,y_n -> x_n+1,y_n+1 according to map defined here https://www.ifm.liu.se/courses/tfya36/kaos18inl4.pdf
%   The map uses global variables alpha and b because im lazy
global alpha;
global b;
y_new = mod(3*x+2*y.^alpha,1);
x_new = mod(y_new -b*(x+y),1);

end

