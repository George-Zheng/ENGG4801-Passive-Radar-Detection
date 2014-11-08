%Generates the range doppler map for a given receiver over a specified
%range of inputs

function [rdmap, ranges, freqs] = rangedoppler_direct(phi, freq, ranges, freqs)
%Inputs
%   phi is an Nx1 column vector of the samples received at receiver of
%   interest.
%   freq is the sampling freq in Hz
%   ranges as a 1-D increasing vector containing the ranges of interest.
%   All ranges must be in metres. ranges(i) >=0.
%   freqs is similar to ranges except for frequencies of interest. freqs is
%   in Hz


%CONSTANTS
%C = Speed of light (in m/s)
C = 299792458;


rdmap = zeros(numel(ranges),numel(freqs));
dt = 1/freq;
t = 0:dt:dt*(numel(phi)-1);
t = t';

j=0; %index
for f = freqs
    j=j+1; %index
    i=0;
    
    %frequency correc the signal
    fc_sig = phi.*exp(-1i*2*pi*f*t);
    
    for r = ranges
        i=i+1; %index stuff
        
        %Correct the signal range
        travel_time = r/C;
        %number of samples delayed by:
        num_delay = round(travel_time/dt);
        %range corrected signal
        sig = fc_sig(num_delay+1:end);
        comp = phi(1:numel(sig));
        %Calculate metric
        rdmap(i,j) = abs(corr(sig,comp));
    end
end


