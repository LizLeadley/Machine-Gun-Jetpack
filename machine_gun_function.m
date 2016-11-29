function res = machine_gun_function(~,conditions)

%constants
mass = 149; %kg
gravity = 9.8; %m/s^2

drag_coeff = 0.47;
radius = 1.5; %m
area = pi * radius^2;
air_density = 1.225; %kg/m^3

%unpack initial conditions
y = conditions(1);
v_y = conditions(2);

%flow functions
a_y = ((-mass * gravity) - (0.5 * drag_coeff * area * air_density))/mass;
%a_y = -gravity;

res = [v_y;a_y];

