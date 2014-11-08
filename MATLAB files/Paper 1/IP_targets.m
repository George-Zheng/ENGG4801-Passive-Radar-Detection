function out = IP_targets(im)
im=imdilate(im,strel('disk',2,0));
M = round(size(im,1)/2);
N = round(size(im,2)/2);
mask = zeros(size(im));
for i=1:size(mask,1)
    for j=1:size(mask,2)
        if abs(i-M)+abs(j-N)<50
            mask(i,j) = 1;
        end
    end
end

im=im2bw(im,0.8) & not(mask);

CC = bwconncomp(im);

if CC.NumObjects == 0
    out = [];
else
    out = zeros(2,CC.NumObjects);
    for i=1:CC.NumObjects
        [x,y] = ind2sub(size(im),CC.PixelIdxList{i});
        out(:,i) = [mean(x);mean(y)];
    end
end