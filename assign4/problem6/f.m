function [ f_theta ] = f(theta)
    %f Multiplies the angle theta with A if theta < pi/2 else A(pi-theta)
    %   theta: either scalar or an array of values
    global A;

    %Make data conform to f(theta + 2*pi) = f(theta)
    too_small = theta<-pi/2;
    too_big = theta > 3*pi/2;
    theta(too_small) = theta(too_small)+2*pi;
    theta(too_big) = theta(too_big)-2*pi;

    %Calculate for the 2 different cases
    lows = theta < pi/2;
    highs = theta >= pi/2;
    f_theta(lows) = A*theta(lows);
    f_theta(highs) = A*(pi - theta(highs));
end

