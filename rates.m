function allchanges = rates (~, allvars)

%% Unpacking allvars
x = allvars (1,:);
y = allvars (2,:);
v_x = allvars (3,:);
v_y = allvars (4,:);
mass = allvars (5,:);

firing_rate = allvars (6,:); %bullets per second
bullet_mass = allvars (7,:);
casing_mass = allvars (8,:);
muzzle_velocity = allvars (9,:);
theta = allvars (10,:);

thrust_on = allvars (11,:);

%% State variables

rho = 1.225; %density of air
coeff_drag = .47; %of spherical objects
area = 1.5^2*pi; %meters^s
theta_rad = deg2rad(theta);


%% Changes

Fdrag_x = -.5*rho*coeff_drag*area*v_x^2; %Newtons
Fdrag_y = -.5*rho*coeff_drag*area*v_y^2; %Newtons
Fgravity = -9.8*mass; %Newtons

if thrust_on == 1
    Fthrust_x = firing_rate*(bullet_mass+casing_mass)*-muzzle_velocity*cos(theta_rad);
    Fthrust_y = firing_rate*(bullet_mass+casing_mass)*-muzzle_velocity*sin(theta_rad);
    dmass = - firing_rate * (bullet_mass + casing_mass);
else
    Fthrust_x = 0;
    Fthrust_y = 0;
    dmass = 0;
end

dx = v_x; %m/s
dy = v_y; %m/s
dv_x = (Fdrag_x + Fthrust_x) / mass; %m/s^2
dv_y = (Fdrag_y + Fgravity + Fthrust_y) / mass; %m/s^2

%% Repacking allchanges

allchanges = [dx; dy; dv_x; dv_y; dmass; 0; 0; 0; 0; 0; 0];

end
