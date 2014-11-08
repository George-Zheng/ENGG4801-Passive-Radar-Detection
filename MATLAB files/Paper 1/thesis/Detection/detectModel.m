%REMEMBER THIS MODEL IS FOR CERTAIN SNR AND RCS (radar x-sectional area)
%AND FOR CERTAIN DISTANCE FROM TRANSMITTER

%This script is used to find the best fit curve for detection
PLOT_RESULTS = false;


%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, MULTIPLE TARGETS
%NO NOISE, MULTIPLE VELOCITIES
posRx = [0,0];
posTx = [1000,0];
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
    
    %Plot results
    if PLOT_RESULTS
        figure;
        [X,Y] = meshgrid(ranges, freqs);
        contourf(X,Y,rdmap');
    end
    
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
    Pvec(i,:) = P;
    
    disp(i/Nvel); %Progress
end

% figure; plot(lrc,lmc);
% hold on;
% plot(lrc,lrc*P(1) + P(2),'r');

if PLOT_RESULTS
    %Plot the results
    figure; plot(ranges,maxes);
    hold on;
    plot(ranges,exp(P(2))*ranges.^P(1),'r');
    axis([min(ranges) max(ranges) 0 max(maxes)]);
end

%From these results we can conclude that velocity does not affect detection
P = mean(Pvec);
