function out = ellSolver2(Qparam, Rparam)
% ellSolver version 2
%This is the Ellipse solver

qxx = Qparam(1);
qxy = Qparam(2);
qyy = Qparam(3);
qx = Qparam(4);
qy = Qparam(5);
q0 = Qparam(6);

rxx = Rparam(1);
rxy = Rparam(2);
ryy = Rparam(3);
rx = Rparam(4);
ry = Rparam(5);
r0 = Rparam(6);


A4 = (- qxx^2*ryy^2 + qxx*qxy*rxy*ryy + 2*qxx*qyy*rxx*ryy - qxx*qyy*rxy^2 - qxy^2*rxx*ryy + qxy*qyy*rxx*rxy - qyy^2*rxx^2);
A3 = (qx*qxx*rxy*ryy - 2*qy*qyy*rxx^2 - qxy^2*rxx*ry - 2*qxx^2*ry*ryy - qxx*qy*rxy^2 - 2*qx*qxy*rxx*ryy + qx*qyy*rxx*rxy + qxx*qxy*rx*ryy + qxx*qxy*rxy*ry - 2*qxx*qyy*rx*rxy + qxy*qy*rxx*rxy + qxy*qyy*rx*rxx + 2*qxx*qy*rxx*ryy + 2*qxx*qyy*rxx*ry);
A2 = (q0*qxy*rxx*rxy - qy^2*rxx^2 - q0*qxx*rxy^2 - 2*q0*qyy*rxx^2 - qxx*qyy*rx^2 - qxy^2*r0*rxx - 2*qxx^2*r0*ryy - qx^2*rxx*ryy - qxx^2*ry^2 + qxx*qxy*r0*rxy + 2*q0*qxx*rxx*ryy + 2*qxx*qyy*r0*rxx + qx*qxx*rx*ryy + qx*qxx*rxy*ry - 2*qx*qxy*rxx*ry + qx*qy*rxx*rxy + qx*qyy*rx*rxx + qxx*qxy*rx*ry - 2*qxx*qy*rx*rxy + qxy*qy*rx*rxx + 2*qxx*qy*rxx*ry);
A1 = (q0*qx*rxx*rxy - qxx*qy*rx^2 - 2*qxx^2*r0*ry - qx^2*rxx*ry - 2*q0*qy*rxx^2 - 2*q0*qxx*rx*rxy + q0*qxy*rx*rxx + qx*qxx*r0*rxy - 2*qx*qxy*r0*rxx + qxx*qxy*r0*rx + 2*q0*qxx*rxx*ry + 2*qxx*qy*r0*rxx + qx*qxx*rx*ry + qx*qy*rx*rxx);
A0 = - q0^2*rxx^2 + q0*qx*rx*rxx + 2*q0*qxx*r0*rxx - q0*qxx*rx^2 - qx^2*r0*rxx + qx*qxx*r0*rx - qxx^2*r0^2;

yroot = roots([A4,A3,A2,A1,A0]);

xySol = zeros(8,2);

for i=1:4
    y = yroot(i);
    x0 = -(qx + qxy*y + (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx);
    x1 = -(qx + qxy*y - (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx);
    idx = 2*i-1;
    xySol(idx:idx+1,:) = [x0,y; x1,y];
end
    
%Find unique up to 5 digits
n = 10^5;
rounded = floor(xySol*n)/n;
[~,ids,~] = unique(rounded,'rows');

out = xySol(ids,:);
    
    
    
    
