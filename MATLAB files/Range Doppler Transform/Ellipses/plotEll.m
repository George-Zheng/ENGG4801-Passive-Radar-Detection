function [h] = plotEll(Qparam)
%Plots an ellipse on the current graph based on the ellipse parameters
%Returns a handle to the last plot

%Get components
qxx = Qparam(1);
qyy = Qparam(2);
qxy = Qparam(3);
qx = Qparam(4);
qy = Qparam(5);
q0 = Qparam(6);

x = -10000:10000;

A = qyy;
B = qxy.*x + qy;
C = qxx.*x.^2 + qx.*x + q0;

y1 = (-B+sqrt(B.^2 - 4.*A.*C)) / (2*A);
y2 = (-B-sqrt(B.^2 - 4.*A.*C)) / (2*A);

id1 = imag(y1)==0;
id2 = imag(y2)==0;

x1 = x(id1); y11 = y1(id1);
plot(x1,y11);
hold on;
h = plot([x1(1),x(id2),x1(end)],[y11(1),y2(id2),y11(end)]);
axis equal
