%Ellipse test

%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, 3 TARGETS
%NO NOISE, NON ZERO VELOCITY

posRx = [0,0];
posTx = [1000,0];
Targ = [500,-500,200,-200;      %Frequency shift of 207Hz - 414m
        500,-1000,400,-400;     %Frequency shift of 525Hz - 1236m
        0,200,0,0];             %Frequency shift of 0Hz - 220m

% dd = 50;
% Targ = (1000+dd:dd:2000)';
% Targ = [Targ zeros(size(Targ,1),3)];

freq = 8e6;
cfreq = 220e6;
time = 0.01; %seconds
N = time*freq;
SNR = 30;

[phi, s, noise, rxdirect] = signal_gen(posRx,posTx,Targ,freq,cfreq,N, SNR);

%Range to test over
range = 2000; 
freqs = -600:20:600;

tic
[rdmap, ranges] = rangedopplerfft(phi,freq, range, freqs,rxdirect);
toc

%plot it
[X,Y] = meshgrid(ranges, freqs);
figure; contourf(X,Y,rdmap');



%Detection co-efficients
P = [-1.1448   15.5332];

tic;
[rdHits, rdMapDetect] = detectTarg(rdmap,ranges,freqs,P);
toc;

%The number of detected targets
Nhits = size(rdHits,1);

param = zeros(Nhits,6);
for i = 1:Nhits
    param(i,:) = getEllParam(posRx,posTx,rdHits(i,1));
end






