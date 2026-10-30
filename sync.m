clc;
clear;
close all;

%% PARAMETERS
N = 64;
CP = 16;
numSymbols = 100;
SNRdB = 22;
SNR = 10^(SNRdB/10);
DopplerFreq = 120;
Fs = 15000;

rng(1);

pilotIndex = 1:4:N;
dataIndex = setdiff(1:N, pilotIndex);
numData = length(dataIndex);

numberOfBits = numData*numSymbols*2;

%% GENERATE RANDOM DATA
inputBits = randi([0 1], numberOfBits, 1);

inputBits = reshape(inputBits, 2, [])';

inputSym = ((1-2*inputBits(:,1)) ...
    + 1i*(1-2*inputBits(:,2)))/sqrt(2);

%% CREATE OFDM TRANSMITTED GRID
txGrid = zeros(N, numSymbols);

count = 1;

for k = 1:numSymbols

    txGrid(pilotIndex,k) = 1;

    txGrid(dataIndex,k) = inputSym(count:count+numData-1);

    count = count + numData;

end

%% OFDM MODULATION
txSignal = [];

for k = 1:numSymbols

    symbol = ifft(txGrid(:,k),N);

    symbol = [symbol(end-CP+1:end); symbol];

    txSignal = [txSignal; symbol];

end

%% ADD SYNCHRONIZATION SIGNAL
syncSignal = ones(N,1);

txSignal = [syncSignal; txSignal];

numSamples = length(txSignal);

t = (0:numSamples-1)'/Fs;

%% DOPPLER AND RAYLEIGH FADING CHANNEL
doppler = exp(1i*2*pi*DopplerFreq*t);

h = (randn(numSamples,1) ...
    + 1i*randn(numSamples,1))/sqrt(2);

channel = h.*doppler;

channel = channel./sqrt(mean(abs(channel).^2));

rxSignal = txSignal.*channel;

%% ADD AWGN NOISE
signalPower = mean(abs(rxSignal).^2);

noisePower = signalPower/SNR;

noise = sqrt(noisePower/2).*( ...
    randn(size(rxSignal)) + 1i*randn(size(rxSignal)));

rxSignal = rxSignal + noise;

%% SYNCHRONIZATION USING CORRELATION
correlation = abs(conv(rxSignal, ...
    flipud(conj(syncSignal)), 'valid'));

[~,offset] = max(correlation);

fprintf('\nSynchronization offset = %d samples\n',offset);

figure;

plot(correlation);

grid on;

xlabel('Sample');
ylabel('Correlation');

title('Synchronization');

%% REMOVE SYNCHRONIZATION SIGNAL
start = offset+N;

requiredLength = (N+CP)*numSymbols;

if start+requiredLength-1 <= length(rxSignal)

    rxSignal = rxSignal(start:start+requiredLength-1);

else

    start = N+1;

    rxSignal = rxSignal(start:start+requiredLength-1);

end

%% OFDM DEMODULATION
rxGrid = zeros(N,numSymbols);

position = 1;

for k = 1:numSymbols

    symbol = rxSignal(position:position+N+CP-1);

    symbol = symbol(CP+1:end);

    rxGrid(:,k) = fft(symbol,N);

    position = position+N+CP;

end

%% CHANNEL ESTIMATION
estChannel = zeros(N,numSymbols);

for k = 1:numSymbols

    receivedPilot = rxGrid(pilotIndex,k);

    transmittedPilot = txGrid(pilotIndex,k);

    pilotChannel = receivedPilot./transmittedPilot;

    estChannel(:,k) = interp1(pilotIndex, ...
        pilotChannel,1:N,'linear','extrap');

end

%% MMSE EQUALIZATION
eqGrid = zeros(N,numSymbols);

for k = 1:numSymbols

    H = estChannel(:,k);

    eqGrid(:,k) = (conj(H)./(abs(H).^2+1/SNR)) ...
        .*rxGrid(:,k);

end

%% EVM CALCULATION
txData = txGrid(dataIndex,:);

rxData = rxGrid(dataIndex,:);

eqData = eqGrid(dataIndex,:);

rxError = txData-rxData;

eqError = txData-eqData;

preEqualisedEVM = sqrt( ...
    mean(abs(rxError(:)).^2) / ...
    mean(abs(txData(:)).^2))*100;

postEqualisedEVM = sqrt( ...
    mean(abs(eqError(:)).^2) / ...
    mean(abs(txData(:)).^2))*100;

fprintf('\n');

fprintf('Percentage RMS EVM of Pre-Equalized signal: %.3f%%\n', ...
    preEqualisedEVM);

fprintf('Percentage RMS EVM of Post-Equalized signal: %.3f%%\n', ...
    postEqualisedEVM);

%% RECEIVED SIGNAL
figure;

imagesc(abs(rxGrid));

axis xy;
colorbar;

xlabel('OFDM Symbols');
ylabel('Subcarriers');

title('Received Signal');

%% ESTIMATED CHANNEL
figure;

imagesc(abs(estChannel));

axis xy;
colorbar;

xlabel('OFDM Symbols');
ylabel('Subcarriers');

title('Estimated Channel');

%% EQUALIZED SIGNAL
figure;

imagesc(abs(eqGrid));

axis xy;
colorbar;

xlabel('OFDM Symbols');
ylabel('Subcarriers');

title('Equalized Signal');

%% CONSTELLATION BEFORE EQUALIZATION
figure;

plot(real(rxData(:)),imag(rxData(:)),'.');

grid on;
axis equal;

xlabel('In-Phase');
ylabel('Quadrature');

title('Before Equalization');

%% CONSTELLATION AFTER MMSE EQUALIZATION
figure;

plot(real(eqData(:)),imag(eqData(:)),'.');

grid on;
axis equal;

xlabel('In-Phase');
ylabel('Quadrature');

title('After MMSE Equalization');

%% RAYLEIGH FADING WITH DOPPLER EFFECT
figure;

plot(20*log10(abs(channel)+eps));

grid on;

xlabel('Sample');
ylabel('Channel Gain (dB)');

title('Rayleigh Fading with Doppler Effect');
