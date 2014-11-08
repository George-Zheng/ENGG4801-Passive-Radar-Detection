function P = getP(posRx,posTx)
%REMEMBER THIS MODEL IS FOR CERTAIN SNR AND RCS (radar x-sectional area)
%AND FOR CERTAIN DISTANCE FROM TRANSMITTER

%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, MULTIPLE TARGETS
%NO NOISE, MULTIPLE VELOCITIES
freq = 8e6;
cfreq = 220e6;
time = 0.01; %seconds
N = time*freq;
SNR = 30;

%Range to test over
range = 2000;
freqs = -600:20:600;

velTest = -300:100:300;
Nvel = length(velTest);
Pvec = zeros(Nvel,2);

for i=1:Nvel
    %The velocity to test
    vel = velTest(i);
    %All of the target equally spaced away
    dd = 50;
    Targ = (1000+dd:dd:2000)';
    Speeds = vel*ones(size(Targ,1),2);
    Targ = [Targ zeros(size(Targ,1),1) Speeds];
    
    [phi, s, noise, rxdirect] = signal_gen(posRx,posTx,Targ,freq,cfreq,N, SNR);
    [rdmap, ranges] = rangedopplerfft(phi,freq, range, freqs,rxdirect);
    
    %Processing for fall-off detection
    maxes = max(rdmap,[],2);
    figure; plot(ranges,maxes); pause;
    
%     tol = 500;
%     id = maxes > tol;
    [~,id] = findpeaks(maxes,'Threshold',100);
    
    rc = ranges(id);
    mc = maxes(id);
    
%     figure; plot(rc,mc);
    
    lrc = log(rc);
    lmc = log(mc);
    
    P = polyfit(lrc',lmc,1);
    Pvec(i,:) = P;
    
%     disp(i/Nvel); %Progress
end

P = mean(Pvec);
