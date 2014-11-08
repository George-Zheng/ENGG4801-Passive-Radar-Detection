%ellipse_syms
%HELP SOLVE THE ELLIPSE PROBLEM

syms qxx qxy qyy qx qy q0
syms rxx rxy ryy rx ry r0
syms sig0 sig1 sig2
syms tau0 tau1 tau2
syms y z

sig0 = q0 + qy*y + qyy*y^2;
sig1 = qxy*y + qx;
sig2 = qxx;

tau0 = r0 + ry*y + ryy*y^2;
tau1 = rxy*y + rx;
tau2 = rxx;

solve((sig2*tau1 - sig1*tau2)*(sig1*tau0 - sig0*tau1) - (sig2*tau0-sig0*tau2)^2,y)

simple(2*qxx*qyy*rxx*ryy*z^4 - qxy^2*rxx*ryy*z^4 - qxx*qyy*rxy^2*z^4 + qxy*qyy*rxx*rxy*z^4 + qxx*qxy*rxy*ryy*z^4 - qyy^2*rxx^2*z^4 - qxx^2*ryy^2*z^4 + 2*qxx*qyy*rxx*ry*z^3 + 2*qxx*qy*rxx*ryy*z^3 - 2*qxx*qyy*rx*rxy*z^3 - 2*qx*qxy*rxx*ryy*z^3 - 2*qxx^2*ry*ryy*z^3 - qxy^2*rxx*ry*z^3 - 2*qy*qyy*rxx^2*z^3 - qxx*qy*rxy^2*z^3 + qxy*qyy*rx*rxx*z^3 + qxy*qy*rxx*rxy*z^3 + qxx*qxy*rxy*ry*z^3 + qxx*qxy*rx*ryy*z^3 + qx*qyy*rxx*rxy*z^3 + qx*qxx*rxy*ryy*z^3 + 2*qxx*qy*rxx*ry*z^2 - 2*qxx*qy*rx*rxy*z^2 - 2*qx*qxy*rxx*ry*z^2 + 2*qxx*qyy*r0*rxx*z^2 + 2*q0*qxx*rxx*ryy*z^2 - qx^2*rxx*ryy*z^2 - 2*qxx^2*r0*ryy*z^2 - qxy^2*r0*rxx*z^2 - qxx*qyy*rx^2*z^2 - 2*q0*qyy*rxx^2*z^2 - q0*qxx*rxy^2*z^2 + qxy*qy*rx*rxx*z^2 + qxx*qxy*rx*ry*z^2 + qx*qyy*rx*rxx*z^2 + qx*qy*rxx*rxy*z^2 + qx*qxx*rxy*ry*z^2 + qx*qxx*rx*ryy*z^2 + qxx*qxy*r0*rxy*z^2 + q0*qxy*rxx*rxy*z^2 - qy^2*rxx^2*z^2 - qxx^2*ry^2*z^2 + 2*qxx*qy*r0*rxx*z + 2*q0*qxx*rxx*ry*z - 2*qx*qxy*r0*rxx*z - 2*q0*qxx*rx*rxy*z + qx*qy*rx*rxx*z + qx*qxx*rx*ry*z + qxx*qxy*r0*rx*z + qx*qxx*r0*rxy*z + q0*qxy*rx*rxx*z + q0*qx*rxx*rxy*z - qx^2*rxx*ry*z - 2*qxx^2*r0*ry*z - qxx*qy*rx^2*z - 2*q0*qy*rxx^2*z + 2*q0*qxx*r0*rxx + qx*qxx*r0*rx + q0*qx*rx*rxx - qx^2*r0*rxx - q0*qxx*rx^2 - qxx^2*r0^2 - q0^2*rxx^2)
 

(- qxx^2*ryy^2 + qxx*qxy*rxy*ryy + 2*qxx*qyy*rxx*ryy - qxx*qyy*rxy^2 - qxy^2*rxx*ryy + qxy*qyy*rxx*rxy - qyy^2*rxx^2)*z^4 
+ (qx*qxx*rxy*ryy - 2*qy*qyy*rxx^2 - qxy^2*rxx*ry - 2*qxx^2*ry*ryy - qxx*qy*rxy^2 - 2*qx*qxy*rxx*ryy + qx*qyy*rxx*rxy + qxx*qxy*rx*ryy + qxx*qxy*rxy*ry - 2*qxx*qyy*rx*rxy + qxy*qy*rxx*rxy + qxy*qyy*rx*rxx + 2*qxx*qy*rxx*ryy + 2*qxx*qyy*rxx*ry)*z^3
+ (q0*qxy*rxx*rxy - qy^2*rxx^2 - q0*qxx*rxy^2 - 2*q0*qyy*rxx^2 - qxx*qyy*rx^2 - qxy^2*r0*rxx - 2*qxx^2*r0*ryy - qx^2*rxx*ryy - qxx^2*ry^2 + qxx*qxy*r0*rxy + 2*q0*qxx*rxx*ryy + 2*qxx*qyy*r0*rxx + qx*qxx*rx*ryy + qx*qxx*rxy*ry - 2*qx*qxy*rxx*ry + qx*qy*rxx*rxy + qx*qyy*rx*rxx + qxx*qxy*rx*ry - 2*qxx*qy*rx*rxy + qxy*qy*rx*rxx + 2*qxx*qy*rxx*ry)*z^2
+ (q0*qx*rxx*rxy - qxx*qy*rx^2 - 2*qxx^2*r0*ry - qx^2*rxx*ry - 2*q0*qy*rxx^2 - 2*q0*qxx*rx*rxy + q0*qxy*rx*rxx + qx*qxx*r0*rxy - 2*qx*qxy*r0*rxx + qxx*qxy*r0*rx + 2*q0*qxx*rxx*ry + 2*qxx*qy*r0*rxx + qx*qxx*rx*ry + qx*qy*rx*rxx)*z 
- q0^2*rxx^2 + q0*qx*rx*rxx + 2*q0*qxx*r0*rxx - q0*qxx*rx^2 - qx^2*r0*rxx + qx*qxx*r0*rx - qxx^2*r0^2
 