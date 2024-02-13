% Coordinates of the vertices
a1 = [0, 1];
a2 = [1, 0];
a3 = [-1, 1];

% Velocity values for a1-a4
Va1 = [0.5, 1.750];
Va2 = [0.75, 0];
Va3 = [-1.25, 0.25];
Eta = [Va1, Va2, Va3];

% Calculation of vectors p, o, u, and y
p = a3 - a2;
o = a1 - a3;
u = a2 - a1;

% Convert p, o, u, and y to complex numbers
p_complexity = complex(p(1), p(2));
o_complexity = complex(o(1), o(2));
u_complexity = complex(u(1), u(2));

% Multiply by (i/2)
p_complex = (i/2) * p_complexity;
o_complex = (i/2) * o_complexity;
u_complex = (i/2) * u_complexity;


% Convert back to real numbers (x and y components)
p_realistically = [real(p_complex), imag(p_complex)];
o_realistically = [real(o_complex), imag(o_complex)];
u_realistically = [real(u_complex), imag(u_complex)];

% Agammaquad code
q = p_realistically(1);
w = p_realistically(2);
e = o_realistically(1);
r = o_realistically(2);
t = u_realistically(1);
y = u_realistically(2);

Agamma = [q, w, e, r, t, y];

% Rest of the doesitworkquadmod code
take2 = Agamma .* Eta;
ohyeah = sum(take2);
zeta = sum(Eta .* Agamma);
theta = sum(Agamma .* Agamma);
beta = zeta / theta;
lambda = beta .* Agamma;
Projection = Eta - lambda;

if ohyeah == 0
    disp('Oh yeah!!!');
else
    disp('Try This Instead:');
    labels = {'V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7', 'V8'};
    for i = 1:numel(Projection)
        formatSpec = sprintf('%%-10s  %%.%df\n', 3);
        fprintf(formatSpec, labels{i}, Projection(i));
    end
end
