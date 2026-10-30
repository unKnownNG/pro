%% WIRELESS CHANNEL SIMULATION
% Fading and Doppler Effects
% Rayleigh Channel

clc;
clear;
close all;

%% PARAMETERS
sampleRate500kHz = 500e3;
sampleRate20kHz = 20e3;

maxDopplerShift = 200;

delayVector = (0:5:15)*1e-6;
gainVector = [0 -3 -6 -9];

KFactor = 10;
specDopplerShift = 100;

bitsPerFrame = 1000;

%% RAYLEIGH CHANNEL
rayChan = comm.RayleighChannel( ...
    'SampleRate', sampleRate500kHz, ...
    'PathDelays', delayVector, ...
    'AveragePathGains', gainVector, ...
    'MaximumDopplerShift', maxDopplerShift, ...
    'RandomStream', 'mt19937ar with seed', ...
    'Seed', 10, ...
    'PathGainsOutputPort', true);

%% RICIAN CHANNEL
ricChan = comm.RicianChannel( ...
    'SampleRate', sampleRate500kHz, ...
    'PathDelays', delayVector, ...
    'AveragePathGains', gainVector, ...
    'KFactor', KFactor, ...
    'DirectPathDopplerShift', specDopplerShift, ...
    'MaximumDopplerShift', maxDopplerShift, ...
    'RandomStream', 'mt19937ar with seed', ...
    'Seed', 100, ...
    'PathGainsOutputPort', true);

%% GENERATE INPUT SIGNAL
msg = randi([0 1], bitsPerFrame, 1);

bitPairs = reshape(msg, 2, []);

symbolInput = bitPairs(:,1)*2 + bitPairs(:,2);

modSignal = pskmod(symbolInput, 4, pi/4);

%% PASS SIGNAL THROUGH CHANNELS
[raySignal, rayPathGain] = rayChan(modSignal);

[ricSignal, ricPathGain] = ricChan(modSignal);

figure('Name', 'Wireless Channel Simulation', ...
    'NumberTitle', 'off', ...
    'Position', [100 50 1000 850]);

%% DOPPLER SPECTRUM
numDopplerSamples = 5000;

dopplerInput = complex(zeros(numDopplerSamples,1));

dopplerInput(:) = 1;

[~, dopplerGain] = rayChan(dopplerInput);

dopplerSignal = dopplerGain(:,1);

dopplerSignal = dopplerSignal - mean(dopplerSignal);

N = length(dopplerSignal);

dopplerFFT = fftshift(fft(dopplerSignal));

dopplerPower = abs(dopplerFFT).^2;

dopplerPower = dopplerPower / max(dopplerPower);

dopplerPower_dB = 10*log10(dopplerPower + eps);

frequency = (-N/2:N/2-1)*(sampleRate500kHz/N);

dopplerRange = abs(frequency) <= 1.5*maxDopplerShift;

subplot(3,2,1);

plot(frequency(dopplerRange), ...
    dopplerPower_dB(dopplerRange), 'b');

grid on;

xlabel('Frequency (Hz)');
ylabel('Power (dB)');
title('Doppler Spectrum');

xlim([-300 300]);

%% IMPULSE RESPONSE
sampleNumber = min(497, size(rayPathGain,1));

pathGain = rayPathGain(sampleNumber,:);

subplot(3,2,2);

stem(delayVector*1e6, abs(pathGain), ...
    'filled', 'LineWidth', 1.5);

grid on;

xlabel('Delay (\mus)');
ylabel('Magnitude');

title('Impulse Response');

xlim([-5 20]);

%% FREQUENCY RESPONSE
freq = linspace(-10e3, 10e3, 1000);

H = zeros(size(freq));

for k = 1:length(delayVector)

    H = H + pathGain(k).*exp(-1j*2*pi*freq*delayVector(k));

end

H_dB = 20*log10(abs(H) + eps);

subplot(3,2,3);

plot(freq/1000, H_dB, 'b');

grid on;

xlabel('Frequency (kHz)');
ylabel('dB');

title('Frequency Response');

xlim([-10 10]);

%% SINGLE PATH IMPULSE RESPONSE
singlePathGain = rayPathGain(sampleNumber,1);

subplot(3,2,4);

stem(0, abs(singlePathGain), ...
    'filled', 'LineWidth', 1.5);

grid on;

xlabel('Delay (s)');
ylabel('Magnitude');

title('Impulse Response');

xlim([-2.5e-5 2.5e-5]);

%% SINGLE PATH FREQUENCY RESPONSE
H_single = singlePathGain * ones(size(freq));

H_single_dB = 20*log10(abs(H_single) + eps);

subplot(3,2,5);

plot(freq/1000, H_single_dB, 'b');

grid on;

xlabel('Frequency (kHz)');
ylabel('dB');

title('Frequency Response');

xlim([-10 10]);

%% MULTIPATH GAIN
numSamples = 5000;

inputSignal = ones(numSamples,1);

[~, pathGainLong] = rayChan(inputSignal);

multipathGain = sqrt(sum(abs(pathGainLong).^2, 2));

multipathGain_dB = 20*log10(multipathGain + eps);

timeAxis = (0:numSamples-1)/sampleRate500kHz;

subplot(3,2,6);

plot(timeAxis*1000, multipathGain_dB, 'b');

grid on;

xlabel('Time (ms)');
ylabel('Gain (dB)');

title('Multipath Gain');

release(rayChan);
release(ricChan);

%% DISPLAY RESULTS
disp(' ');

disp('====================================================');

disp(' Wireless Channel Simulation Completed ');

disp('====================================================');

disp(['Sample Rate : ', num2str(sampleRate500kHz), ' Hz']);

disp(['Maximum Doppler : ', num2str(maxDopplerShift), ' Hz']);

disp(['Number of Paths : ', num2str(length(delayVector))]);

disp(['Path Delays : ', num2str(delayVector*1e6), ' microseconds']);

disp(['Path Gains         : ', num2str(gainVector), ' dB']);

disp('====================================================');
