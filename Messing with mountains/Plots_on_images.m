% replace with an image of your choice
img = imread('try_1.png');  %CHANGE THIS TO MATCH
 
% set the range of the axes
% The image will be stretched to this.
min_x = 0;
max_x = 6;
min_y = 0;
max_y = 4.5;  %CHANGE THIS TO MATCH
 
% make data to plot - just a line.
x = min_x:max_x;
y = (6/8)*x;

figure;
imagesc(img);
xlabel('Raster Column');
ylabel('Raster Row');
colormap(gray);

% Flip the image upside down before showing it
imagesc([min_x max_x], [min_y max_y], flipud(img));
 
% NOTE: if your image is RGB, you should use flipdim(img, 1) instead of flipud.
 
hold on;
varg;
 
% set the y-axis back to normal.
set(gca,'ydir','normal');