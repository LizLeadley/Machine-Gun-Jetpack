function [TimeBlob, AllvarsBlob] = and_stuff (allvars);

%% Calling ode45

[time, allvars] = ode45 (@rates, [0, 10], allvars);


%% Unpacking allvars
x = allvars (:, 1);
y = allvars (:, 2);
v_x = allvars (:, 3);
v_y = allvars (:, 4);
mass = allvars (:, 5);


plot (x, y)
xlabel ('Horizontal Position (meters)')
ylabel ('Vertical Position (meters)')
title ('GSH-3-60 for 10 seconds at 75 bps, loaded with 1000 bullets')

figure
plot (time, y)
xlabel ('Time (seconds)')
ylabel ('Vertical Position (meters)')
title ('GSH-3-60 for 10 seconds at 75 bps, loaded with 1000 bullets')


TimeBlob = 0;
AllvarsBlob = 0;
end