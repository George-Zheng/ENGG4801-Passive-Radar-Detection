fs = 5000; %Sampling freq
T = 1/fs;   %Sampling period
freq = 500; %Sinusoid frequency

t = 0:T:1;  %Generate 1 second of data
y = sin(2*pi*freq*t); %generate sinusoid of frequency freq

shift = 200;
yshift = y.*exp(1i*2*pi*shift*t);

figure;
F = fft(y);
n = numel(F); %To get the size
x = fs*(0:n-1)/n;
plot(x,abs(F));
title('original data');

figure;
F = fft(yshift);
n = numel(F); %To get the size
x = fs*(0:n-1)/n;
plot(x,abs(F));
title('freq shifted data');