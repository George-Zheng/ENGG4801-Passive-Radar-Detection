%test_herm
N = 10;
tt = zeros(N,2);
lambda = zeros(N,2);
for i=1:N
    phi = rand(N,5);
    tic;
    lambda(i,1) = herm(phi);
    tt(i,1) = toc;
    
    tic;
    lambda(i,2) = herm2(phi);
    tt(i,2) = toc;
end

lambda(:,1) - lambda(:,2)
figure; plot(tt(:,1),'b*'); hold on;
plot(tt(:,2),'r*'); legend('MATLAB','POWER');