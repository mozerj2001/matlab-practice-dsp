clear all
clc


%% read file, calculate spectrum

[dion, fs] = audioread('dion.wav', 'double');

disp("The sampling frequency is " + fs + ".");

% calculate frequency domain
DION = fft(dion);

%% plot amplitude spectrum

% create axis in Hz
axis_Hz = [0:length(dion)-1] .* fs/length(dion);

% plot spectrum
figure
plot(axis_Hz, abs(DION));
ylabel('amplitude');
xlabel('frequency');
title('Magnitude spectrum');
figure
plot(axis_Hz, mag2db(abs(DION)));
ylabel('amplitude (dB)');
xlabel('frequency');
title('dB spectrum');

disp("She's approximately singing in the 1000-4500 Hz range.");
disp("Based on the frequency range and the continuity of the spectrum, she uses C7 and D7.")
