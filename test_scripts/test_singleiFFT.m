% This simple MATLAB script was created to test the singleIFFT function.

% Create test signals.

a = square([1:1000]);       % simple square function
b = cos([1:1000]);          % simple cosine function, not used in testing
c = a .* b .* pi + 10;            % a bit more complex function, because why not
d = [1:1000];

A = fft(a);
C = fft(c);
D = fft(d);

% Test function and measure time.

tic
aa = singleIFFT(A);
toc
t_A = toc;

tic
cc = singleIFFT(C);
toc
t_C = toc;

dd = singleIFFT(D);

% Plot against results of the built-in function.

figure
plot([1:1000], aa, 'r', [1:1000], a, 'c--');

figure
plot([1:1000], cc, 'r', [1:1000], c, 'c--');

figure
plot([1:1000], dd, 'r', [1:1000], d, 'c--');