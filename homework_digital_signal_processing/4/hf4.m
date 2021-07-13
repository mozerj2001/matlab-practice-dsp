%% load file, print Fs, determina and print duration

[s, fs] = audioread('dtmfsignal.wav', 'double');
T = length(s)/fs;
disp("Time duration of the signal is " + T + " seconds, at a sampling frequency of " + fs + "Hz");

% sound(s, fs);

%% spectral analysis

% periodogram analysis
nfft = length(s);
window = hann(length(s));
[Pxx_p, F_p] = periodogram(s, window, nfft, fs);

% pwelch analysis
nfft = 256;
window = hann(256);
noverlap = 128;
[Pxx_w, F_w] = pwelch(s, window, noverlap, nfft, fs);

% spectrogram analysis
Pxx_s = spectrogram(s, window, noverlap, nfft, fs);

%% plot the result spectra for comparison's sake

subplot(3,1,1)
plot(F_p, Pxx_p, 'b');
subplot(3,1,2)
plot(F_w, Pxx_w, 'r')
subplot(3,1,3)
spectrogram(s, window, noverlap, nfft, fs);
colorbar

disp("The dialed tone is 1 - 0 - 4, the call was unsuccesful, as the recipient was busy. (I read the values off the spectrogram and looked them up in the dtmf documentation.)");
disp("The spectrogram makes sense to be used, since besides the usual amplitude-frequency scales, it also offers a time axis.");