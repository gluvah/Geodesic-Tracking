%ptx and pty are the x- and y-components of the initial condition
%ptxd and ptyd are the x- and y-components of the initial velocity
t= sqrt(3)/2;
ptx=[-1/2,-1/2,-1/2,1]; 
pty=[t,0,-t,0];

%%Rotation
%ptxd = [3.14159*2, 3.14159*2, -3.14159*2, -3.14159*2];
%ptyd = [-3.14159*2, 3.14159*2, 3.14159*2, -3.14159*2];

ptxd=[(2*pi*t)/3,0,(-2*pi*t)/3,0]; 
ptyd=[pi/3,pi/3,4*pi/3,(-2*pi)/3];

in = [ptx(1), ptxd(1), pty(1), ptyd(1), ptx(2), ptxd(2), pty(2), ptyd(2), ...
    ptx(3), ptxd(3), pty(3), ptyd(3), ptx(4), ptxd(4), pty(4), ptyd(4)];
tspan = linspace(0, 1, 56);
[t, y] = ode89(@theode, tspan, in);
positions = y(:, 1:2:end);

formatted_positions = arrayfun(@(i) sprintf('[%f, %f,1]', positions(i, :)), 1:size(positions, 1), 'UniformOutput', false);
formatted_positions = reshape(formatted_positions,[], 1);
formatted_positions = regexprep(formatted_positions, '(\])\s*(\[)', '$1, $2');
formatted_positions = strcat('[', formatted_positions, '],');
figure(1);
axis equal;
hold on;

for i = 1:numel(t)
    clf; % Clear the figure
    plot([ptx, ptx(1)], [pty, pty(1)], 'k-', 'LineWidth', 2); % Thick initial shape line
    hold on;
    plot(y(:, 1), y(:, 3), '-.','Color',[0.4, 0.4, 0.4],'LineWidth', 1.5); % Thick x-y trajectory line
    plot(y(:, 5), y(:, 7), 'b-.', 'LineWidth', 1.5); % Thick line for second vertex
    plot(y(:, 9), y(:, 11), 'm-.', 'LineWidth', 1.5); % Thick line for third vertex
    plot(y(:, 13), y(:, 15), 'c-.', 'LineWidth', 1.5); % Thick line for fourth vertex
    plot([y(i, 1:4:13), y(i, 1)], [y(i, 3:4:15), y(i, 3)], '-','Color', [1, 0.5, 0.5], 'LineWidth', 1.5); % Thick current shape line
    hold off;
    axis([-3 3 -3 3]); % Set the axis limits
    drawnow;
    pause(0.1); % Pause for smoother animation
    disp(area(y(i, :)));
end
[n, ~] = size(y);
disp(reshape(formatted_positions,[], 1));