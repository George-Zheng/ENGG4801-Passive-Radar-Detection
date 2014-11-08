%Get the detection things for mult_rx.m

nx = 4; %number in x-direction
ny = 4; %number in y-direction
Rdist = 200;  %200m apart


posRx = getMultRXPos(nx, ny, Rdist);
posTx = [1000,0];
Targ = [500,-500,200,-200];

freq = 8e6;  %Sampling frequency
cfreq = 220e6; %Carrier frequency
time = 0.01; %seconds
N = time*freq; %Number of samples to generate
SNR = 30; %Higher SNR is better (in dB)

%Detection co-efficients (calculated previously)
P = zeros(nx*ny,2);

for i=1:nx*ny
    P(i,:) = getP(posRx(i,:),posTx);
    disp(i/nx/ny);
end