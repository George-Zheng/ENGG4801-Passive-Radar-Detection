%Tester for the Range Doppler Map


%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, 1 TARGETS
%NO NOISE, NON ZERO VELOCITY
%Frequency shift of 200Hz
%Path difference of 414m
posRx = [0,0];
posTx = [1000,0];
Targ = [500,-500,200,-200];
freq = 8e6;  %Sampling frequency
cfreq = 220e6; %Carrier frequency
time = 0.01; %seconds
N = time*freq; %Number of samples to generate
SNR = 15; %Higher SNR is better


[phi, s, noise, rxdirect] = signal_gen(posRx,posTx,Targ,freq,cfreq,N, SNR);



range = 1000;   %can do 20000 (ie 20km) in <1s
freqs = -400:20:400;

tic

[rdmap, ranges] = rangedopplerfft(phi,freq, range, freqs,rxdirect);

toc

[X,Y] = meshgrid(ranges, freqs);
figure; contourf(X,Y,rdmap')
% figure; contourf(X,Y,log(rdmap)')
% %%%%%%%%
% MAXVAL = max(max(rdmap(3:end,:)));
% figure;
% imagesc(flipud(rdmap'),[0,MAXVAL])
% colorbar



%%

%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, 3 TARGETS
%NO NOISE, NON ZERO VELOCITY

posRx = [0,0];
posTx = [1000,0];
Targ = [500,-500,200,-200;      %Frequency shift of 207Hz - 414m
        500,-1000,400,-400;     %Frequency shift of 525Hz - 1236m
        0,200,0,0];             %Frequency shift of 0Hz - 220m

dd = 50;
Targ = (1000+dd:dd:2000)';
Targ = [Targ zeros(size(Targ,1),3)];

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

% [X,Y] = meshgrid(ranges, freqs);
% figure; contourf(X,Y,rdmap')


% logmap = log(rdmap);
% [X,Y] = meshgrid(ranges, freqs);
% figure; subplot(1,2,1);
% contourf(X,Y,rdmap')
% subplot(1,2,2); contourf(X,Y,logmap')

% 
% %IMAGESC
% 
% figure; surf(X,Y,logmap')
% figure; surf(X,Y,rdmap')
% 
% figure;
% pcolor(X,Y,logmap')
% % shading('interp')



%Processing for fall-off detection
maxes = max(rdmap,[],2);
% figure; plot(ranges,maxes);

tol = 700;
id = maxes > tol;

rc = ranges(id);
mc = maxes(id);

% figure; plot(rc,mc);

lrc = log(rc);
lmc = log(mc);



P = polyfit(lrc',lmc,1);

% figure; plot(lrc,lmc);
% hold on;
% plot(lrc,lrc*P(1) + P(2),'r');


figure; plot(ranges,maxes);
hold on;
plot(ranges,exp(P(2))*ranges.^P(1),'r');

axis([min(ranges) max(ranges) 0 max(maxes)]);


