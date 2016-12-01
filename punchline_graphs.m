%% Setting up variables for allvars

x = 
y = 
v_x = 
v_y = 
mass = 
firing_rate = 
bullet_mass = 
casing_mass = 
muzzle_velocity = 
theta = 

%% Packing allvars
allvars (:, 1) = x;
allvars (:, 2) = y;
allvars (:, 3) = v_x;
allvars (:, 4) = v_y;
allvars (:, 5) = mass;

allvars (:, 6) = firing_rate; %bullets per second
allvars (:, 7) = bullet_mass;
allvars (:, 8) = casing_mass;
allvars (:, 9) = muzzle_velocity;
allvars (:, 10) = theta;


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
