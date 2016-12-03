%{
Header comments
%}

% HaddockSuck = 0;

sides = 3;
 t = (1/(2*sides):1/(sides):1)*2*pi-pi/3;
 b = 3;
 x = b*sin(t)+5/8*xmax;
 y = b*cos(t)+3/4*ymax;
 fill(x,y,'black');