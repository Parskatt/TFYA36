function [x] = popgrowth(x,r)
%Small function calculating return values
    x = x.*r.*(1-x);
end

