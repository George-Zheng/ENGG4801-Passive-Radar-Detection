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

ranges = 0:10:1000;
freqs = -400:100:400;

tt = zeros(100,1);
for i=1:100
    [phi, s, noise] = signal_gen(posRx,posTx,Targ,freq,cfreq,N);
    tic;
    rdmap = rangedoppler(phi,freq, ranges, freqs);
    tt(i) = toc;
    i
end

% [X,Y] = meshgrid(ranges, freqs);
% figure; contourf(X,Y,rdmap')
% figure; contourf(X,Y,log(rdmap)')
% %%%%%%%%
% MAXVAL = max(max(rdmap(3:end,:)));
% figure;
% imagesc(flipud(rdmap'),[0,MAXVAL])
% colorbar




%corr - rangedoppler = 6.4 seconds      of 100 - mean 6.52  (corrtt)
%my_corr - rangedoppler = 4.96 seconds  of 100 - mean 5.169 (mytt)
%corrcoef - rangedoppler= 4.9 seconds   of 100 - mean 5.896 (corrcoeftt)