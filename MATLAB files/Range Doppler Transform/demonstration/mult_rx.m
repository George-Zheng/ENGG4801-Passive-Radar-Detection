%Test the multiple Rx array

PLOT_RESULTS = true;

%Using 16 receivers in a 4-by-4 array
%Single Transmitter
%Single Target

nx = 4; %number in x-direction
ny = 4; %number in y-direction
Rdist = 200;  %200m apart


posRx = getMultRXPos(nx, ny, Rdist);
posTx = [1000,0];
% Targ = [1100,500,200,-200];
Targ = [1100,500,200,-200;
        0,700,0,0];

freq = 8e6;  %Sampling frequency
cfreq = 220e6; %Carrier frequency
time = 0.01; %seconds
N = time*freq; %Number of samples to generate
SNR = 30; %Higher SNR is better (in dB)

%Detection co-efficients (calculated previously)
load('PSNR.mat');

range = 1000;   %can do 20000 (ie 20km)
freqs = -400:20:400;



%Will store results in a structure array
%Preallocate the array
rx = repmat(struct('loc',0,'rdmap',0,'rdHits',0,'ellParam',[]),nx*ny,1);

if PLOT_RESULTS
    figure;
    suptitle('Range-Doppler Maps for all receivers');
end

tic
for i=1:nx*ny
    [phi, s, noise, rxdirect] = signal_gen(posRx(i,:),posTx,Targ,freq,cfreq,N, SNR);
    [rdmap, ranges] = rangedopplerfft(phi,freq, range, freqs,rxdirect);
    
    %Store the info in the struct array
    rx(i).loc = posRx(i,:);
    rx(i).rdmap = rdmap;
    rx(i).rdHits = detectTarg(rdmap, ranges,freqs, SNR, PSNR);
    
    Nhit = size(rx(i).rdHits,1);
    param = zeros(Nhit,6);
    for j=1:Nhit
        param(j,:) = getEllParam(posRx(i,:),posTx,rx(i).rdHits(j,1));
    end
    rx(i).ellParam = param;
    
    if PLOT_RESULTS
        %Make sure it looks right (plots in the right place)
        [idi, idj] = ind2sub([ny,nx],i);
        idi = mod(-idi,ny)+1;
        sub2ind([nx,ny],idj,idi);
        subplot(ny,nx,sub2ind([nx,ny],idj,idi));
        
        %plot it
        [X,Y] = meshgrid(ranges, freqs);
        contourf(X,Y,rdmap');
        title(['(x,y) = (' num2str(posRx(i,1)) ',' num2str(posRx(i,2)) ')']);
        drawnow;
    end
    
    %Progress bar
    disp(i/nx/ny);
end
TIMER = toc; %time it

disp(['Average time taken to simulate, display and detect is ' num2str(TIMER/nx/ny) ' seconds']);


TARGET_LOC = getTargetLocation(rx);


%%
%Plot the results
[he, hr, ht] = plotAllEll(rx,posTx);
title('XY domain Ellipse plots');
legend([he, hr, ht], 'Ellipses','Rx','Tx');

% Find 1 interection and plot it
ID1 = 13;
ID2 = 16;

intersect = findEllIntersect(rx(ID1).ellParam(1,:),rx(ID2).ellParam(1,:));

figure; hold on;
plotEll(rx(16).ellParam(1,:));
plotEll(rx(13).ellParam(1,:));

for i=1:size(intersect,1)
    plot(intersect(i,1),intersect(i,2),'r*');    
end

plot(rx(16).loc(1),rx(16).loc(2),'g*');
plot(rx(13).loc(1),rx(13).loc(2),'g*');
plot(posTx(1),posTx(2),'m*');

title(['Intersection of 1 point from Rx' num2str(ID1) ' and Rx' num2str(ID2)]);