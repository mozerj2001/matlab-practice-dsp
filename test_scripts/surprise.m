
x = cos([1:1000]);

% The following test is made in regard to the singleIFFT algorithm.

N = length(x);
X = fft(x);

Xe = zeros(1, N/2);
Xo = zeros(1, N/2);

for k = 1:(N/2)
    Xe(k) = 0.5 * (X(k) + conj(X(N/2-k+1)));
    Xo(k) = 0.5 * (X(k) - conj(X(N/2-k+1))) * exp(1j*2*pi*k/N);
end

[xe, xo] = iFFT_241(Xe, Xo);

figure
plot([1:length(xe)], xe, 'r', [1:length(Xe)], ifft(Xe), 'c--');

figure
plot([1:length(xo)], xo, 'r', [1:length(Xo)], ifft(Xo), 'c--');