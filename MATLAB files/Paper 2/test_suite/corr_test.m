a = randn(20,1);

[c, shifts] = xcorr(a);
plot(shifts,c);

hold on

d = zeros(20,1);
for i=1:numel(a)
    d(i) = corr(a(i:end),a(1:end-i+1));
end

plot(0:19,d,'r');