function dydx=theode(~,y)
G=0.5*Gamma(y);
dydx=[
    y(2); -G*(y(7)-y(15)); 
    y(4); G*(y(5)-y(13));
    y(6); -G*(y(11)-y(3)); 
    y(8); G*(y(9)-y(1));
    y(10); -G*(y(15)-y(7)); 
    y(12); G*(y(13)-y(5));
    y(14); -G*(y(3)-y(11));
    y(16); G*(y(1)-y(9)) ];
