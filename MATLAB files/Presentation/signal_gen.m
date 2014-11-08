function [phi, direct] = signal_gen(posRx, posTx, posTarg, freq, N, noise)
%A function that generates random signal, then distributes it as well as
%off 1 target
%
%ALL DISTANCES ARE IN METRES
%
%INPUTS:
%   posRx - the position of each receiver so that posRx(1,i) and posRx(2,i)
%         are the x- and y-positions of receiver i
%   posTx - the position of the transmitter so that posTx = [xpos; ypos]
%   posTarg - the positions of the targets so that
%           posTarg(:,i) = [xpos taget i; ypos target i]
%   freq - The sampling frequency of the sampled signals
%   N - The number of samples we want generated
%   noise - Optional, 
%
%OUTPUTS:
%   phi - An array of inputs from receivers in the form [X1, X2,...,Xm]
%         where Xi is a column array of values. Xi can be recovered by
%         Xi = phi(:,i)
%   direct - A vector of the direct path signal from Tx to Rx1 only

%CONSTANTS
%C = Speed of light (in m/s)
C = 299792458;
%alpha = Signal degredation (/m or m^-1) Range: 0-1;
%0 is full signal degredation and 1 is none
%alpha = 1;


%CHANGES:
%
%posRx(:,1)  = [x1;y1] of the directional receiver

if nargin<5
    error('There must be at least 5 arguements');
elseif nargin==5
    noise = 0;
end


%DERIVED CONSTANTS
%m = number of receivers
m = size(posRx,2);
%numtarg = number of targets
numtarg = size(posTarg,2);
%dt = time between samples (seconds)
dt = 1/freq;
%DTxTarg = Array of distances where D(i) = distance from transmitter to
%targeti
DTxTarg = zeros(numtarg,1);
for targ = 1:numtarg
    DTxTarg(targ) = norm(posTx-posTarg(:,targ));
end

%DTargRx = Array of distances where D(i,j) = distance from Rxi to target j
DTargRx = zeros(m,numtarg);
for rec = 1:m
    for targ = 1:numtarg
        DTargRx(rec,targ) = norm(posTarg(:,targ)-posRx(:,rec));
    end
end
%DTxRx = Array of distances where D(i) = distance from Tx to Rxi
DTxRx = zeros(m,1);
for rec = 1:m
    DTxRx(rec) = norm(posTx-posRx(:,rec));
end

%Calculate maximum travel time of the signal and the equivelant number of
%samples that it would be delaed by
MAX_DIST = max(DTargRx(:)) + max(DTxTarg);
MAX_TIME = MAX_DIST / C;
MAX_SAMP = round(MAX_TIME / dt)+1;

%Number of generated samples
Ngen = N+MAX_SAMP;
S = randn(Ngen,1) + 1i*randn(Ngen,1);

%Initialize phi (will truncate at end)
phi = zeros(Ngen,m);

% Give each receiver the target signal
% The first signal gets only the direct path signal
for rec = 1:m
    for targ = 1:numtarg
        DIST = DTxTarg(targ) + DTargRx(rec,targ);
        TIME = DIST / C;
        SAMP = round(TIME / dt);
        phi(SAMP:end,rec) = phi(SAMP:end,rec) + S(1:Ngen-SAMP+1);
    end
end

%Give each receiver the original signal
% Only the first signal gets direct path
for rec = 1:m
    DIST = DTxRx(rec);
    TIME = DIST / C;
    SAMP = round(TIME / dt);
%     phi(SAMP:end,rec) = phi(SAMP:end,rec)+S(1:Ngen-SAMP+1);
    if rec==1
        direct = zeros(Ngen,1);
        direct(SAMP:end) = S(1:Ngen-SAMP+1);
        direct = direct(Ngen-N+1:end);
    end
end
 
    
phi = phi(Ngen-N+1:end,:);



