function param = getEllParam(posRx, posTx, pd)
%Gets the ellipse parameters in a common form from
%   Receiver position (posRx)
%   Transmitter position (posTx)
%   path difference as calculated in the range doppler map (pd)
%
%param = [qxx, qyy, qxy, qx, qy, q0] where the ellipse ifs given by:
%
% qxx*x^2 + qyy*y^2 + qxy*x*y + qx*x + qy*y + q0 = 0;


%Extract the positions
x0 = posRx(1); y0 = posRx(2);
x1 = posTx(1); y1 = posTx(2);

%Find middle of ellipse
xm = (x0+x1)/2;
ym = (y0+y1)/2;

DTxRx = norm(posRx - posTx);

%Find angle alpha
alpha = atan((y1-y0)/(x1-x0));

%Find semimajor radii
A = (DTxRx + pd)/2;
f = DTxRx/2;
B = sqrt(A^2-f^2);

ca = cos(alpha);
sa = sin(alpha);
%Get the product terms
qxx = (ca/A)^2 + (sa/B)^2;
qyy = (sa/A)^2 + (ca/B)^2;
qxy = 2*ca*sa/A^2 + -2*ca*sa/B^2;
qx = (-2*xm*ca^2 - 2*ym*ca*sa)/A^2 + (-2*xm*sa^2 + 2*ym*ca*sa)/B^2;
qy = (-2*ym*sa^2 - 2*xm*ca*sa)/A^2 + (-2*ym*ca^2 + 2*xm*ca*sa)/B^2;
q0 = (xm^2*ca^2 + 2*xm*ym*ca*sa + ym^2*sa^2)/A^2 + (xm^2*sa^2 - 2*xm*ym*ca*sa + ym^2*ca^2)/B^2 - 1; 
% qxx = (ca/A)^2 + (sa/B)^2;
% qyy = (sa/A)^2 + (ca/B)^2;
% qxy = 2*ca*sa/A^2 + 2*ca*sa/B^2;
% qx = (-2*xm*ca^2 - 2*ym*ca*sa)/A^2 + (-2*xm*sa^2 - 2*ym*ca*sa)/B^2;
% qy = (-2*ym*sa^2 - 2*xm*ca*sa)/A^2 + (-2*ym*ca^2 - 2*xm*ca*sa)/B^2;
% q0 = (xm^2*ca^2 + 2*xm*ym*ca*sa + ym^2*sa^2)/A^2 + (xm^2*sa^2 + 2*xm*ym*ca*sa + ym^2*ca^2)/B^2 - 1; 
    
param = [qxx, qyy, qxy, qx, qy, q0];

