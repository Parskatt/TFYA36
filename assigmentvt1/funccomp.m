function [x] = funccomp(F, x,r, order)
% Composes an expression with order with a vector
    for k = 1:order
        x = feval(F,x,r);
    end
end

