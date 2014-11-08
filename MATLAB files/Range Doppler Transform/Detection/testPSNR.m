%Test the various SNR levels
%Find if there is a relation between noise floor and SNR
snrs = 0:5:100;
P = zeros(size(snrs));

for i = 1:length(snrs)
    SNR = snrs(i);
    P(i) = getPSNR(SNR);
    disp(i/numel(snrs));
end

%%
figure;
subplot(1,2,1); plot(snrs,P);
lp = log(P);
subplot(1,2,2); plot(snrs,lp)

%Can see that it is linear from about 20db
idx = find(snrs==20);

snrs2 = snrs(idx:end);
lp2 = lp(idx:end);
coef = polyfit(snrs2,lp2,1);
b = coef(1);
a = exp(coef(2));

figure;
plot(snrs2,lp2);
hold on
plot(snrs2,a*exp(b.*snrs2),'r');

PSNR = [snrs',P'];