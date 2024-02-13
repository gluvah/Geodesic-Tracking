%% Initial positions and velocities of tetrahedron vertices
t = sqrt(3)/2;
q = sqrt(6)/2;
ptx = [1, 1, -1];    % x-coordinates of first three vertices
pty = [1, -1, 1];      % y-coordinates of first three vertices
ptz = [1, -1, -1];      % z-coordinates of first three vertices

% Calculate position of the fourth vertex
ptx(4) = -sum(ptx(1:3));
pty(4) = -sum(pty(1:3));
ptz(4) = -sum(ptz(1:3));

% Calculate velocity of the fourth vertex
ptxd = [0, 0, -1];   % x-velocities of vertices
ptyd = [0, -1, 0];   % y-velocities of vertices
ptzd = [-1, 0, 0];   % z-velocities of vertices

ptxd(4) = -sum(ptxd(1:3));
ptyd(4) = -sum(ptyd(1:3));
ptzd(4) = -sum(ptzd(1:3));

% Adjusted initial conditions for four vertices
in = [ptx(1), ptxd(1), pty(1), ptyd(1), ptz(1), ptzd(1), ...
    ptx(2), ptxd(2), pty(2), ptyd(2), ptz(2), ptzd(2), ...
    ptx(3), ptxd(3), pty(3), ptyd(3), ptz(3), ptzd(3), ...
    ptx(4), ptxd(4), pty(4), ptyd(4), ptz(4), ptzd(4)];
tspan = linspace(0, 1, 15);
[t, y] = ode89(@theode, tspan, in);

figure(1);
axis equal;
hold on;

for i = 1:numel(t)
    clf; % Clear the figure

    % Calculate position of the fourth vertex
    ptx(4) = -sum(ptx(1:3));
    pty(4) = -sum(pty(1:3));
    ptz(4) = -sum(ptz(1:3));

    % Update the adjusted initial conditions for the fourth vertex
    in(19:24) = [ptx(4), ptxd(4), pty(4), ptyd(4), ptz(4), ptzd(4)];

    % Plot the tetrahedron shape lines
    plot3([ptx, ptx(1)], [pty, pty(1)], [ptz, ptz(1)], 'k-', 'LineWidth', 2); % First edge
    hold on;
    plot3([ptx(1), ptx(2)], [pty(1), pty(2)], [ptz(1), ptz(2)], 'k-', 'LineWidth', 2); % Second edge
    plot3([ptx(2), ptx(3)], [pty(2), pty(3)], [ptz(2), ptz(3)], 'k-', 'LineWidth', 2); % Third edge
    plot3([ptx(3), ptx(1)], [pty(3), pty(1)], [ptz(3), ptz(1)], 'k-', 'LineWidth', 2); % Fourth edge

    % Additional lines connecting the vertices
    plot3([ptx(1), ptx(4)], [pty(1), pty(4)], [ptz(1), ptz(4)], 'k-', 'LineWidth', 2); % Fifth edge
    plot3([ptx(2), ptx(4)], [pty(2), pty(4)], [ptz(2), ptz(4)], 'k-', 'LineWidth', 2); % Sixth edge

    % Plot the trajectory lines for each vertex
    plot3(y(:, 1), y(:, 3), y(:, 5), '-.','Color',[0.4, 0.4, 0.4],'LineWidth', 1.5); % First vertex
    plot3(y(:, 7), y(:, 9), y(:, 11), 'b-.', 'LineWidth', 1.5); % Second vertex
    plot3(y(:, 13), y(:, 15), y(:, 17), 'm-.', 'LineWidth', 1.5); % Third vertex
    plot3(y(:, 19), y(:, 21), y(:, 23), 'c-.', 'LineWidth', 1.5); % Fourth vertex

    % Plot the current shape lines connecting the vertices
    plot3([y(i, 1), y(i, 7)], [y(i, 3), y(i, 9)], [y(i, 5), y(i, 11)], 'Color', [1, 0.5, 0.5], 'LineWidth', 1.5); % First edge
    plot3([y(i, 7), y(i, 13)], [y(i, 9), y(i, 15)], [y(i, 11), y(i, 17)], 'Color', [1, 0.5, 0.5], 'LineWidth', 1.5); % Second edge
    plot3([y(i, 13), y(i, 19)], [y(i, 15), y(i, 21)], [y(i, 17), y(i, 23)], 'Color', [1, 0.5, 0.5], 'LineWidth', 1.5); % Third edge
    plot3([y(i, 19), y(i, 1)], [y(i, 21), y(i, 3)], [y(i, 23), y(i, 5)], 'Color', [1, 0.5, 0.5], 'LineWidth', 1.5); % Fourth edge
    plot3([y(i, 13), y(i, 1)], [y(i, 15), y(i, 3)], [y(i, 17), y(i, 5)], 'Color', [1, 0.5, 0.5], 'LineWidth', 1.5); % Fifth edge
    plot3([y(i, 7), y(i, 19)], [y(i, 9), y(i, 21)], [y(i, 11), y(i, 23)], 'Color', [1, 0.5, 0.5], 'LineWidth', 1.5); % Sixth edge

    axis([-3 3 -3 3 -3 3]); % Set the axis limits
    view(3); % Set 3D view
    drawnow;
    pause(0.01); % Pause for smoother animation

    disp(volume(y(i, :)));
end

function out = theode(t, in)
% Define the ODE system
out = zeros(24, 1);

% Extract positions and velocities for each vertex
x1 = in(1);
xd1 = in(2);
y1 = in(3);
yd1 = in(4);
z1 = in(5);
zd1 = in(6);

x2 = in(7);
xd2 = in(8);
y2 = in(9);
yd2 = in(10);
z2 = in(11);
zd2 = in(12);

x3 = in(13);
xd3 = in(14);
y3 = in(15);
yd3 = in(16);
z3 = in(17);
zd3 = in(18);

x4 = in(19);
xd4 = in(20);
y4 = in(21);
yd4 = in(22);
z4 = in(23);
zd4 = in(24);

% Define the velocities
out(1) = xd1;
out(2) = 0;
out(3) = yd1;
out(4) = 0;
out(5) = zd1;
out(6) = 0;

out(7) = xd2;
out(8) = 0;
out(9) = yd2;
out(10) = 0;
out(11) = zd2;
out(12) = 0;

out(13) = xd3;
out(14) = 0;
out(15) = yd3;
out(16) = 0;
out(17) = zd3;
out(18) = 0;

out(19) = xd4;
out(20) = 0;
out(21) = yd4;
out(22) = 0;
out(23) = zd4;
out(24) = 0;
end


