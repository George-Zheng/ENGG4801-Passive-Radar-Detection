function [rdHits, rdMapDetect] = detectTarg(rdmap, ranges,freqs, SNR, PSNR)
%Detects the locations of targets in the area from the range-doppler map
%using the coefficients of P, that are calculated in the function
%detectModel.
%
%rpmap is a range doppler map
%ranges are the set of ranges that the rdmap takes up
%   size(rdmap,1)==size(ranges,2)
%P = [snrs, level] where snrs is an mx1 matrix with possible SNR values and
%level is and m-by-1 matrix with the corresponding noise floor.
%SNR is the SNR level where the map was recorded
%
%rdHits is the resulting target in the for [Range, Doppler]
%rdMapDetect is the same size as rdmap that is passed into the function but
%with 1's where the targets are and 0's elsewhere

if nargin < 5
    load('PSNR.mat')
end

scale = 20; %The error factor in the model

%We first truncate all non interesting information
%find the noise floor
snrs = PSNR(:,1);
[~,idx] = min(abs(snrs-SNR));
cutOff = scale * PSNR(idx,2);

trunc = rdmap > cutOff;

%Do some Image processing techniques to get hits
s  = regionprops(trunc', 'centroid');
cent = round(cat(1, s.Centroid));
rdMapDetect = zeros(size(rdmap));
for i=1:size(cent,1)
    rdMapDetect(cent(i,1),cent(i,2)) = 1;
end


%Now do the processing for the maximum points
[m, id] = max(rdmap,[],2);
ids = m > cutOff;
ID = id(ids);


%Care for the case where there are no targets
if numel(cent)==0
    rdHits = [];
else
    rdHits = [ranges(ids)', freqs(ID)'];
end

% figure;
% subplot(1,2,1); imagesc(rdmap');
% subplot(1,2,2); imagesc(cutOff'); pause;

