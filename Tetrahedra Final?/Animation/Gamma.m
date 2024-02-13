function res = Gamma(y)
    % Function to calculate the function Gamma for a tetrahedron
    num = y(1)*y(10)*y(18) + y(2)*y(9)*y(18) + y(2)*y(10)*y(17)...
        + y(7)*y(16)*y(6) + y(8)*y(15)*y(6) + y(8)*y(16)*y(5)...
        + y(13)*y(4)*y(12) + y(14)*y(3)*y(12) + y(14)*y(4)*y(11)...
        - y(1)*y(16)*y(12) - y(2)*y(15)*y(12) - y(2)*y(16)*y(11)...
        - y(7)*y(4)*y(18) - y(8)*y(3)*y(18) - y(8)*y(4)*y(17)...
        - y(13)*y(10)*y(6) - y(14)*y(9)*y(6) - y(14)*y(10)*y(5);

    denom = (y(9)*y(17) - y(15)*y(11))^2 ... 
            + (y(13)*y(11) - y(7)*y(17))^2 ... 
            + (y(7)*y(15) - y(13)*y(9))^2 ...
            + (y(15)*y(5) - y(3)*y(17))^2 ...
            + (y(1)*y(17) - y(13)*y(5))^2 ...
            + (y(13)*y(3) - y(1)*y(15))^2 ...
            + (y(3)*y(11) - y(9)*y(5))^2 ...
            + (y(7)*y(5) - y(1)*y(11))^2 ...
            + (y(1)*y(9) - y(7)*y(3))^2;
    res = 4 * num / denom;
end
