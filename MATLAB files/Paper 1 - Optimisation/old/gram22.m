function eigen = gram22(a,b,c,d)
%returns the eigenvalues of 2x2 matrix [a,b; c,d]
eigen = eig([a,b;c,d])
[(a+d + sqrt((a-d)^2 + 4*b*c))*0.5;(a+d - sqrt((a-d)^2 + 4*b*c))*0.5]
