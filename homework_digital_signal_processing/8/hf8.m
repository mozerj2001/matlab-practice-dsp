% A,B,C and f should be determined via the iterative solution
load sine_data2.mat
N = length(x);
%% frequency estimation using the Fourier-transformation

Nfft = 1024;
[Yxx, f] = pwelch(y, gausswin(Nfft), Nfft/2, Nfft);
[~, ind] = max(Yxx);

freq_est = f(ind);

% calculate sampling frequency for later
% 580 samples per period
% estimated frequency is 0.0123
% fs = 580*0.0123
fs = 580 * freq_est;



%% approximation of the linear problem
% (Acos() + Bsin() + C)
% y_fit = K*p
% p = (K'K)^-1*K'*y

ph = 2*pi*freq_est/fs*(0:(N-1))';

% system matrix
K = [cos(ph), sin(ph), ones(N,1)];


p = (K'*K)^-1 * (K'*y');

A = p(1);
B = p(2);
C = p(3);

y_fitted = K*p;

