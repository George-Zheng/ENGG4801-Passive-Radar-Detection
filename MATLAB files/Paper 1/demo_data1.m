posRx = [0 100; 0 100];
n = size(posRx,2);
posTx = [1000; 0];
posTarg = [-200;-200];
freq = 8e6;
N = 40;
noise = 0;

[phi, direct] = signal_gen(posRx, posTx, posTarg, freq, N, noise);

ind = find(phi==direct(1));
ind = ind - (((1:n)-1)*N)';
maxPathLength = N-max(ind);

ymin = min(min(real([phi, direct])))-0.1;
ymax = max(max(real([phi, direct])))+0.1;

fig = figure;
set(gca,'ColorOrder',[1,2]);
hold on
xlim([1 N]);
ylim([ymin ymax]);

hphi = cell(n,1);
for rec = 1:n
    hphi{rec} = plot(nan);
end
hdir = plot(nan,'b');

for i=1:N
    for rec = 1:n
        set(hphi{rec},'YData',phi(1:i,rec));
    end
    set(hdir,'YData',direct(1:i));
    drawnow;
    pause(0.1);
end



