function [A, B, S, T] = testG(N)
% This script is for testing my second order Goertzel-algo.
% implementation in MATLAB.
% INPUT: N - test-signal array length
% OUTPUT: S - square signal spectrum, T - triangle -||-


%% Declaring test-signals and result arrays
s = square([0:(N-1)]);      % square test signal
t = triang(N);              % triangle test signal
f = cos([1:N]);             % clean sinusoid test signal

S = zeros(1, N);            % pre-defined to avoid repeated
T = zeros(1, N);            % allocation inside the for loop
F = zeros(1, N);

%% Calculating DFTs with the goertzel-function and built-in FFT for comparison

% for loop for the complete DFTs
for i = 1:N
    S(i) = gzl(s, i, N);
    T(i) = gzl(t, i, N);
    F(i) = gzl(f, i, N);
end

% comparison FFTs
A = fft(s);
B = fft(t);
C = fft(f);

%% Plotting results to compare
sq = figure;
hold on
plot([1:N], S, 'b');
plot([1:N], A, 'r');
hold off

tr = figure;
hold on
plot([1:N], T, 'g');
plot([1:N], B, 'r');
hold off

sinusoids = figure;
hold on
plot([1:N], F, 'y');
plot([1:N], C, 'r');
hold off

end