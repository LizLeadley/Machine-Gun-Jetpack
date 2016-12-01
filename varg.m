%% Setting up variables for allvars

x = 0;
y = 0;
v_x = 0;
v_y = 0;

mass_gun = 149; %kg, GSH-3-60
bullet_mass = .390; %kg, GSH-3-60
casing_mass = .442; %kg, GSH-3-60
bullet_number_loaded = 1000;
mass = mass_gun + ((bullet_mass + casing_mass)*bullet_number_loaded);


firing_rate = 75; %bullets per second
muzzle_velocity = -845; %m/s, GSH-3-60
theta = 45; %degrees from ground

%% Packing allvars
allvars = [x, y, v_x, v_y, mass, firing_rate, bullet_mass, casing_mass, muzzle_velocity, theta];
% allvars (:, 1) = x;
% allvars (:, 2) = y;
% allvars (:, 3) = v_x;
% allvars (:, 4) = v_y;
% allvars (:, 5) = mass;
% 
% allvars (:, 6) = firing_rate; %bullets per second
% allvars (:, 7) = bullet_mass;
% allvars (:, 8) = casing_mass;
% allvars (:, 9) = muzzle_velocity;
% allvars (:, 10) = theta;


%% Call and_stuff

[TimeBlobs, AllvarsBlobs] = and_stuff(allvars);


%% Unpacking allvars
x = allvars (:, 1);
y = allvars (:, 2);
v_x = allvars (:, 3);
v_y = allvars (:, 4);
mass = allvars (:, 5);

firing_rate = allvars (:, 6); %bullets per second
bullet_mass = allvars (:, 7);
casing_mass = allvars (:, 8);
muzzle_velocity = allvars (:, 9);
theta = allvars (:, 10);
