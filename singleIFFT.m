function [x, xe, xo, Xe, Xo] = singleIFFT(X)
% This functon calculates the inverse Fourier-Transform of a single real
% array.

N = size(X);

Xe = zeros(1, N(2)/2);
Xo = zeros(1, N(2)/2);

for k = 1:(N(2)/2)
    Xe(k) = 0.5 * (X(k) + conj(X(N(2)/2-k+1)));
    Xo(k) = 0.5 * (X(k) - conj(X(N(2)/2-k+1))) * exp(1j*2*pi*k/N(2));
end

[xe, xo, ~, ~] = iFFT(Xe, Xo);

x(1, 1:2:(N(2)-1)) = xe;
x(1, 2:2:N(2)) = xo;

end