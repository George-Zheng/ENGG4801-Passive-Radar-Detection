function out = target_detect2(phi, posRx, posTx, freq, xb, yb, tick)
%A function that returns array of log-likelihood for input phi. 
%An optimized version of target_detect.m
%ALL DISTANCES ARE IN METRES
%
%INPUTS:
%   phi - An array of inputs from receivers in the form [X1, X2,...,Xm]
%         where Xi is a column array of values. Xi can be recovered by
%         Xi = phi(:,i)
%   posRx - the position of each receiver so that posRx(1,i) and posRx(2,i)
%         are the x- and y-positions of receiver i
%   posTx - the position of the transmitter so that posTx = [xpos; ypos]
%   freq - The sampling frequency of the sampled signals
%
%OPTIONAL INPUTS:
%   xb - the x-boundary. xb = [xmin, xmax]. will iterate over this boundary
%   yb - the y-boundary. yb = [ymin, ymax]. will iterate over this boundary
%   tick - the resolution of the iteration in space
%
%OUTPUTS:
%   out - an array of dimensions [diff(yb)/tick + 1, diff(xb)/tick + 1] with log likelihood
%       of each position being a target
%function out

%NOTES:
%   - In code all arrays are row/col == i/j == x/y
%   - At the end out is transposed to get in the correct orientation

%Sort out optional inputs defaults
if nargin < 4
    xb = [-5500,11000];
    yb = [-2000,2000];
    tick = 10;
end

%CONSTANTS
%C = Speed of light (in m/s)
C = 299792458;

%DERIVED CONSTANTS
%m = number of receivers
m = size(posRx,2);
%num_samp = number of samples of each signal taken
num_samp = size(phi,1);
%dt = time between samples (seconds)
dt = 1/freq;
%Initial seeds for eignevalue guesses
eigrowvec = sqrt(1/m)*ones(m,1);
eigcolvec = eigrowvec;

%The possible xy positions to check
x = xb(1):tick:xb(2);
y = yb(1):tick:yb(2);

out = zeros(numel(x),numel(y));

%Iterate through each xy position and receiver
iindex = 0;
for i = x
    iindex = iindex + 1;
    jindex = 0;
    for j = y
        jindex = jindex+1;
        
        %Iterate through each receiver to get the time delay and calculate
        %the number of samples delay to put in nset - the set of sample delays
        nset = zeros(m,1);        
        for rec = 1:m
            %Calculate distance along Target - Rx and time taken
            %Can ignore distance from Tx to ij as is constant for each
            %receiver and ij.
            distRx = hypot(posRx(1,rec)-i,posRx(2,rec)-j);
            travel_time = distRx/C;
            
            %calculate n, number of samples delayed
            nset(rec) = round(travel_time / dt);
        end
        
        %time adjusted signal x'(t) and put into PHI
        %Need to set maxn        
        %Shortest delay will be our starting point
        n = min(nset);
        nset = nset - n;
        %Longest delay will determine how many signals we store for each
        nmax = max(nset);
        nstore = num_samp - nmax;
        
        %Initialise the PHI from paper. PHI = [X1' X2' ... Xm']
        %Note: here X1' does NOT denote transpose
        PHI = zeros(nstore,m);   
         
        for rec = 1:m
            %So we can throw away the first nset samples of each signal to
            %get all signal from the same time
            nstart = nset(rec)+1;
            PHI(:,rec) = phi(nstart:nstart+nstore-1,rec);
        end
        %Here we have PHI for the position (i,j)
        %Calculate Gram Matrix G:
        G = PHI' * PHI;
        
        %INSTEAD OF MAX(EIG(G))
        
%         if (jindex==1) %first col
%             [eigcolvec, lambda, ~] = power_method(m,G,eigcolvec,10,0.1);
%             eigrowvec = eigrowvec;
%         else
%             [eigrowvec, lambda, ~] = power_method(m,G,eigrowvec,10,0.1);
%         end
%         out(iindex,jindex) = lambda;
        
        out(iindex,jindex) = max(eig(G));
    end
end            
out = out';
out = flipud(out);

%CHANGES:
%Changed line 70 from:
%distRx = norm(posRx(:,rec)-[i;j]);
%to:
%distRx = hypot(posRx(1,rec)-i,posRx(2,rec)-j);