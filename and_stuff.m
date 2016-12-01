function [TimeBlob, AllvarsBlob] = and_stuff (allvars);

%% Calling ode45

[time, allvars] = ode45 (@rates, [0, 10], allvars);


%% Unpacking allvars
x = allvars (:, 1);
y = allvars (:, 2);
v_x = allvars (:, 3);
v_y = allvars (:, 4);
mass = allvars (:, 5);

disp(x)
disp(y)
plot (x, y)


TimeBlob = 0
AllvarsBlob = 0
end