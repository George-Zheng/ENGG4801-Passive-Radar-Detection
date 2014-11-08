%Test the multiple Rx array
PLOT_RESULTS = true;

%Using 16 receivers in a 4-by-4 array
%Single Transmitter
%Single Target
posRx = [0,0];
posTx = [1000,0];
Targ = [500,-500,200,-200;      %Frequency shift of 207Hz - 414m
        500,-1000,400,-400;     %Frequency shift of 525Hz - 1236m
        0,200,0,0;             %Frequency shift of 0Hz - 220m
        1400,0,-300,300];       %Frequency shift of 440Hz - 800m

freq = 8e6;  %Sampling frequency
cfreq = 220e6; %Carrier frequency
time = 0.01; %seconds
N = time*freq; %Number of samples to generate
SNR = 30; %Higher SNR is better (in dB)

range = 1500;   %can do 20000 (ie 20km)
freqs = -600:20:600;

if PLOT_RESULTS
    figure;
end

%Generate signals
[phi, s, noise, rxdirect] = signal_gen(posRx,posTx,Targ,freq,cfreq,N, SNR);
%Find RD map
[rdmap, ranges] = rangedopplerfft(phi,freq, range, freqs,rxdirect);

%Detection co-efficients (calculated previously)
load('PSNR.mat');

%Find the hits
rdHits = detectTarg(rdmap, ranges,freqs, SNR, PSNR);

Nhit = size(rdHits,1);
param = zeros(Nhit,6);
for j=1:Nhit
    param(j,:) = getEllParam(posRx,posTx,rdHits(j,1));
end

if PLOT_RESULTS
    %plot it
    [X,Y] = meshgrid(ranges, freqs);
    contourf(X,Y,rdmap');
    cb = colorbar;
    set(get(cb, 'Ylabel'),'String','Correlation value \propto RCS/D_{Tx}D_{Rx}');
    title('Range-Doppler Map');
    xlabel('Range (m)');
    ylabel('Doppler (Hz)');
end



% intersect = findEllIntersect(rx(16).ellParam,rx(13).ellParam);
% colormap(flipud(colormap('hot')));

%%
%Plot the results


% figure; hold on;
% plotEll(rx(16).ellParam);
% plotEll(rx(13).ellParam);
% 
% for i=1:size(intersect,1)
%     plot(intersect(i,1),intersect(i,2),'r*');
% end
% 
% plot(rx(16).loc(1),rx(16).loc(2),'g*');
% plot(rx(13).loc(1),rx(13).loc(2),'g*');
% plot(posTx(1),posTx(2),'m*');
