function X = singleFFT(x)
% This function calculates the Fourier-Transform of a real array.

%% Define starting values, allocate important arrays.

N = size(x);

xe = x(1, 1:2:(N(2)-1));
xo = x(1, 2:2:N(2));

%z = xe + 1j * xo;

[Xe, Xo, ~, ~] = DFT241_zs(xe, xo);

X = zeros(1, N(2));

for k = 1:N(2)
    X(k) = Xe(mod(k, N(2)/2)+1) + Xo(mod(k, N(2)/2)+1) * exp(-1j * 2*pi * k/N(2));
end

X = circshift(X, 1);

end