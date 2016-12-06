% clear all, clf
num_bullets = [1000:100:8000];

for i = 1:length(num_bullets)
    current_bullets = num_bullets(i);
    [~, ~, max_height, flag] = varg(current_bullets);

    flag_list(i) = flag;
    height_list (i) = max_height;
end

hold on
% plot (num_bullets, flag_list*3000, 'r.')
disp ('6000 bullets and more, it goes negative')
plot (num_bullets, height_list, 'b', 'LineWidth', 1.5)
line ([6000, 6000], [ylim])

axis ([1000 8000 1000 3500]) 
xlabel ('Number of Bullets')
ylabel ('Maximum Vertical Position (meters)')
title ('Maximum Height vs Number of Bullets Loaded')