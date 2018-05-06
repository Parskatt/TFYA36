function [x_new,y_new] = arnold(x,y)
%Arnolds catmap;
y_new = mod(x+y,1);
x_new = mod(x+2*y,1);
end

