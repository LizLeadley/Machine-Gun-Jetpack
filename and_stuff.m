function [TimeBlob, AllvarsBlob] = and_stuff (allvars);

%% Calling ode45

[time, allvars] = ode45 (@rates, [0,42.5], allvars);



%% Unpacking allvars
x = allvars (:, 1);
y = allvars (:, 2);
v_x = allvars (:, 3);
v_y = allvars (:, 4);
mass = allvars (:, 5);

hold on
plot (x/1000, y/1000)
xlabel ('Horizontal Position (meters)')
ylabel ('Vertical Position (meters)')
title ('GSH-3-60 for 55 seconds at 75 bps, loaded with 4250 bullets')

figure
plot (time, v_y)
xlabel ('Time (seconds)')
ylabel ('Vertical Velocity (m/s)')
title ('GSH-3-60 for 10 seconds at 75 bps, loaded with 1000 bullets')


TimeBlob = 0;
AllvarsBlob = 0;
end