FShift = 200;
Time = 0.0001; %seconds
freq = 8e6;

dt = 1/freq;
Ngen = round(Time/dt)+1;


%Generated signal
sig = randn(Ngen,1) + 1i*randn(Ngen,1);
%Time vector for frequency shifting
timevec = 0:dt:dt*Ngen;
timevec = timevec'; %ensure column vector

modul = (exp(1i*2*pi*FShift*timevec(1:numel(sig))));
plot(timevec(1:numel(sig)),real(modul))
hold on
plot(timevec(1:numel(sig)),imag(modul),'r')