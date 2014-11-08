function lambda = herm(phi)

% phi = rand(10,2);
G = phi'*phi;
lambda = max(eig(G));