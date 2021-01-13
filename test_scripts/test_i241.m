% This simple MATLAB script is made to test the inverse two-for-one FFT
% script.


% Declaration of used vectors and FFT.
x = square([1:1000]);       % simple square function
y = cos([1:1000]);          % simple cosine function, not used in testing
z = x .* y .* pi + 10;            % a bit more complex function, because why not

A = fft(x);
C = fft(z);

% IFFT

tic
[a, c] = iFFT_241(A, C);
toc

time_i241 = toc;

tic
aa = ifft(A);
cc = ifft(C);
toc

% Now plot the results, alongside the results given by the built in ifft.

figure
plot([1:1000], a, 'r', [1:1000], aa, 'c--');

figure
plot([1:1000], c, 'r', [1:1000], cc, 'c--');