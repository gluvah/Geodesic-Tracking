function dydx = theode(~, y)
    G = 0.5 * Gamma(y);
    dydx = [
        y(2); G * (y(9)*y(17) - y(15)*y(11));
        y(4); G * (y(13)*y(11) - y(7)*y(17));
        y(6); G * (y(7)*y(15) - y(13)*y(9));
        y(8); G * (y(15)*y(5) - y(3)*y(17));
        y(10); G * (y(1)*y(17) - y(13)*y(5));
        y(12); G * (y(13)*y(3) - y(1)*y(15));
        y(14); G * (y(3)*y(11) - y(9)*y(5));
        y(16); G * (y(7)*y(5) - y(1)*y(11));
        y(18); G * (y(1)*y(9) - y(7)*y(3));
        % Calculations for the x and y components of velocity for the fourth vertex
        
    ];
end
