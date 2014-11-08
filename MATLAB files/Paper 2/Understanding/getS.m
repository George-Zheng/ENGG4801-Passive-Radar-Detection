function S = getS(k,N)

%N >> k usually but minimum N>k

S = zeros(k,N);
S(1:k-1,1:k-1) = eye(k-1);

a = 1/sqrt(N-k+1);
S(k,k:N) = a;