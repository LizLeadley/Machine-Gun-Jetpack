function [T,S] = machine_gun(speed)

%limits
%Muzzle velocity
v_muzzle = -845; %m/s

%Initial mass of gun alone
mass = 149; %kg

%Mass of bullet
mass_bullet = .390; %kg


%Load 50 bullets worth of mass
mass = mass + (50*mass_bullet);


%initial position
y = 0;
Timee(1) = 0;
Y_pos(1) = y;
%speed into initial velocity
v_y = speed;
  
options = odeset('Events', @peak_reached, 'RelTol', 1e-4);

hold on
for i = 0:50
% %Velocity of gun after thrust’s effect
% v_y = (-mass_bullet*v_muzzle)/(mass);
% %Remove mass of one bullet from mass of gun
% mass = mass - mass_bullet;

[T,S] = ode45(@machine_gun_function, [0,20], [y,v_y],options);

Y = S(:,1);

Tend = T(end);
Timee = [Timee; T+(Tend*i)];
Y_pos = [Y_pos;Y];

% plot(T,Y);
y = Y(end);
end

plot(Timee,Y_pos);

    function [value, isterminal, direction] = peak_reached(~,W)
        v_y_current = W(2);
        value = v_y_current;
        isterminal = 1;
        direction = 0;
    end
end