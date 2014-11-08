function lambda = herm2(phi)

% phi = rand(10,2);
G = phi'*phi;
N = size(G,1);
y = sqrt(1/N)*ones(N,1);
[y,lambda, it] = power_method(N,G,y,10,0.1);
y
