% This simple MATLAB script was created to test the singleFFT function.

% Create test signals.

a = square([1:1000]);       % simple square function
b = cos([1:1000]);          % simple cosine function, not used in testing
c = a .* b .* pi + 10;            % a bit more complex function, because why not

% Test function and measure time.

tic
A = singleFFT(a);
toc
t_A = toc;

tic
C = singleFFT(c);
toc
t_C = toc;

tic
Aa = fft(a);
toc
tic
Cc = fft(c);
toc

% Plot against results of the built-in function.

figure
plot([1:1000], A, 'r', [1:1000], Aa, 'c--');

figure
plot([1:1000], C, 'r', [1:1000], Cc, 'c--');
