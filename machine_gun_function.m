function res = machine_gun_function(~,conditions)

%constants
%mass = 149; %kg
gravity = 9.8; %m/s^2

%unpack initial conditions
y = conditions(1);
v_y = conditions(2);

%flow functions
a_y = -gravity;

res = [v_y;a_y];

