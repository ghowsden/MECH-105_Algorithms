function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)

if length(x) ~= length(y)
    error('x and y vectors not same length')
end

if ~issorted(y)
    [y, sortOrder] = sort(y);
    x = x(sortOrder);
end


Q1 = floor(length(y)/4);
Q3 = floor(3*length(y)/4);
IQR = y(Q3) - y(Q1);


lowerBound = y(Q1) - 1.5*IQR;
upperBound = y(Q3) + 1.5*IQR;
outliers = (y < lowerBound) | (y > upperBound);


fX = x(~outliers);
fY = y(~outliers);


slope = sum((fX - mean(fX)).*(fY - mean(fY))) / sum((fX - mean(fX)).^2);
intercept = mean(fY) - slope*mean(fX);


yhat = slope*fX + intercept;
SSres = sum((fY - yhat).^2);
SStot = sum((fY - mean(fY)).^2);
Rsquared = 1 - SSres/SStot;
end