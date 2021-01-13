function [x, y] = iFFT_241(X, Y)
% This is a two-for one inverse Fast Fourier Trasnform script for two real spectral arrays.
% X and Y are the Fourier-Transformed sequences, x and y are the results in
% time (or whatever non-spectral) domain.

N = size(X);

%% First, create a complex array, unifying both inputs.

Z = X + 1j .* Y;
z = zeros(1, N(2));     % unified result array preallocated

%% Second, inverse transform our unified array.

for n = 1:N(2)
    for k = 1:N(2)
        z(n) = z(n) + Z(k) * exp(1j*2*pi*((n-1)*(k-1))/N(2));
    end
end

z = z./N(2);

%% Third, dissect our unified result array to the two result arrays.

x = real(z);
y = imag(z);

end