function X = ctFFT(x, N, s)
% This is a generic Cooley-Tukey Fast Fourier Transform script.
% x - Data array the transform will be performed on.
% N - Used length of x.
% s - Stride of the input array.
% The script only works with arrays the size of 2^k, where k is any natural
% number.

X = zeros(1, N);    % Preallocate the result array to avoid 
                    % dynamic allocation every loop.

%%

if N == 1
    % Calculate the Fourier-transformed value of x0.
    
    X(1) = x(1) * exp(-1i * 2*pi/N * 1);
    
else
    % Recursively call this function on the apprpriately indexed values.
    
    n = N/2;                % Precalculate N/2 for aesthetics' sake.
    x_even = zeros(1, n);   % Preallocate arrays to avoid repeated dynamic allocation.
    x_odd = zeros(1, n);
    
    for k = 1:n
        x_even(k) = x(2*k-1);  % Indexing is counter-intuitive here, because
        x_odd(k) = x(2*k);     % MATLAB indexes from 1 up for some reason.
    end
        
    X(1:n) = ctFFT(x_even, n, 2*s);     % Recursively call this function.
    X((n+1):N) = ctFFT(x_odd, n, 2*s);  % -||-
    
    for k = 1:n
        tmp = X(k);
        X(k) = tmp + exp(-2*pi*1i*k/N)*X(k+n);
        X(k+n) = tmp - exp(-2*pi*1i*k/N)*X(k+n);
    end
end

if s == 1
    X = conj(X);
    X = flip(X);
end

end