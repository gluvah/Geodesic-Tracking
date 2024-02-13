t=sqrt(3)/2;
ptx=[-1/2,-1/2,1]; 
pty=[t,-t,0];
ptxd=[(2*pi*t)/3,(-2*pi*t)/3,0]; 
ptyd=[pi/3,pi/3,(-2*pi)/3];

in = [ptx(1), ptxd(1), pty(1), ptyd(1), ptx(2), ptxd(2), pty(2), ptyd(2), ...
    ptx(3), ptxd(3), pty(3), ptyd(3)];
tspan = linspace(0, 1, 56);
[t, y] = ode45(@theode, tspan, in);
positions = y(:, 1:2:end);

formatted_positions = arrayfun(@(i) sprintf('[%f, %f,1]', positions(i, :)), 1:size(positions, 1), 'UniformOutput', false);
formatted_positions = reshape(formatted_positions,[], 1);
formatted_positions = regexprep(formatted_positions, '(\])\s*(\[)', '$1, $2');
formatted_positions = strcat('[', formatted_positions, '],');

figure(1);
axis equal;
hold on;

for i = 1:numel(t)
    % Clear the figure
    clf;
    plot([ptx, ptx(1)], [pty, pty(1)], 'k-', 'LineWidth', 1.5);
    hold on;
    plot(y(:, 1), y(:, 3), '-.', 'Color', [0.4, 0.4, 0.4], 'LineWidth', 1.5);
    plot(y(:, 5), y(:, 7), 'b-.', 'LineWidth', 1.5);
    plot(y(:, 9), y(:, 11), 'm-.', 'LineWidth', 1.5);
    plot([y(i, 1:4:9), y(i, 1)], [y(i, 3:4:11), y(i, 3)], '-', 'Color', [1, 0.5, 0.5], 'LineWidth', 1.5);
    hold off;
    axis([-3 3 -3 3]);
    drawnow;
    pause(0.01);
    disp(area(y(i, :)));
end

[n, ~] = size(y);
%for i = 1:n
    %disp(area(y(i, :)));
%end

% Display formatted positions as a matrix
disp(reshape(formatted_positions,[], 1));
