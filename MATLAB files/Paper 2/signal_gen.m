function [phi, generated, sig_noise] = signal_gen(posRx, posTx, Targ, freq, carrier_freq, N, noise)
%A function that generates random signal, then distributes it as well as
%off 1 target
%
%ALL DISTANCES ARE IN METRES
%
%INPUTS:
%   posRx - the position of each receiver so that posRx(i,1) and posRx(i,2)
%         are the x- and y-positions of receiver i
%   posTx - the position of each transmitter so that posTx(i,1) and
%         posTx(i,2) are the x- and y-positions of transmitter i
%   Targ - the positions and velovities of the targets so that
%           posTarg(i,:) = [xpos, ypos, xvel, yvel] of target i
%   freq - The sampling frequency of the sampled signals
%   carrier_freq - The carrier waves frequency
%   N - The number of samples we want generated
%   noise - Optional,
%
%OUTPUTS:
%   phi - An array of inputs from receivers in the form [X1, X2,...,Xm]
%         where Xi is a column array of values. Xi can be recovered by
%         Xi = phi(:,i)
%   direct - A vector of the direct path signal from Tx to Rx1 only


%%%%%CHECK INPUTS%%%%%


%CONSTANTS
%C = Speed of light (in m/s)
C = 299792458;

%Amplifying factor for the RCS equation
RCS_AMP = 1000;

if nargin<6
    error('There must be at least 6 arguements');
elseif nargin==6
    noise = 1e-4;                       %VALUEVALUEVALUE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end


%DERIVED CONSTANTS
%nrx = number of receivers
nrx = size(posRx,1);
%ntx = number of transmitters
ntx = size(posTx,1);
%ntarg = number of targets
ntarg = size(Targ,1);
%dt = time between samples (seconds)
dt = 1/freq;

%DTxTarg = Array of distances where D(i,j) = distance from Txi to target j
DTxTarg = zeros(ntx,ntarg);
for i = 1:ntx
    for j = 1:ntarg
        DTxTarg(i,j) = norm(posTx(i,:)-Targ(j,1:2));
    end
end

%DRxTarg = Array of distances where D(i,j) = distance from Rxi to target j
DRxTarg = zeros(nrx,ntarg);
for i = 1:nrx
    for j = 1:ntarg
        DRxTarg(i,j) = norm(posRx(i,:)-Targ(j,1:2));
    end
end

%DTxRx = Array of distances where D(i,j) = distance from Txi to Rxj
DTxRx = zeros(ntx,nrx);
for i = 1:ntx
    for j = 1:nrx
        DTxRx(i,j) = norm(posTx(i,:)-posRx(j,:));
    end
end

%Frequency shift matricies
%FShift(tx,rx,targ) = frequency shift of signal from tx to targ to rx
FShift = zeros(ntx,nrx,ntarg);
for tx = 1:ntx
    for rx = 1:nrx
        for targ = 1:ntarg
            a = Targ(targ,3:4); %Velocity of target (Vx,Vy)
            b = Targ(targ,1:2) - posTx(tx,:);
            c = Targ(targ,1:2) - posRx(rx,:);
            rtx = dot(a,b) / norm(b);   %Component of Tx/Targ motion
            rrx = dot(a,c) / norm(c);   %Component of Rx/Targ motion
            FShift(tx,rx,targ) = rtx + rrx;
        end
    end
end
%%%ACCOUNT FOR FREQ SAMPLING SHIFT
FShift = FShift * carrier_freq / C; %Correct for actual shift


%Calculate maximum travel time of the signal and the equivelant number of
%samples that it would be delayed by
%Not actual maximum, but an upper bound
MAX_DIST = max([DRxTarg(:);0]) + max([DTxTarg(:);0]);
%Case when no targets:
MAX_DIST = max([DTxRx(:);MAX_DIST]);


MAX_TIME = MAX_DIST / C;
MAX_SAMP = round(MAX_TIME / dt);

%Number of generated samples
Ngen = N+MAX_SAMP;
S = randn(Ngen,1) + 1i*randn(Ngen,1);

%Time vector for frequency shifting
timevec = 0:dt:dt*(Ngen-1);
timevec = timevec'; %ensure column

%Initialize phi (will truncate at end)
phi = zeros(Ngen,nrx);

% Give each receiver the signal from each target and transmitter
for trans = 1:ntx
    for rec = 1:nrx
        for targ = 1:ntarg
            R1 = DTxTarg(trans,targ);
            R2 = DRxTarg(rec,targ);
            DIST = R1 + R2;
            TIME = DIST / C;
            SAMP = round(TIME / dt);
            %Get the signal and frequency correct it
            sig = S.*exp(1i*2*pi*FShift(trans,rec,targ)*timevec);
            %Get the correct part of the signal (wrt time)
            sig = sig(1:Ngen-SAMP+1); 
            AMP = RCS_AMP / (R1*R2); %Signal amplitude
            AMP = 1e-1;                                               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%AMPAMPAMPAMP%%%%%%%%%%%
            phi(SAMP:end,rec) = phi(SAMP:end,rec) + AMP*sig;
        end
    end
end

%Give each receiver the direct path signal
for rec = 1:nrx
    for trans = 1:ntx
        DIST = DTxRx(rec);
        TIME = DIST / C;
        SAMP = round(TIME / dt); %Number of samples delayed by
        AMP = (RCS_AMP / DIST); %Signal amplitude
        phi(SAMP+1:end,rec) = phi(SAMP+1:end,rec)+AMP*S(1:Ngen-SAMP);
    end
end

phi = phi(Ngen-N+1:end,:);

%Generate noise
sig_noise = noise*(randn(size(phi)) + 1i*randn(size(phi)));
%Add noise
phi = phi + sig_noise;

generated = S(1:N);
    
    
    
