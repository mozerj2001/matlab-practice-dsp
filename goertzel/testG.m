function [A, B, S, T] = testG(N)
% This script is for testing my second order Goertzel-algo.
% implementation in MATLAB.
% INPUT: N - test-signal array length
% OUTPUT: S - square signal spectrum, T - triangle -||-


%% Declaring test-signals and result arrays
s = square([1:N]);       % simple square function
t = cos([1:N]);          % simple cosine function, not used in testing
f = s .* t .* pi + 10;            % a bit more complex function, because why not


S = zeros(1, N);            % pre-defined to avoid repeated
T = zeros(1, N);            % allocation inside the for loop
F = zeros(1, N);

%% Calculating DFTs with the goertzel-function and built-in FFT for comparison

% for loop for the complete DFTs

tic
for i = 1:N
    S(i) = gzl(s, i, N);
end
toc

tic
for i = 1:N
F(i) = gzl(f, i, N);
end
toc

% comparison FFTs
A = fft(s);
B = fft(t);
C = fft(f);

%% Plotting results to compare
figure
plot([1:1000], S, 'r', [1:1000], fft(s), 'c--');

figure
plot([1:1000], F, 'r', [1:1000], fft(f), 'c--');




end