function varargout = ellipse2(d,a,b,N)
%ARGUEMENTS
%d : Distance from source to target to radar (calculated from time
%    difference)
%a : Distance from radar to source in x-axis
%b : Distance from radar to source in y-axis
%N : Number of point to do calulation with (will return double for top and
%bottom)
%
%VARIABLES
%r : Distance from target to radar
%theta : Angle from x-axis to target calculated from radar

%d=4; a=1; b=1;
if nargin < 4
    N = 1000;
end

l = hypot(a,b);

rmin = (d - l)/2;
rmax = (d + l)/2;
r = linspace(rmin,rmax,N);

phi1 = atan(b/a);
phi2 = acos((l^2+2*d*r-d^2)./(2*l*r));
theta1 = phi1 + phi2;
theta2 = phi1 - phi2;

x1 = r.*cos(theta1);
y1 = r.*sin(theta1);
x2 = r.*cos(theta2);
y2 = r.*sin(theta2);

varargout{1} = [x1,x2];
varargout{2} = [y1,y2];

figure;
plot(x1,y1,x2,y2,'b'); axis equal; hold on;
plot(0,0,'rs','LineWidth',5);
plot(a,b,'gs','LineWidth',5);
