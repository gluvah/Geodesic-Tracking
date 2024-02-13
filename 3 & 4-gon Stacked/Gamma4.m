function res = Gamma4(y)
% Function to calculate the function Gamma 
num = y(2)*y(8) - y(6)*y(4) + y(6)*y(12)  ...
- y(10)*y(8) + y(10)*y(16) - y(14)*y(12) ...
+ y(14)*y(4) - y(2)*y(16);
denom = (y(7)-y(15))^2 + (y(5)-y(13))^2 + (y(11)-y(3))^2 ...
    + (y(9)-y(1))^2 + (y(15)-y(7))^2 + (y(13)-y(5))^2 + (y(3)-y(11))^2 + (y(1)-y(9))^2;
res = 4*num/denom;

%disp(res);