function [I] = Simpson(x, y)

if length(x) ~= length(y)
    error('The inputs x and y must be of the same length.')
end

dx = diff(x);
if ~all(abs(dx - dx(1)) < 1e-9)
    error('The input x must be equally spaced.')
end

if length(x) == 2
    warning('The trapezoidal rule will be used.')
    I = (x(2) - x(1)) * (y(1) + y(2)) / 2;
else
   
    if mod(length(x), 2) == 0
        warning('The trapezoidal rule will be used for the last interval.')
    end

    
    n = length(x) - 1;
    h = dx(1);
    I = y(1) + y(end) + 4 * sum(y(2:2:n)) + 2 * sum(y(3:2:n-1));
    I = I * h / 3;

   
    if mod(length(x), 2) == 0
        I = I - (y(end-1) - y(end)) * (x(end) - x(end-1)) / 2;
    end
end
end