function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

iter = 0;
ea = 100;
root = xl;
if nargin < 3;
    error('not enough inputs')
end
if nargin == 3;
es = .0001;
maxit = 200;
end
while ea > es;
    fl = func(xl);
    fu = func(xu);
    rooti = root;
    funcrooti = func(rooti);
    root = xu - ((fu * (xl - xu)) / (fl - fu));
    funcroot = func(root);
    ea = abs((root - rooti) / rooti) * 100;
    if fu * funcroot < 0;
        xl = root;
        fl = funcroot;
    else
        xu = root;
        fu = funcroot;
    end
        iter = iter + 1;
end
fx = func(root)
iter = iter - 1
end