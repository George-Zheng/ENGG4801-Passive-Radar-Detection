%Generates the range doppler map for a given receiver over a specified
%range of inputs

function [rdmap, ranges, freqs] = rangedoppler(phi, freq, ranges, freqs)
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


rdmap = zeros(numel(ranges),numel(freqs));      rdmap2=zeros(size(rdmap));
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
        %       rdmap(i,j) = sig'*phi(1:numel(sig));
%         [~,~,R] = canoncorr(sig,comp);
%         rdmap(i,j) = R; %% corr or corr2
%         temp = corrcoef(sig,comp);
%         rdmap(i,j) = abs(temp(1,2));
        rdmap(i,j) = abs(corr(sig,comp));
        
    end
end
end

function r = my_corr(a,b)
an = a-mean(a);
bn = b-mean(b);

r = an'*bn/(norm(an) .* norm(bn));

end


