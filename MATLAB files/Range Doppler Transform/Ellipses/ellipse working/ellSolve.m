syms qxx qxy qyy qx qy q0
syms rxx rxy ryy rx ry r0
syms x y
syms Q R
syms s0 s1 s2
syms t0 t1 t2

Q = qxx*x^2 + qxy*x*y + qyy*y^2 + qx*x + qy*y + q0;
R = rxx*x^2 + rxy*x*y + ryy*y^2 + rx*x + ry*y + r0;

s0 = qyy*y^2 + qy*y + q0;
s1 = qxy*y + qx;
s2 = qxx;

t0 = ryy*y^2 + ry*y + r0;
t1 = rxy*y + rx;
t2 = rxx;


% x = solve(s2*R - t2*Q,x);

Bezout = ((s2*t1 - s1*t2) * (s1*t0 - s0*t1)) - (s2*t0 - s0*t2)^2;

%solve(Bezout,y)
% 
% RootOf(2*qxx*qyy*rxx*ryy*z^4 - qxy^2*rxx*ryy*z^4 - qxx*qyy*rxy^2*z^4 + qxy*qyy*rxx*rxy*z^4 + qxx*qxy*rxy*ryy*z^4 - qyy^2*rxx^2*z^4 - qxx^2*ryy^2*z^4 + 2*qxx*qyy*rxx*ry*z^3 + 2*qxx*qy*rxx*ryy*z^3 - 2*qxx*qyy*rx*rxy*z^3 - 2*qx*qxy*rxx*ryy*z^3 - 2*qxx^2*ry*ryy*z^3 - qxy^2*rxx*ry*z^3 - 2*qy*qyy*rxx^2*z^3 - qxx*qy*rxy^2*z^3 + qxy*qyy*rx*rxx*z^3 + qxy*qy*rxx*rxy*z^3 + qxx*qxy*rxy*ry*z^3 + qxx*qxy*rx*ryy*z^3 + qx*qyy*rxx*rxy*z^3 + qx*qxx*rxy*ryy*z^3 + 2*qxx*qy*rxx*ry*z^2 - 2*qxx*qy*rx*rxy*z^2 - 2*qx*qxy*rxx*ry*z^2 + 2*qxx*qyy*r0*rxx*z^2 + 2*q0*qxx*rxx*ryy*z^2 - qx^2*rxx*ryy*z^2 - 2*qxx^2*r0*ryy*z^2 - qxy^2*r0*rxx*z^2 - qxx*qyy*rx^2*z^2 - 2*q0*qyy*rxx^2*z^2 - q0*qxx*rxy^2*z^2 + qxy*qy*rx*rxx*z^2 + qxx*qxy*rx*ry*z^2 + qx*qyy*rx*rxx*z^2 + qx*qy*rxx*rxy*z^2 + qx*qxx*rxy*ry*z^2 + qx*qxx*rx*ryy*z^2 + qxx*qxy*r0*rxy*z^2 + q0*qxy*rxx*rxy*z^2 - qy^2*rxx^2*z^2 - qxx^2*ry^2*z^2 + 2*qxx*qy*r0*rxx*z + 2*q0*qxx*rxx*ry*z - 2*qx*qxy*r0*rxx*z - 2*q0*qxx*rx*rxy*z + qx*qy*rx*rxx*z + qx*qxx*rx*ry*z + qxx*qxy*r0*rx*z + qx*qxx*r0*rxy*z + q0*qxy*rx*rxx*z + q0*qx*rxx*rxy*z - qx^2*rxx*ry*z - 2*qxx^2*r0*ry*z - qxx*qy*rx^2*z - 2*q0*qy*rxx^2*z + 2*q0*qxx*r0*rxx + qx*qxx*r0*rx + q0*qx*rx*rxx - qx^2*r0*rxx - q0*qxx*rx^2 - qxx^2*r0^2 - q0^2*rxx^2, z)
% collect(2*qxx*qyy*rxx*ryy*z^4 - qxy^2*rxx*ryy*z^4 - qxx*qyy*rxy^2*z^4 + qxy*qyy*rxx*rxy*z^4 + qxx*qxy*rxy*ryy*z^4 - qyy^2*rxx^2*z^4 - qxx^2*ryy^2*z^4 + 2*qxx*qyy*rxx*ry*z^3 + 2*qxx*qy*rxx*ryy*z^3 - 2*qxx*qyy*rx*rxy*z^3 - 2*qx*qxy*rxx*ryy*z^3 - 2*qxx^2*ry*ryy*z^3 - qxy^2*rxx*ry*z^3 - 2*qy*qyy*rxx^2*z^3 - qxx*qy*rxy^2*z^3 + qxy*qyy*rx*rxx*z^3 + qxy*qy*rxx*rxy*z^3 + qxx*qxy*rxy*ry*z^3 + qxx*qxy*rx*ryy*z^3 + qx*qyy*rxx*rxy*z^3 + qx*qxx*rxy*ryy*z^3 + 2*qxx*qy*rxx*ry*z^2 - 2*qxx*qy*rx*rxy*z^2 - 2*qx*qxy*rxx*ry*z^2 + 2*qxx*qyy*r0*rxx*z^2 + 2*q0*qxx*rxx*ryy*z^2 - qx^2*rxx*ryy*z^2 - 2*qxx^2*r0*ryy*z^2 - qxy^2*r0*rxx*z^2 - qxx*qyy*rx^2*z^2 - 2*q0*qyy*rxx^2*z^2 - q0*qxx*rxy^2*z^2 + qxy*qy*rx*rxx*z^2 + qxx*qxy*rx*ry*z^2 + qx*qyy*rx*rxx*z^2 + qx*qy*rxx*rxy*z^2 + qx*qxx*rxy*ry*z^2 + qx*qxx*rx*ryy*z^2 + qxx*qxy*r0*rxy*z^2 + q0*qxy*rxx*rxy*z^2 - qy^2*rxx^2*z^2 - qxx^2*ry^2*z^2 + 2*qxx*qy*r0*rxx*z + 2*q0*qxx*rxx*ry*z - 2*qx*qxy*r0*rxx*z - 2*q0*qxx*rx*rxy*z + qx*qy*rx*rxx*z + qx*qxx*rx*ry*z + qxx*qxy*r0*rx*z + qx*qxx*r0*rxy*z + q0*qxy*rx*rxx*z + q0*qx*rxx*rxy*z - qx^2*rxx*ry*z - 2*qxx^2*r0*ry*z - qxx*qy*rx^2*z - 2*q0*qy*rxx^2*z + 2*q0*qxx*r0*rxx + qx*qxx*r0*rx + q0*qx*rx*rxx - qx^2*r0*rxx - q0*qxx*rx^2 - qxx^2*r0^2 - q0^2*rxx^2,z)
% (- qxx^2*ryy^2 + qxx*qxy*rxy*ryy + 2*qxx*qyy*rxx*ryy - qxx*qyy*rxy^2 - qxy^2*rxx*ryy + qxy*qyy*rxx*rxy - qyy^2*rxx^2)*z^4 + (qx*qxx*rxy*ryy - 2*qy*qyy*rxx^2 - qxy^2*rxx*ry - 2*qxx^2*ry*ryy - qxx*qy*rxy^2 - 2*qx*qxy*rxx*ryy + qx*qyy*rxx*rxy + qxx*qxy*rx*ryy + qxx*qxy*rxy*ry - 2*qxx*qyy*rx*rxy + qxy*qy*rxx*rxy + qxy*qyy*rx*rxx + 2*qxx*qy*rxx*ryy + 2*qxx*qyy*rxx*ry)*z^3 + (q0*qxy*rxx*rxy - qy^2*rxx^2 - q0*qxx*rxy^2 - 2*q0*qyy*rxx^2 - qxx*qyy*rx^2 - qxy^2*r0*rxx - 2*qxx^2*r0*ryy - qx^2*rxx*ryy - qxx^2*ry^2 + qxx*qxy*r0*rxy + 2*q0*qxx*rxx*ryy + 2*qxx*qyy*r0*rxx + qx*qxx*rx*ryy + qx*qxx*rxy*ry - 2*qx*qxy*rxx*ry + qx*qy*rxx*rxy + qx*qyy*rx*rxx + qxx*qxy*rx*ry - 2*qxx*qy*rx*rxy + qxy*qy*rx*rxx + 2*qxx*qy*rxx*ry)*z^2 + (q0*qx*rxx*rxy - qxx*qy*rx^2 - 2*qxx^2*r0*ry - qx^2*rxx*ry - 2*q0*qy*rxx^2 - 2*q0*qxx*rx*rxy + q0*qxy*rx*rxx + qx*qxx*r0*rxy - 2*qx*qxy*r0*rxx + qxx*qxy*r0*rx + 2*q0*qxx*rxx*ry + 2*qxx*qy*r0*rxx + qx*qxx*rx*ry + qx*qy*rx*rxx)*z - q0^2*rxx^2 + q0*qx*rx*rxx + 2*q0*qxx*r0*rxx - q0*qxx*rx^2 - qx^2*r0*rxx + qx*qxx*r0*rx - qxx^2*r0^2

% (- qxx^2*ryy^2 + qxx*qxy*rxy*ryy + 2*qxx*qyy*rxx*ryy - qxx*qyy*rxy^2 - qxy^2*rxx*ryy + qxy*qyy*rxx*rxy - qyy^2*rxx^2)*z^4 
% + (qx*qxx*rxy*ryy - 2*qy*qyy*rxx^2 - qxy^2*rxx*ry - 2*qxx^2*ry*ryy - qxx*qy*rxy^2 - 2*qx*qxy*rxx*ryy + qx*qyy*rxx*rxy + qxx*qxy*rx*ryy + qxx*qxy*rxy*ry - 2*qxx*qyy*rx*rxy + qxy*qy*rxx*rxy + qxy*qyy*rx*rxx + 2*qxx*qy*rxx*ryy + 2*qxx*qyy*rxx*ry)*z^3 
% + (q0*qxy*rxx*rxy - qy^2*rxx^2 - q0*qxx*rxy^2 - 2*q0*qyy*rxx^2 - qxx*qyy*rx^2 - qxy^2*r0*rxx - 2*qxx^2*r0*ryy - qx^2*rxx*ryy - qxx^2*ry^2 + qxx*qxy*r0*rxy + 2*q0*qxx*rxx*ryy + 2*qxx*qyy*r0*rxx + qx*qxx*rx*ryy + qx*qxx*rxy*ry - 2*qx*qxy*rxx*ry + qx*qy*rxx*rxy + qx*qyy*rx*rxx + qxx*qxy*rx*ry - 2*qxx*qy*rx*rxy + qxy*qy*rx*rxx + 2*qxx*qy*rxx*ry)*z^2 
% + (q0*qx*rxx*rxy - qxx*qy*rx^2 - 2*qxx^2*r0*ry - qx^2*rxx*ry - 2*q0*qy*rxx^2 - 2*q0*qxx*rx*rxy + q0*qxy*rx*rxx + qx*qxx*r0*rxy - 2*qx*qxy*r0*rxx + qxx*qxy*r0*rx + 2*q0*qxx*rxx*ry + 2*qxx*qy*r0*rxx + qx*qxx*rx*ry + qx*qy*rx*rxx)*z 
% - q0^2*rxx^2 + q0*qx*rx*rxx + 2*q0*qxx*r0*rxx - q0*qxx*rx^2 - qx^2*r0*rxx + qx*qxx*r0*rx - qxx^2*r0^2

solve(Q,x);

% -(qx + qxy*y + (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx)
%  -(qx + qxy*y - (qx^2 + 2*qx*qxy*y + qxy^2*y^2 - 4*qxx*qyy*y^2 - 4*qxx*qy*y - 4*q0*qxx)^(1/2))/(2*qxx)




% S = solve(Q,x);
% 
% x = S(1);
% R = rxx*x^2 + rxy*x*y + ryy*y^2 + rx*x + ry*y + r0;
% Y1 = solve(R,y)
% 
% x = S(2);
% R = rxx*x^2 + rxy*x*y + ryy*y^2 + rx*x + ry*y + r0;
% Y2 = solve(R,y)

% %Y1
% z^4 
% - (z^3*(qxy^3*rxx*ry - 4*qx*qyy^2*rxx^2 - 2*qx*qxx*qyy*rxy^2 + qxx*qxy*qy*rxy^2 +
% 2*qxy*qy*qyy*rxx^2 + 4*qxx*qyy^2*rx*rxx - 2*qx*qxy^2*rxx*ryy + qxx*qxy^2*rx*ryy - qxx*qxy^2*rxy*ry -
% qxy^2*qy*rxx*rxy - qxy^2*qyy*rx*rxx - 2*qxx^2*qy*rxy*ryy - 4*qxx^2*qyy*rx*ryy + 4*qxx^2*qyy*rxy*ry +
% qx*qxx*qxy*rxy*ryy + 3*qx*qxy*qyy*rxx*rxy + 4*qx*qxx*qyy*rxx*ryy + 2*qxx*qxy*qy*rxx*ryy - 4*qxx*qxy*qyy*rxx*ry -
% 2*qxx*qy*qyy*rxx*rxy))/(qxx^2*ryy^2 + qyy^2*rxx^2 + qxx*qyy*rxy^2 + qxy^2*rxx*ryy - qxx*qxy*rxy*ryy -
% qxy*qyy*rxx*rxy - 2*qxx*qyy*rxx*ryy)
% + (z^2*(qxy^4*r0*rxx + 8*q0*qxx^3*ryy^2 + 4*qxx^3*qyy*ry^2 -
% 2*qx^2*qxx^2*ryy^2 + 6*qx^2*qyy^2*rxx^2 - qxx^2*qxy^2*ry^2 + 4*qxx^2*qyy^2*rx^2 + qxy^2*qy^2*rxx^2 -
% q0*qxy^3*rxx*rxy - qxx*qxy^3*r0*rxy - 8*qxx^3*qyy*r0*ryy - qx*qxy^3*rxx*ry + qxx*qxy^3*rx*ry - qxy^3*qy*rx*rxx -
% 4*qxx^3*qy*ry*ryy + q0*qxx*qxy^2*rxy^2 + 4*q0*qxx^2*qyy*rxy^2 + 2*q0*qxy^2*qyy*rxx^2 - qxx*qxy^2*qyy*rx^2 +
% 8*qxx^2*qyy^2*r0*rxx + 2*qxx^2*qxy^2*r0*ryy + qx^2*qxy^2*rxx*ryy + 4*qxx^2*qy^2*rxx*ryy - qx*qxx*qxy*qy*rxy^2 -
% 6*qx*qxy*qy*qyy*rxx^2 + 6*q0*qxx*qxy^2*rxx*ryy - 6*qxx*qxy^2*qyy*r0*rxx - 8*q0*qxx^2*qxy*rxy*ryy +
% 4*qxx^2*qxy*qyy*r0*rxy - 8*q0*qxx^2*qyy*rxx*ryy - 12*qx*qxx*qyy^2*rx*rxx - 2*qx*qxx*qxy^2*rx*ryy +
% 2*qx*qxy^2*qy*rxx*rxy + 2*qx*qxy^2*qyy*rx*rxx - 2*qxx*qxy*qy^2*rxx*rxy + qx^2*qxx*qxy*rxy*ryy -
% 3*qx^2*qxy*qyy*rxx*rxy + 2*qx*qxx^2*qxy*ry*ryy + 2*qx*qxx^2*qy*rxy*ryy + 4*qx*qxx^2*qyy*rx*ryy -
% 4*qx*qxx^2*qyy*rxy*ry + 2*qxx^2*qxy*qy*rx*ryy + 2*qxx^2*qxy*qy*rxy*ry - 4*qxx^2*qxy*qyy*rx*ry -
% 4*qxx^2*qy*qyy*rx*rxy - 4*qxx^2*qy*qyy*rxx*ry - 4*q0*qxx*qxy*qyy*rxx*rxy + 2*qx*qxx*qxy*qyy*rx*rxy -
% 6*qx*qxx*qxy*qy*rxx*ryy + 6*qx*qxx*qxy*qyy*rxx*ry + 6*qx*qxx*qy*qyy*rxx*rxy +
% 6*qxx*qxy*qy*qyy*rx*rxx))/(qxx^2*ryy^2 + qyy^2*rxx^2 + qxx*qyy*rxy^2 + qxy^2*rxx*ryy - qxx*qxy*rxy*ryy -
% qxy*qyy*rxx*rxy - 2*qxx*qyy*rxx*ryy) 
% - (z*(- 4*qx^3*qyy^2*rxx^2 - 8*qx*qxx^2*qyy^2*rx^2 - 2*qx*qxy^2*qy^2*rxx^2 -
% q0*qxy^4*rx*rxx + qxx*qxy^4*r0*rx + 2*q0*qxy^3*qy*rxx^2 - qxx*qxy^3*qy*rx^2 + 2*qx^3*qxx*qyy*rxy^2 +
% 16*qxx^3*qyy^2*r0*rx + 8*qxx^3*qy^2*rx*ryy - 8*q0*qx*qxx^2*qyy*rxy^2 - 4*q0*qx*qxy^2*qyy*rxx^2 +
% 4*q0*qxx^2*qxy*qy*rxy^2 + 2*qx*qxx*qxy^2*qyy*rx^2 - qx^2*qxx*qxy*qy*rxy^2 + 6*qx^2*qxy*qy*qyy*rxx^2 +
% 4*qxx^2*qxy*qy*qyy*rx^2 - 16*qx*qxx^2*qyy^2*r0*rxx + 4*q0*qxx^2*qxy^2*rx*ryy - 4*q0*qxx^2*qxy^2*rxy*ry +
% 2*qxx^2*qxy^2*qy*r0*rxy - 8*qxx^2*qxy^2*qyy*r0*rx + 2*qxx*qxy^2*qy^2*rx*rxx + 12*qx^2*qxx*qyy^2*rx*rxx +
% qx^2*qxx*qxy^2*rx*ryy + qx^2*qxx*qxy^2*rxy*ry - qx^2*qxy^2*qy*rxx*rxy - qx^2*qxy^2*qyy*rx*rxx -
% 4*qxx^2*qxy*qy^2*rx*rxy + 2*qxx^2*qxy^2*qy*rx*ry - 8*qx*qxx^2*qy^2*rxx*ryy + 2*qx^2*qxx^2*qy*rxy*ryy +
% 4*qx^2*qxx^2*qyy*rx*ryy - 4*qx^2*qxx^2*qyy*rxy*ry + q0*qx*qxy^3*rxx*rxy - qx*qxx*qxy^3*r0*rxy +
% 4*q0*qxx*qxy^3*rxx*ry - 2*qxx*qxy^3*qy*r0*rxx - 8*q0*qxx^3*qy*rxy*ryy - 16*q0*qxx^3*qyy*rx*ryy +
% 16*q0*qxx^3*qyy*rxy*ry - 8*qxx^3*qy*qyy*r0*rxy - qx*qxx*qxy^3*rx*ry + qx*qxy^3*qy*rx*rxx - qx^3*qxx*qxy*rxy*ryy +
% qx^3*qxy*qyy*rxx*rxy - 4*qx^3*qxx*qyy*rxx*ryy - 8*qxx^3*qy*qyy*rx*ry - 8*q0*qx*qxx*qxy^2*rxx*ryy -
% 6*q0*qxx*qxy^2*qy*rxx*rxy + 4*q0*qxx*qxy^2*qyy*rx*rxx + 4*qx*qxx*qxy^2*qyy*r0*rxx + 4*q0*qx*qxx^2*qxy*rxy*ryy +
% 4*qx*qxx^2*qxy*qyy*r0*rxy + 16*q0*qx*qxx^2*qyy*rxx*ryy + 8*q0*qxx^2*qxy*qy*rxx*ryy - 16*q0*qxx^2*qxy*qyy*rxx*ry +
% 8*qxx^2*qxy*qy*qyy*r0*rxx + 2*qx*qxx*qxy^2*qy*rx*rxy + 4*qx*qxx*qxy*qy^2*rxx*rxy - 4*qx^2*qxx*qxy*qyy*rx*rxy -
% 2*qx*qxx*qxy^2*qy*rxx*ry - 8*qx*qxx^2*qxy*qy*rx*ryy + 4*qx*qxx^2*qxy*qyy*rx*ry + 8*qx*qxx^2*qy*qyy*rx*rxy +
% 6*qx^2*qxx*qxy*qy*rxx*ryy - 6*qx^2*qxx*qy*qyy*rxx*rxy + 8*qx*qxx^2*qy*qyy*rxx*ry + 8*q0*qx*qxx*qxy*qyy*rxx*rxy -
% 12*qx*qxx*qxy*qy*qyy*rx*rxx))/(qxx^2*ryy^2 + qyy^2*rxx^2 + qxx*qyy*rxy^2 + qxy^2*rxx*ryy - qxx*qxy*rxy*ryy -
% qxy*qyy*rxx*rxy - 2*qxx*qyy*rxx*ryy) 
% + (q0^2*qxy^4*rxx^2 + qxx^2*qxy^4*r0^2 + 16*q0^2*qxx^4*ryy^2 +
% 16*qxx^4*qyy^2*r0^2 + qx^4*qxx^2*ryy^2 + qx^4*qyy^2*rxx^2 - 8*q0*qx^2*qxx^3*ryy^2 - 4*q0*qxx^3*qxy^2*ry^2 -
% 8*qxx^3*qxy^2*qyy*r0^2 - 4*qx^2*qxx^3*qyy*ry^2 + 4*q0^2*qxx^2*qxy^2*rxy^2 + qx^2*qxx^2*qxy^2*ry^2 +
% 4*qx^2*qxx^2*qyy^2*rx^2 + qx^2*qxy^2*qy^2*rxx^2 - q0*qxx*qxy^4*rx^2 + 16*q0*qxx^4*qyy*ry^2 - qx^4*qxx*qyy*rxy^2 +
% 16*qxx^4*qy^2*r0*ryy - 2*q0*qx*qxy^3*qy*rxx^2 + qx*qxx*qxy^3*qy*rx^2 + qx^3*qxx*qxy*qy*rxy^2 -
% 2*qx^3*qxy*qy*qyy*rxx^2 - 4*q0*qxx^2*qxy^3*r0*rxy + 8*q0*qxx^3*qxy^2*r0*ryy - 4*q0^2*qxx*qxy^3*rxx*rxy +
% 4*q0*qxx^2*qxy^3*rx*ry - 2*qx*qxx^2*qxy^3*r0*ry - 16*qx*qxx^3*qyy^2*r0*rx - 2*qxx^2*qxy^3*qy*r0*rx -
% 8*qxx^3*qxy*qy^2*r0*rxy - 16*q0^2*qxx^3*qxy*rxy*ryy + 4*qxx^3*qxy^2*qy*r0*ry + 8*qx^2*qxx^3*qyy*r0*ryy -
% 4*qx^3*qxx*qyy^2*rx*rxx - 8*qx*qxx^3*qy^2*rx*ryy - 2*qx^3*qxx^2*qxy*ry*ryy - 2*qx^3*qxx^2*qy*rxy*ryy -
% 4*qx^3*qxx^2*qyy*rx*ryy + 4*qx^3*qxx^2*qyy*rxy*ry + 4*qx^2*qxx^3*qy*ry*ryy - q0*qx^2*qxx*qxy^2*rxy^2 +
% 4*q0*qx^2*qxx^2*qyy*rxy^2 + 2*q0*qx^2*qxy^2*qyy*rxx^2 + 4*q0*qxx^2*qxy^2*qyy*rx^2 - qx^2*qxx*qxy^2*qyy*rx^2 +
% 8*qx^2*qxx^2*qyy^2*r0*rxx + 4*qxx^2*qxy^2*qy^2*r0*rxx + 2*qx^2*qxx^2*qxy^2*r0*ryy + 8*q0^2*qxx^2*qxy^2*rxx*ryy +
% 4*qx^2*qxx^2*qy^2*rxx*ryy + 2*q0*qxx*qxy^4*r0*rxx - 32*q0*qxx^4*qyy*r0*ryy - 16*q0*qxx^4*qy*ry*ryy -
% 16*qxx^4*qy*qyy*r0*ry + 2*qx^4*qxx*qyy*rxx*ryy + 16*q0*qxx^3*qxy*qyy*r0*rxy + 2*q0*qx*qxx*qxy^3*rx*rxy -
% 2*q0*qx*qxx*qxy^3*rxx*ry + 2*q0*qxx*qxy^3*qy*rx*rxx - 2*qx*qxx*qxy^3*qy*r0*rxx + 8*q0*qx*qxx^3*qxy*ry*ryy +
% 8*q0*qx*qxx^3*qy*rxy*ryy + 16*q0*qx*qxx^3*qyy*rx*ryy - 16*q0*qx*qxx^3*qyy*rxy*ry + 8*q0*qxx^3*qxy*qy*rx*ryy +
% 8*q0*qxx^3*qxy*qy*rxy*ry - 16*q0*qxx^3*qxy*qyy*rx*ry - 16*qx*qxx^3*qxy*qy*r0*ryy + 8*qx*qxx^3*qxy*qyy*r0*ry +
% 8*qx*qxx^3*qy*qyy*r0*rxy + 8*qxx^3*qxy*qy*qyy*r0*rx + 2*qx^3*qxx*qxy*qyy*rx*rxy - 2*qx^3*qxx*qxy*qy*rxx*ryy -
% 2*qx^3*qxx*qxy*qyy*rxx*ry + 2*qx^3*qxx*qy*qyy*rxx*rxy + 8*qx*qxx^3*qy*qyy*rx*ry - 4*q0*qx*qxx^2*qxy*qy*rxy^2 -
% 4*qx*qxx^2*qxy*qy*qyy*rx^2 - 8*q0*qxx^2*qxy^2*qyy*r0*rxx - 8*q0*qx*qxx^2*qxy^2*rx*ryy - 4*q0*qxx^2*qxy^2*qy*rx*rxy
% + 6*qx*qxx^2*qxy^2*qy*r0*rxy + 4*qx*qxx^2*qxy^2*qyy*r0*rx + 2*q0*qx^2*qxx*qxy^2*rxx*ryy +
% 2*qx^2*qxx*qxy^2*qyy*r0*rxx + 4*q0*qx^2*qxx^2*qxy*rxy*ryy - 8*qx^2*qxx^2*qxy*qyy*r0*rxy -
% 4*q0*qxx^2*qxy^2*qy*rxx*ry - 8*q0*qx^2*qxx^2*qyy*rxx*ryy - 2*qx*qxx*qxy^2*qy^2*rx*rxx + 4*qx*qxx^2*qxy*qy^2*rx*rxy
% - 2*qx^2*qxx*qxy^2*qy*rx*rxy - 2*qx^2*qxx*qxy*qy^2*rxx*rxy - 2*qx*qxx^2*qxy^2*qy*rx*ry + 2*qx^2*qxx*qxy^2*qy*rxx*ry
% + 6*qx^2*qxx^2*qxy*qy*rx*ryy - 2*qx^2*qxx^2*qxy*qy*rxy*ry - 4*qx^2*qxx^2*qy*qyy*rx*rxy - 4*qx^2*qxx^2*qy*qyy*rxx*ry
% + 6*q0*qx*qxx*qxy^2*qy*rxx*rxy - 4*q0*qx*qxx*qxy^2*qyy*rx*rxx - 4*q0*qx^2*qxx*qxy*qyy*rxx*rxy -
% 8*q0*qx*qxx^2*qxy*qy*rxx*ryy + 16*q0*qx*qxx^2*qxy*qyy*rxx*ry - 8*qx*qxx^2*qxy*qy*qyy*r0*rxx +
% 6*qx^2*qxx*qxy*qy*qyy*rx*rxx)/(qxx^2*ryy^2 + qyy^2*rxx^2 + qxx*qyy*rxy^2 + qxy^2*rxx*ryy - qxx*qxy*rxy*ryy -
% qxy*qyy*rxx*rxy - 2*qxx*qyy*rxx*ryy)
% 
% 
% 
% 
% 
