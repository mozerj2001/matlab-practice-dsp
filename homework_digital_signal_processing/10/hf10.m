% load data, set initial variables
load hw_data.mat

fs = 48e3;      % sapmling frequency
N = 1024;       % fft points

IN_ex = abs(fft(input_extended));
OUT_ex = abs(fft(output_extended));


% plot stuff so it looks nice
figure(1)
subplot(411)
plot(input_extended, 'b');
hold on
plot(output_extended, 'r');
legend('input-extended', 'output-extended');
subplot(412)
plot([1:length(IN_ex)]*fs/length(IN_ex), IN_ex, 'b');
hold on
plot([1:length(OUT_ex)]*fs/length(OUT_ex), OUT_ex, 'r');
legend('input-extended', 'output-extended');

% clip the middle of the extended signals to deal with transients
% the signals contain five periods
% then calculate their spectrum
input = input_extended(length(input_extended)*2/5:(length(input_extended)-length(input_extended)*2/5));
output = output_extended(length(output_extended)*2/5:(length(output_extended)-length(output_extended)*2/5));
IN = abs(fft(input));
OUT = abs(fft(output));

% plot stuff, so it looks nice
subplot(413)
plot(input, 'b');
hold on
plot(output, 'r');
legend('input', 'output');
subplot(414)
plot([1:length(IN)]*fs/length(IN), IN, 'b');
hold on
plot([1:length(OUT)]*fs/length(OUT), OUT, 'r');
legend('input', 'output');

H_meas = max(OUT)/max(IN);

% calculate impulse response in frequency domain

G = OUT./IN;
g = ifft(G);

figure(2)
plot(g);