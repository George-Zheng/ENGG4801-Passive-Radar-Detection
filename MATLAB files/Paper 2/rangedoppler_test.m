%Tester for the Range Doppler Map

%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, 1 TARGETS
%NO NOISE, NON ZERO VELOCITY
%Frequency shift of 200Hz
posRx = [0,0];
posTx = [1000,0];
Targ = [500,-500,200,-200];
freq = 8e6;
cfreq = 220e6;
time = 0.01; %seconds
N = time*freq;

[phi, s, noise] = signal_gen(posRx,posTx,Targ,freq,cfreq,N);


ranges = 0:10:1000;
freqs = -400:20:400;
rdmap = rangedoppler(phi,freq, ranges, freqs);

[X,Y] = meshgrid(ranges, freqs);
figure; contourf(X,Y,rdmap')
figure; contourf(X,Y,log(rdmap)')
%%%%%%%%
MAXVAL = max(max(rdmap(3:end,:)));
figure;
imagesc(flipud(rdmap'),[0,MAXVAL])
colorbar



%%

%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, 3 TARGETS
%NO NOISE, NON ZERO VELOCITY

posRx = [0,0];
posTx = [1000,0];
Targ = [500,-500,200,-200;      %Frequency shift of 207Hz - 414m
        500,-1000,400,-400;     %Frequency shift of 525Hz - 1236m
        0,200,0,0];             %Frequency shift of 0Hz - 220m
freq = 8e6;
cfreq = 220e6;
time = 0.01; %seconds
N = time*freq;

[phi, s, noise] = signal_gen(posRx,posTx,Targ,freq,cfreq,N);

ranges = 30:10:1500;
freqs = -600:50:600;
rdmap = rangedoppler(phi,freq, ranges, freqs);

logmap = log(rdmap);
[X,Y] = meshgrid(ranges, freqs);
figure; subplot(1,2,1);
contourf(X,Y,rdmap')
subplot(1,2,2); contourf(X,Y,logmap')

%IMAGESC

%surf(X,Y,logmap')

figure;
pcolor(X,Y,logmap')
% shading('interp')



%%
%FOR DIRECT PATH SIGNALS INCLUDED
%rangedoppler_direct.m



%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, 1 TARGETS
%NO NOISE, NON ZERO VELOCITY
%Frequency shift of 200Hz
posRx = [0,0; 0,1000];
posTx = [1000,0];
Targ = [500,-500,200,-200];
Targ = [];
freq = 8e6;
cfreq = 220e6;
time = 0.01; %seconds
N = time*freq;
N=10;

noise = 0;

[phi, s, noise] = signal_gen(posRx,posTx,Targ,freq,cfreq,N,noise);


ranges = 0:10:1000;
freqs = -400:20:400;
rdmap = rangedoppler_direct(phi,freq, ranges, freqs);

[X,Y] = meshgrid(ranges, freqs);
figure; contourf(X,Y,rdmap')
figure; contourf(X,Y,log(rdmap)')
%%%%%%%%
MAXVAL = max(max(rdmap(3:end,:)));
figure;
imagesc(flipud(rdmap'),[0,MAXVAL])
colorbar







