function posRx = getMultRXPos(nx, ny, Rdist)
%Takes a number of points in the x- and y- directions and a distance
%between them and returns an (nx*ny)-by-2 array containing all of the
%locations of the receivers

XS = (nx-1)*Rdist;
YS = (ny-1)*Rdist;
XV = linspace(-XS/2, XS/2, nx);
YV = linspace(-YS/2, YS/2, ny)';
XA = repmat(XV,ny,1);
YA = repmat(YV,1,nx);

posRx = [XA(:), YA(:)];