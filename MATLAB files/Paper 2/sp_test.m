%Test matlab speed
N = 5000;

cc = zeros(N,2);
tt = zeros(N,2);

for i=1:N
    a = randn(N,1) + 1i*randn(N,1);
    b = randn(N,1) + 1i*randn(N,1);
    
    tic; temp = corr(a,b); tt(i,1) = toc;
    cc(i,1) = temp;
    
    tic; temp = corrcoef(a,b); tt(i,2) = toc;
    cc(i,2) = temp(1,2);
end

mean(cc(:,1)-cc(:,2))

plot(tt(:,1),'b');
hold on
plot(tt(:,2),'r');


%     cc(i,1) = corr(a(i:end),b(1:end-i+1));


% plot(abs(cc(end:-1:1)));
% hold on
% dd = abs(xcorr(a,b,'coeff'));
% plot(dd(N:2*N-1),'r')


% for i=1:N
%     a = randn(50,1) + 1i*randn(50,1);
%     b = randn(50,1) + 1i*randn(50,1);
%     cc(i,1) = abs(corr(a,b));
%     cc(i,2) = corr(real(a),real(b));
%     cc(i,3) = corr(imag(a),imag(b));
% end


% N = 1e6;
% AA = 50;
% t1 = zeros(1,AA);
% for i=1:AA
% phi = randn(N,1) + 1i*randn(N,1);
% sig = phi(50:end);
% tic
% nn = numel(sig);
% abs(corr(sig,phi(1:nn)));
% t=toc;
% t1(i) = t;
% end
%
% t2 = zeros(1,AA);
% for i=1:AA
% phi = randn(N,1) + 1i*randn(N,1);
% sig = phi(50:end);
% tic
% abs(corr(sig,phi(1:numel(sig))));
% t=toc;
% t2(i) = t;
% end
%
% plot(t1,'b');
% hold on
% plot(t2,'r');
%
%




