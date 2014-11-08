%TESTING FREQ SHIFT OF RANDOM SAMPLES

fs = 8e6; %Sampling freq
T = 1/fs;   %Sampling period

t = (0:T:1)';  %Generate 1 second of data
y = randn(numel(t),1) + 1i*randn(numel(t),1); %generate random

shift = 500;
yshift = y.*exp(1i*2*pi*shift*t);

N = 2^nextpow2(numel(y));
figure;
F = fft(y,N);
n = numel(F); %To get the size
x = fs*(0:n-1)/n;
plot(x,abs(F));
title('original data');

figure;
F = fft(yshift,N);
n = numel(F); %To get the size
x = fs*(0:n-1)/n;
plot(x,abs(F));
title('freq shifted data');