% This script calculates the average absolute difference between the
% results of my own FFT algorithms and MATLAB's built-in fft functions.

% Create test signals.

a = square([1:1024]);       % simple square function
b = cos([1:1024]);          % simple cosine function, not used in testing
c = a .* b .* pi + 10;            % a bit more complex function, because why not

A = fft(a);
C = fft(c);

N = length(a);

%% Testing the single FFT.

X = singleFFT(a);
Y = singleFFT(b);

P = abs(A - X);
Q = abs(C - Y);

singleFFT_avg_diff_a = mean(P);
singleFFT_avg_diff_c = mean(Q);

%% Testing the Cooley-Tukey algorithm.

X = ctFFT(a, N, 1);
Y = ctFFT(b, N, 1);

P = abs(A - X);
Q = abs(C - Y);

ctFFT_avg_diff_a = mean(P);
ctFFT_avg_diff_c = mean(Q);

%% Testing Goertzel's algorithm in a for-loop.

for i = 1:length(a)
    X(i) = gzl(a, i, N);
end

for i = 1:N
    Y(i) = gzl(c, i, N);
end

P = abs(A - X);
Q = abs(C - Y);

fl_goertzel_avg_diff_a = mean(P);
fl_goertzel_avg_diff_c = mean(Q);

%% Testing the sliding-window Goertzel.

X = sliding_goertzel(a);
Y = sliding_goertzel(b);

P = abs(A - X);
Q = abs(C - Y);

sliding_avg_diff_a = mean(P);
sliding_avg_diff_c = mean(Q);

%% Print results.

disp("The average differences between the built-in fft() and the example codes are:");
disp("singleFFT: a(" + singleFFT_avg_diff_a + ") c(" + singleFFT_avg_diff_c + ")");
disp("ctFFT: a(" + ctFFT_avg_diff_a + ") c(" + ctFFT_avg_diff_c + ")");
disp("for-looped Goertzel: a(" + fl_goertzel_avg_diff_a + ") c(" + fl_goertzel_avg_diff_c + ")");
disp("sliding Goertzel: a(" + sliding_avg_diff_a + ") c(" + sliding_avg_diff_c + ")");












