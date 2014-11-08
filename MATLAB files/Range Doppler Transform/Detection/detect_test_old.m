%BAD DETECTION TEST
freq = 8e6;
cfreq = 220e6;
time = 0.01; %seconds
N = time*freq;
SNR = 30;

%Range to test over
range = 2000;
freqs = -600:20:600;


Targ = [-300,-500,200,-200];

posRx = [-300,-300];
posTx = [1000,0];

[phi, s, noise, rxdirect] = signal_gen(posRx,posTx,Targ,freq,cfreq,N, SNR);
[rdmap, ranges] = rangedopplerfft(phi,freq, range, freqs,rxdirect);

%Processing for fall-off detection
maxes = max(rdmap,[],2);
    figure; plot(ranges,maxes);

%     tol = 500;
%     id = maxes > tol;
[~,id] = findpeaks(maxes,'Threshold',100);

rc = ranges(id);
mc = maxes(id);

%     figure; plot(rc,mc);

lrc = log(rc);
lmc = log(mc);

P = polyfit(lrc',lmc,1);