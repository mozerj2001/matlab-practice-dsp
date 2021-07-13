function [X, Y] = DFT241(x, y)
% This script calculates the Discrete Fourier Transform of 2 similar sized 
% arrays, containing real values. The basis of the algorithm can be found
% on Robin Scheibler's blog, under the section "Two for the price of one."

%% Prepare vectors and variables.

N = length(x);
z = x + 1j.*y;    % Input arrays unified in one complex array.

% Preallocate vector to avoid repeated dynamic allocation during loops.
Z = zeros(1, N);

%% Calculate the DFT of z. 
%Z = fft(z)

for k = 1:N
    for n = 1:N
        Z(k) = Z(k) + z(n) * exp(-1i * 2*pi/N * (n-1)*(k-1));
    end
end

%% Separate the transformed values of X and Y from each other (DFT is a linear operation).

X = 0.5 * (Z + conj(circshift(fliplr(Z), 1)));
Y = -1i * 0.5 * (Z - conj(circshift(fliplr(Z), 1)));

end
