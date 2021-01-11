function X = sliding_goertzel(x)
%This is a sliding Goertzel algorithm, designed to calculate the frequency
%domain values of an array of time domain values.
%INPUT: x - array of time-domain values
%OUTPUT: X - F(x) time domain values
%NOTE: This method is built for efficiency and real-time applications,
%therefore it can be inaccurate.

%% Pre-defining variables and Goertzel-constants.

N = length(x);      % window size

% Variables needed by the Goertzel-algorithm
A = 2*pi*k/N;       % constant
B = cos(A);         % constant
C = exp(-1j*A);     % complex constant (basically a sinus)
             
s1 = 0;             % these need to be pre-defined
s2 = 0;             % to avoid errors in the recursion.

%% The preceding N-delay comb-filter.

