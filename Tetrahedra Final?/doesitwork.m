t = sqrt(3)/2;
% Initial Positions
A1 = [1,1,1];
A2 = [1,-1,-1];
A3 = [-1,1,-1];

% Initial Velocities

V1 = [0,0,1];
V2 = [0,-1,0];
V3 = [-1,0,0];

% Setting up Variables
x1 = A1(1);
y1 = A1(2);
z1 = A1(3);

x2 = A2(1);
y2 = A2(2);
z2 = A2(3);

x3 = A3(1);
y3 = A3(2);
z3 = A3(3);

Vnot = [V1,V2,V3];

denom = (2/3)*[(y2*z3 - y3*z2) ...
    , (x3*z2 - x2*z3) ...
    , (x2*y3 - x3*y2) ...
    , (y3*z1 - y1*z3) ...
    , (x1*z3 - x3*z1) ...
    , (x3*y1 - x1*y3) ...
    , (y1*z2 - y2*z1) ...
    , (x2*z1 - x1*z2) ...
    , (x1*y2 - x2*y1)];
eta = sum(dot(Vnot, denom));
beta = sum((norm(denom))^2);
jeta = eta/beta;
geta = jeta .* denom;
feta = Vnot - geta;

if eta ~= 0
    disp('Try These Instead');
    disp(['V1: ', num2str(feta(1:3))]);
    disp(['V2: ', num2str(feta(4:6))]);
    disp(['V3: ', num2str(feta(7:9))]);
else
    disp('You Got It!');
end
