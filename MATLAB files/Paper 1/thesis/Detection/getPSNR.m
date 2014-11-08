function P = getPSNR(SNR)

posRx = [0,0];
posTx = [1000,0];
Targ = [];

freq = 8e6;  %Sampling frequency
cfreq = 220e6; %Carrier frequency
time = 0.01; %seconds
N = time*freq; %Number of samples to generate

range = 1000;   %can do 20000 (ie 20km)
freqs = -400:20:400;

NT = 10;
P=0;
for i=1:NT
    [phi, ~, ~, rxdirect] = signal_gen(posRx,posTx,Targ,freq,cfreq,N, SNR);
    [rdmap, ~] = rangedopplerfft(phi,freq, range, freqs,rxdirect);
    P = max([P,max(rdmap(:))]);
end