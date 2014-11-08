%Ell Test
Qparam = [1/9, 0, 1/4, 0,0,-1];
Rparam = [1/4,0,1/9,0,0,-1];

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


Q = @(x,y) qxx*x^2 + qxy*x*y + qyy*y^2 + qx*x + qy*y + q0;
R = @(x,y) rxx*x^2 + rxy*x*y + ryy*y^2 + rx*x + ry*y + r0;

y = sqrt(45/24.25)
x = 9-(9*y^2/4)

Q(x,y)
R(x,y)


%BAD
% (ryy - (qxy*rxy)/(2*qxx) + (qxy^2*rxx)/(4*qxx^2))*y^2 ...
% + (ry - (qxy*rx)/(2*qxx) - (rxy*(qx - (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2)))/(2*qxx) + (qxy*rxx*(qx -...
% (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2)))/(2*qxx^2))*y ...
% + r0 - (rx*(qx - (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 -...
% 4*qxx*qy*y - 4*q0*qxx)^(1/2)))/(2*qxx) + (rxx*(qx - (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))^2)/(4*qxx^2)




r0 + ry*y + ryy*y^2 - (rx*(qx + qxy*y - (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2)))/(2*qxx) + (rxx*(qx + qxy*y - (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))^2)/(4*qxx^2) - (rxy*y*(qx + qxy*y - (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2)))/(2*qxx)




r0 + ry*y + ryy*y^2 + (rx*(qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx) - (q0*rxx)/qxx - (qx*rx)/(2*qxx) + (qx^2*rxx)/(2*qxx^2) + (qxy^2*rxx*y^2)/(2*qxx^2) - (qx*rxx*(qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx^2) + (rxy*y*(qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx) - (qx*rxy*y)/(2*qxx) - (qxy*rx*y)/(2*qxx) - (qy*rxx*y)/qxx - (qxy*rxy*y^2)/(2*qxx) - (qyy*rxx*y^2)/qxx - (qxy*rxx*y*(qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx^2) + (qx*qxy*rxx*y)/qxx^2





(ryy - (qxy*rxy)/(2*qxx) - (qyy*rxx)/qxx + (qxy^2*rxx)/(2*qxx^2))*y^2 + (ry + (rxy*(qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx) - (qx*rxy)/(2*qxx) - (qxy*rx)/(2*qxx) - (qy*rxx)/qxx - (qxy*rxx*(qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx^2) + (qx*qxy*rxx)/qxx^2)*y + r0 + (rx*(qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx) - (q0*rxx)/qxx - (qx*rx)/(2*qxx) + (qx^2*rxx)/(2*qxx^2) - (qx*rxx*(qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx^2)


