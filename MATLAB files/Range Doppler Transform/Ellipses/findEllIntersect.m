function out = findEllIntersect(Qparam, Rparam)
%Finds the intersection of 2 ellipses given their parameters:
%param = [qxx, qyy, qxy, qx, qy, q0] where the ellipse ifs given by
%qxx*x^2 + qyy*y^2 + qxy*x*y + qx*x + qy*y + q0 = 0;
%
%out = a n-by-2 array where n is the number of intersections
%   0<=n<=4
%   first col is x coord, second col is y coord

%Get q components
qxx = Qparam(1);
qyy = Qparam(2);
qxy = Qparam(3);
qx = Qparam(4);
qy = Qparam(5);
q0 = Qparam(6);
%Get r components
rxx = Rparam(1);
ryy = Rparam(2);
rxy = Rparam(3);
rx = Rparam(4);
ry = Rparam(5);
r0 = Rparam(6);

z4 = (- qxx^2*ryy^2 + qxx*qxy*rxy*ryy + 2*qxx*qyy*rxx*ryy - qxx*qyy*rxy^2 - qxy^2*rxx*ryy + qxy*qyy*rxx*rxy - qyy^2*rxx^2);
z3 = (qx*qxx*rxy*ryy - 2*qy*qyy*rxx^2 - qxy^2*rxx*ry - 2*qxx^2*ry*ryy - qxx*qy*rxy^2 - 2*qx*qxy*rxx*ryy + qx*qyy*rxx*rxy + qxx*qxy*rx*ryy + qxx*qxy*rxy*ry - 2*qxx*qyy*rx*rxy + qxy*qy*rxx*rxy + qxy*qyy*rx*rxx + 2*qxx*qy*rxx*ryy + 2*qxx*qyy*rxx*ry);
z2 = (q0*qxy*rxx*rxy - qy^2*rxx^2 - q0*qxx*rxy^2 - 2*q0*qyy*rxx^2 - qxx*qyy*rx^2 - qxy^2*r0*rxx - 2*qxx^2*r0*ryy - qx^2*rxx*ryy - qxx^2*ry^2 + qxx*qxy*r0*rxy + 2*q0*qxx*rxx*ryy + 2*qxx*qyy*r0*rxx + qx*qxx*rx*ryy + qx*qxx*rxy*ry - 2*qx*qxy*rxx*ry + qx*qy*rxx*rxy + qx*qyy*rx*rxx + qxx*qxy*rx*ry - 2*qxx*qy*rx*rxy + qxy*qy*rx*rxx + 2*qxx*qy*rxx*ry);
z1 = (q0*qx*rxx*rxy - qxx*qy*rx^2 - 2*qxx^2*r0*ry - qx^2*rxx*ry - 2*q0*qy*rxx^2 - 2*q0*qxx*rx*rxy + q0*qxy*rx*rxx + qx*qxx*r0*rxy - 2*qx*qxy*r0*rxx + qxx*qxy*r0*rx + 2*q0*qxx*rxx*ry + 2*qxx*qy*r0*rxx + qx*qxx*rx*ry + qx*qy*rx*rxx);
z0 = - q0^2*rxx^2 + q0*qx*rx*rxx + 2*q0*qxx*r0*rxx - q0*qxx*rx^2 - qx^2*r0*rxx + qx*qxx*r0*rx - qxx^2*r0^2;

Ys = roots([z4 z3 z2 z1 z0]);

NY = numel(Ys);

sols = [];
for i=1:numel(Ys)
    y = Ys(i);
    w0 = q0 + qy*y + qyy*y^2;
    w1 = qxy*y + qx;
    w2 = qxx;
    Xs = roots([w2 w1 w0]);
    sols = [sols; [Xs, [y;y]]];
end

%Check which are valid solutions
Q = @(x,y) (q0+qy*y+qyy*y^2) + (qxy*y + qx)*x + (qxx)*x^2;
R = @(x,y) (r0+ry*y+ryy*y^2) + (rxy*y + rx)*x + (rxx)*x^2;

out = [];

tol = 1e-6;

for i=1:size(sols,1)
    qval = abs(Q(sols(i,1),sols(i,2)));
    rval = abs(R(sols(i,1),sols(i,2)));
    im1 = abs(imag(sols(i,1)));
    im2 = abs(imag(sols(i,2)));
    if (qval<tol && rval<tol) && (im1<tol && im2<tol)
        out = [out; sols(i,:)];
    end
end

%Find unique up to 5 digits
n = 10^5;
rounded = real(floor(out*n)/n);
[~,ids,~] = unique(rounded,'rows');

out = real(out(ids,:));



% %Create symmetric matrix Q and R s.t
% %   v*Q*v' = 0, where v = [x, y, 1]
% Q = [qxx, qxy/2, qx/2;
%     qxy/2, qyy, qy/2;
%     qx/2, qy/2, q0];
% 
% R = [rxx, rxy/2, rx/2;
%     rxy/2, ryy, ry/2;
%     rx/2, ry/2, r0];
% 
% %Want to find C = mu*Q + R for scalar mu so that det(C) = 0;
% syms mu;
% muVal = double(solve(det(mu*Q + R),'mu'));



