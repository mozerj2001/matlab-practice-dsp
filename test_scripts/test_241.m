% This simple MATLAB script is designed to test a two-for-one FFT algorithm.

% Create test signals.

a = square([1:1000]);       % simple square function
b = cos([1:1000]);          % simple cosine function, not used in testing
c = a .* b .* pi + 10;            % a bit more complex function, because why not

% Test DFT_241 as well as IDFT_241, measuring the calculation time.

tic
[A, C] = DFT_241(a, c);
toc

time_241 = toc;

tic
Aa = fft(a);
Cc = fft(c);
toc

% Now plot the results, alongside the results given by the built in fft.

figure
plot([1:1000], A, 'r', [1:1000], Aa, 'c--');

figure
plot([1:1000], C, 'r', [1:1000], Cc, 'c--');
