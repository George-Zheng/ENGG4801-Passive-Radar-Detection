%test_canon.m
%Test Generalised canonical correllation

%There will initially be 5 receivers spaced 50m apart located at origin
%(0,0), (0,50), (0,-50), (-50,0), (50,0)
posRx = [0, 0, 0, -50, 50;
         0,50,-50, 0,  0];
     
% posRx = [0,0,0;0,50,-50];

%The transmitter will be located 1km East of the receivers
posTx = [1000;0];

%There will be one stationary target located ~141m NW of the origin Rx
posTarg = [100, 20;
          -150, 100];

%Area to check over
xb = [-200,200];
yb = [-200,200];
tick = 1; %increments

%Sampling Frequency of 220MHz
freq = 220e6;

%Will start with 1000 samples
N = 1000;

clc;

%Generate the signals
phi = signal_gen(posRx,posTx,posTarg,freq,N);



%%
%SOLVE THE SYSTEM
out = target_detect2(phi, posRx, posTx, freq, xb, yb, tick);

%%
%Plot it all

% imshow(mat2gray(out));
% colormap(jet);

% out2 = out/max(out(:));
out2 = mat2gray(out);
figure;
imshow(out2);
colormap(jet);
caxis([min(min(out2)) 1]);
hold on;
h = colorbar;
set(h, 'ylim', [min(min(out2)) 1]);

%plot the receivers
plot(posRx(1,:)-xb(1)+1,posRx(2,:)-yb(1)+1,'o','MarkerEdgeColor','k',...
    'MarkerFaceColor','m','LineWidth',2,'MarkerSize',10);

targ = IP_targets(out2);
if size(targ,2)>0
    plot(targ(2,:),targ(1,:),'o','MarkerEdgeColor','k',...
    'MarkerFaceColor','n','LineWidth',2,'MarkerSize',10);
end


%Relabel the axes correctly
tick_spacing=50;
ttk = tick_spacing/tick;
set(gca,'YTick',1:ttk:diff(yb)+1);
% set(gca,'YTickLabel','200|150|100|50|0|-50|-100|-150|-200')
set(gca,'YtickLabel',num2str(-tick*(str2num(get(gca,'YTickLabel'))-1)+yb(2)));

set(gca,'XTick',1:ttk:diff(xb)+1);
%set(gca,'XTickLabel','-200|-150|-100|-50|0|50|100|150|200')
set(gca,'XtickLabel',num2str(tick*(str2num(get(gca,'XTickLabel'))-1)+yb(1)));

%TAKES 21.8 seconds (19.5s)
%35.1 with power_method.m