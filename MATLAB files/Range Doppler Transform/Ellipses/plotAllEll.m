function [he, hr, ht] = plotAllEll(rx, posTx)
%A function to help visulaise all of the ellipses and target
%Returns handle to plotted ellipse(he), receiver(hr) and transmitter(ht)

N = size(rx,1);

figure; hold on;
for i=1:N
    EllParam = rx(i).ellParam;
    for j=1:size(EllParam,1);
        he = plotEll(EllParam(j,:));
    end
    hr = plot(rx(i).loc(1),rx(i).loc(2),'r+');
end

if nargin==2
    ht = plot(posTx(1),posTx(2),'g*');
end