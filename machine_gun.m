function [T,S] = machine_gun(num_bullets, firing_rate)

%% Variables and Conditions

%Muzzle velocity
v_muzzle = -845; %m/s
%Initial mass of gun alone
mass = 149; %kg
%Mass of bullet
mass_bullet = .390; %kg
mass_casing = .442; %kg
mass_btotal = mass_bullet + mass_casing; %kg


%Load 50 bullets worth of mass
mass = mass + (num_bullets*mass_btotal);

%initial position
y = 0;
Timee(1) = 0;
Y_pos(1) = y;

%% ODE45 time, with loop

% options = odeset('Events', @peak_reached, 'RelTol', 1e-4);

hold on
for i = 0:num_bullets
    
%Velocity of gun after thrust’s effect
v_y = (-mass_bullet*v_muzzle)/(mass);
%Remove mass of one bullet from mass of gun
mass = mass - mass_btotal;

% [T,S] = ode45(@machine_gun_function, [0,20], [y,v_y],options);
[T, S] = ode45(@machine_gun_function, [0, 1/firing_rate], [y, v_y]);

Y = S(:,1);

Tend = T(end);
Timee = [Timee; T+(Tend*i)];
Y_pos = [Y_pos;Y];

% plot(T,Y);
y = Y(end);
end

%% Plotting

plot(Timee,Y_pos);
xlabel ('Time (seconds)')
ylabel ('Vertical Height (meters)')
title ('GSH-6-30 Firing Vertically')
legend ('10000 Bullets', '1000 Bullets')

% %% Events Function
%     function [value, isterminal, direction] = peak_reached(~,W)
%         v_y_current = W(2);
%         value = v_y_current;
%         isterminal = 1;
%         direction = 0;
%     end
end