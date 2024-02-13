% Parameters for 3-gon
t = sqrt(3)/2;
ptx_3gon = [-1/2, -1/2, 1];
pty_3gon = [t, -t, 0];
ptxd_3gon = [t, -t, 0];
ptyd_3gon = [1/2, 1/2, -1];

% Initial conditions for 3-gon
in_3gon = [ptx_3gon(1), ptxd_3gon(1), pty_3gon(1), ptyd_3gon(1), ptx_3gon(2), ptxd_3gon(2), pty_3gon(2), ptyd_3gon(2), ...
    ptx_3gon(3), ptxd_3gon(3), pty_3gon(3), ptyd_3gon(3)];

% Parameters for 4-gon
ptx_4gon = [-1/2, -1/2, 1, 1];
pty_4gon = [t, -t, 0, 0];
ptxd_4gon = [t, -t, 0, 0];
ptyd_4gon = [1/2, 1/2, -1, -1];

% Initial conditions for 4-gon
in_4gon = [ptx_4gon(1), ptxd_4gon(1), pty_4gon(1), ptyd_4gon(1), ptx_4gon(2), ptxd_4gon(2), pty_4gon(2), ptyd_4gon(2), ...
    ptx_4gon(3), ptxd_4gon(3), pty_4gon(3), ptyd_4gon(3), ptx_4gon(4), ptxd_4gon(4), pty_4gon(4), ptyd_4gon(4)];

% Solve ODE for 3-gon
[t, y_3gon] = ode45(@theode3, [0, 1], in_3gon);

% Solve ODE for 4-gon
[t_4gon, y_4gon] = ode45(@theode4, [0, 1], in_4gon);

figure(1);
axis equal;
hold on;

% Animation for 3-gon and 4-gon
for i = 1:numel(t)
    clf; % Clear the figure
    plot([ptx_3gon, ptx_3gon(1)], [pty_3gon, pty_3gon(1)], 'k-', 'LineWidth', 2); % Thick initial shape line for 3-gon
    hold on;
    plot([ptx_4gon, ptx_4gon(1)], [pty_4gon, pty_4gon(1)], 'k-', 'LineWidth', 2); % Thick initial shape line for 4-gon
    plot(y_3gon(:, 1), y_3gon(:, 3), '-.','Color',[0.4, 0.4, 0.4],'LineWidth', 1.5); % Thick x-y trajectory line for 3-gon
    plot(y_3gon(:, 5), y_3gon(:, 7), 'b-.', 'LineWidth', 1.5); % Thick line for second vertex of 3-gon
    plot(y_3gon(:, 9), y_3gon(:, 11), 'm-.', 'LineWidth', 1.5); % Thick line for third vertex of 3-gon
    plot(y_4gon(:, 1), y_4gon(:, 3), '-.','Color',[0.4, 0.4, 0.4],'LineWidth', 1.5); % Thick x-y trajectory line for 4-gon
    plot(y_4gon(:, 5), y_4gon(:, 7), 'b-.', 'LineWidth', 1.5); % Thick line for second vertex of 4-gon
    plot(y_4gon(:, 9), y_4gon(:, 11), 'm-.', 'LineWidth', 1.5); % Thick line for third vertex of 4-gon
    plot(y_4gon(:, 13), y_4gon(:, 15), 'c-.', 'LineWidth', 1.5); % Thick line for fourth vertex of 4-gon
    plot([y_3gon(i, 1:4:9), y_3gon(i, 1)], [y_3gon(i, 3:4:11), y_3gon(i, 3)], '-','Color', [1, 0.5, 0.5], 'LineWidth', 1.5); % Thick current shape line for 3-gon
    plot([y_4gon(i, 1:4:13), y_4gon(i, 1)], [y_4gon(i, 3:4:15), y_4gon(i, 3)], '-','Color', [0.5, 0.5, 1], 'LineWidth', 1.5); % Thick current shape line for 4-gon
    hold off;
    axis([-2 2 -2 2]); % Set the axis limits
    drawnow;
    pause(0.01); % Pause for smoother animation
    disp(area3(y_3gon(i, :))); % Display area of 3-gon
    disp(area4(y_4gon(i, :))); % Display area of 4-gon
end
