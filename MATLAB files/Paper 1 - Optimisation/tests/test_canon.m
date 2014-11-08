%test_canon.m
%Test Generalised canonical correllation

%There will initially be 5 receivers spaced 50m apart located at origin
%(0,0), (0,50), (0,-50), (-50,0), (50,0)
posRx = [0, 0, 0, -50, 50;
         0,50,-50, 0,  0];

%The transmitter will be located 1km East of the receivers
posTx = [1000;0];

%There will be one stationary target located ~141m NW of the origin Rx
posTarg = [100; -150];

%Sampling Frequency of 220MHz
freq = 220e6;

%Will start with 1000 samples
N = 1000;

clc;

%Generate the 
phi = signal_gen(posRx,posTx,posTarg,freq,N);

xb = [-200,200];
yb = [-200,200];
tick = 1;

out = target_detect2(phi, posRx, posTx, freq, xb, yb, tick);

imshow(out);
colormap(jet);

out2 = out/max(max(out));
figure;
imshow(out2);
colormap(jet);
caxis([min(min(out2)) 1]);
hold on;
h = colorbar;
set(h, 'ylim', [min(min(out2)) 1]);

%Relabel the axes correctly
ttk=50;
set(gca,'YTick',1:ttk:diff(yb)+1);
%set(gca,'YTickLabel','200|150|100|50|0|-50|-100|-150|-200')
set(gca,'YtickLabel',num2str(str2num(get(gca,'YTickLabel'))-1+yb(1)));

set(gca,'XTick',1:ttk:diff(xb)+1);
%set(gca,'XTickLabel','-200|-150|-100|-50|0|50|100|150|200')
set(gca,'XtickLabel',num2str(str2num(get(gca,'XTickLabel'))-1+yb(1)));

%TAKES 21.8 seconds (19.5s)
%35.1 with power_method.m