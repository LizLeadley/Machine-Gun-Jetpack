function [TimeBlob, AllvarsBlob] = and_stuff (allvars)

%% Calling ode45
options = odeset('Events',@peaks);
[time, allvars,time_peak,allvars_peak,index_peak] = ode45 (@rates, [0,42], allvars,options);
    function [value,isterminal,direction] = peaks(time,allvars)
        height = allvars(2,:);
        value = [height-1031;height-1344;height-2355;height-2984;height-3020;height-3724;height-3776;...
            height-4023];
        isterminal = [0;0;0;0;0;0;0;0];
        direction = [1;1;1;1;1;1;1;1];
    end



%% Unpacking allvars
x = allvars (:, 1);
y = allvars (:, 2);
v_x = allvars (:, 3);
v_y = allvars (:, 4);
mass = allvars (:, 5);

% hold on
% plot (x/1000, y/1000)
% xlabel ('Horizontal Position (meters)')
% ylabel ('Vertical Position (meters)')
% title ('GSH-3-60 for 55 seconds at 75 bps, loaded with 4250 bullets')

%% Trying to add the falling

allvars_falling = allvars(end, :);
allvars_falling(:,11) = 0;

[time_falling, allvars_falling,time_peak_falling,allvars_peak_falling,index_peak_falling] = ode45 (@rates, [0, 9], allvars_falling,options);

x_falling = allvars_falling(:, 1);
y_falling = allvars_falling(:, 2);
% v_x = allvars (:, 3);
% v_y = allvars (:, 4);
% mass = allvars (:, 5);

x = [x; x_falling];
y = [y; y_falling];
time = [time; time_falling+42];
peak_x = [allvars_peak(:,1)/1000;allvars_peak_falling(:,1)/1000];
peak_y = [allvars_peak(:,2)/1000;allvars_peak_falling(:,2)/1000];


plot (x/1000, y/1000,'LineWidth',1.5)
hold on
for i = 1:length(peak_x)
    line([peak_x(i) peak_x(i)],[0 peak_y(i)],[1 1],'LineStyle','-','LineWidth',1,'Color',[.8 0 0]);
end
xlabel ('Horizontal Position (meters)')
ylabel ('Vertical Position (meters)')
title ('GSH-3-60 Trajectory and Mountain Peaks')


TimeBlob = [time; time_falling];
AllvarsBlob = [allvars; allvars_falling];
end