function [TimeBlob, AllvarsBlob] = and_stuff (allvars)

%% Calling ode45

[time, allvars] = ode45 (@rates, [0,42], allvars);


%% Unpacking allvars
x = allvars (:, 1);
y = allvars (:, 2);
v_x = allvars (:, 3);
v_y = allvars (:, 4);
mass = allvars (:, 5);

% hold on
% plot (x/1000, y/1000)
% xlabel ('Horizontal Position (meters)')
% ylabel ('Vertical Position (meters)')
% title ('GSH-3-60 for 55 seconds at 75 bps, loaded with 4250 bullets')
% 
% figure
% plot (time, v_y)
% xlabel ('Time (seconds)')
% ylabel ('Vertical Velocity (m/s)')
% title ('GSH-3-60 for 10 seconds at 75 bps, loaded with 1000 bullets')

%% Trying to add the falling

allvars_falling = allvars(end, :);
allvars_falling(:,11) = 0;

[time_falling, allvars_falling] = ode45 (@rates, [0, 9], allvars_falling);

x_falling = allvars_falling(:, 1);
y_falling = allvars_falling(:, 2);
% v_x = allvars (:, 3);
% v_y = allvars (:, 4);
% mass = allvars (:, 5);

x = [x; x_falling];
y = [y; y_falling];

plot (x/1000, y/1000)
xlabel ('Horizontal Position (meters)')
ylabel ('Vertical Position (meters)')
title ('GSH-3-60 for 42 seconds at 75 bps, loaded with 4250 bullets, then falling for 9 seconds')

% figure
% plot (time, v_y)
% xlabel ('Time (seconds)')
% ylabel ('Vertical Velocity (m/s)')
% title ('GSH-3-60 for 10 seconds at 75 bps, loaded with 1000 bullets')


TimeBlob = [time; time_falling];
AllvarsBlob = [allvars; allvars_falling];
end