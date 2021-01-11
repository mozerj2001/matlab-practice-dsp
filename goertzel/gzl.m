function [R, I] = gzl(x, k, N)
% This function calculates the kth element of a discrete Fourier-Transform
% according to the second order Gortzel algorithm.
% INPUT: k - index, x - signal
% OUTPUT: R - real part of the result, I - imaginary part of the result

%% Precalculating constants and help-variables to increase efficiency

%N = size(x);        % signal length

A = 2*pi*k/N;       % constant
B = cos(A);         % constant
C = exp(-1j*A);     % complex constant
             
s1 = 0;             % these need to be pre-defined
s2 = 0;             % to avoid errors in the recursion.

%% Calculate help-variables

for n = 1:N
    s0 = x(n) + 2*B*s1 - s2;
    s2 = s1;
    s1 = s0;
end

%% Calculating the result y

R = B*s1 - s2;      % real part of the result
I = s1*C;           % the complex result X[k]

end