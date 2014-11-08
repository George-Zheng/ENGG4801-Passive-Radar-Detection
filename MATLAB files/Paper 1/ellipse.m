a = 1;
d = 5;
rlow = (d - a)/2;
rhigh = (d + a)/2;
r = rlow:0.001:rhigh;

x = (a^2 - d^2 + 2*r*d)/(2*a);
y = r.*(1 - (a^2 - d^2 + 2*r*d).^2./(4*a^2*r.^2)).^(1/2);

figure; axis equal;
plot(x,y)