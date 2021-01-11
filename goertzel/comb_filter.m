function [Z] = comb_filter(z)
%This is a comb-filter using Goertzel's algorithm to calculate frequency
%domain values.
%INPUT: x - array of time domain values
%OUTPUT: y - frequency domain values

%% Basic help variables.
N = length(z);                              % Sliding window lenght.
y_comb = zeros(1, length(z));       % Sliding window.

%% Variables for Goertzel's algorithm.

% Declaration
k = [0:N-1]';
w = 2*pi/N.*k;
coeff = 2*cos(w);
pV1 = zeros(length(k), 1);          % previousValues1
pV2 = zeros(length(k), 1);          % previousValues2

% Preallocating the y_gortzel matrix to avoid repeated re allocation in the
% for loop
y_goertzel = zeros(N,N);

%% The for-loop of the transform.

% Loop
for i = 0:(length(z)-1)
    
    % Comb filter
    x_comb = z;
    if(i<N)
        y_comb(i+1) = x_comb(i+1);
    else
        y_comb(i+1) = x_comb(i+1) - x_comb(i+1-N);
    end
    
    % Goertzel filter
    x_goertzel = y_comb(i+1);
    v = x_goertzel + coeff .* pV1 - pV2;
    y_goertzel(:,i+1) = (v - exp(-1j*w).*pV1) .* exp(1j*w);
    pV2 = pV1;
    pV1 = v;
    
end
    Z = y_goertzel(:, N)';
end