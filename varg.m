function [TimeBlob, AllvarsBlob, max_height, flag] = varg(bullet_number_loaded)
%% Setting up variables for allvars

x = 0;
y = 0;
v_x = 0;
v_y = 0;

mass_gun = 149; %kg, GSH-3-60
bullet_mass = .390; %kg, GSH-3-60
casing_mass = .442; %kg, GSH-3-60
% bullet_number_loaded = 4250;
mass = mass_gun + ((bullet_mass + casing_mass)*bullet_number_loaded);


firing_rate = 100; %bullets per second
muzzle_velocity = -845; %m/s, GSH-3-60
theta = 45; %degrees from ground

thrust_on = 1;


%% Packing allvars
allvars = [x, y, v_x, v_y, mass, firing_rate, bullet_mass, casing_mass, muzzle_velocity, theta, thrust_on];


%% Call and_stuff
bullet_time = bullet_number_loaded/firing_rate;
[TimeBlob, AllvarsBlob] = and_stuff(allvars,bullet_time);


%% Unpacking allvars
x = AllvarsBlob (:, 1);
y = AllvarsBlob (:, 2);
v_x = AllvarsBlob (:, 3);
v_y = AllvarsBlob (:, 4);
mass = AllvarsBlob (:, 5);

firing_rate = AllvarsBlob (:, 6); %bullets per second
bullet_mass = AllvarsBlob (:, 7);
casing_mass = AllvarsBlob (:, 8);
muzzle_velocity = AllvarsBlob (:, 9);
theta = AllvarsBlob (:, 10);
thrust_on = AllvarsBlob (:, 11);

max_height = max(y);

if y(10) <0
    flag = 1;
else
    flag = 0;
end

end