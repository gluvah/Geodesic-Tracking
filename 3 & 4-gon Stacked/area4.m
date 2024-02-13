function res = area4(y)
    % Function to calculate the signed area of a quadrilateral

    % Calculate the signed area using the shoelace formula
    res = 0.5 * (y(1)*y(7) - y(5)*y(3) + y(5)*y(11) - y(9)*y(7) ...
         + y(9)*y(15) - y(13)*y(11) + y(13)*y(3) - y(1)*y(15));

 
end
