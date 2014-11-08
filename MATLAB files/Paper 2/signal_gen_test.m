SHOW_RESULTS = true;

%%
%signal_gen_test

%TEST FOR 1 TRANSMITTER, 2 RECEIVERS, 0 TARGETS
%NO NOISE
%EXPECT SIGNAL DELAY OF 3 SAMPLES
posRx = [0,0;
    0,-500];
posTx = [1000,0];
Targ = [];
freq = 8e6;
cfreq = 220e6;
N = 10;

[phi, s] = signal_gen(posRx,posTx,Targ,freq,cfreq,N);

if SHOW_RESULTS
    phi(1:5,1)
    phi(4:8,2)
end
%%%%%%%%%%%%%%%%%
%   CONFIRMED   %
%%%%%%%%%%%%%%%%%

%%

%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, 1 TARGETS
%NO NOISE, NO VELOCITY
%EXPECT SIGNAL DELAY OF 11 SAMPLES
%PHI(n) <--> S(n) + s(n-11)
posRx = [0,0];
posTx = [1000,0];
Targ = [500,-500,0,0];
freq = 8e6;
cfreq = 220e6;
N = 20;

[phi, s] = signal_gen(posRx,posTx,Targ,freq,cfreq,N);

if SHOW_RESULTS
    DELAYED = s(1:end-11) + s(12:end);
    idx = find(phi(1)==DELAYED);
    phi(1:5)   %SHOW FIRST FIVE SAMPLES
    DELAYED(idx:idx+4)
end
%%%%%%%%%%%%%%%%%
%   CONFIRMED   %
%%%%%%%%%%%%%%%%%

%%
%FREQUENCY SHIFT TEST
%TEST FOR 1 TRANSMITTER, 1 RECEIVERS, 1 TARGETS
%NO NOISE, NON ZERO VELOCITY
%EXPECT SIGNAL DELAY OF 11 SAMPLES
%PHI(n) <--> S(n)e^j2pif t + s(n-11)   f = 7.5
posRx = [0,0];
posTx = [1000,0];
Targ = [500,-500,200,-200];
freq = 8e6;
cfreq = 220e6;
N = 20000;

[phi, s] = signal_gen(posRx,posTx,Targ,freq,cfreq,N);

if SHOW_RESULTS
    DELAYED = s(1:end-11) + s(12:end);
    idx = find(phi(1)==DELAYED);
    
    idx = 3;
    
    %     phi(1:5)   %SHOW FIRST FIVE SAMPLES
    %     DELAYED(idx:idx+4)
    DEL = DELAYED(idx:idx+numel(phi)-1);
    
    p1 = abs(phi(1:100));
    p2 = abs(DEL(1:100));
    p3 = abs(phi(end-100:end));
    p4 = abs(DEL(end-100:end));
    
    %Testing correlation
    %Irrelevant now, see freq_test.m in understanding
    %Works fine
%     corr(p1,p2)
%     corr(p3,p4)
    
%     figure;
%     subplot(1,2,1);
%     plot(p1,'b');
%     hold on
%     plot(p2,'r');
%     axis([0,100,0,5])
%     
%     subplot(1,2,2);
%     plot(p3,'b');
%     hold on
%     plot(p4,'r');
%     axis([0,100,0,5])
    
end

