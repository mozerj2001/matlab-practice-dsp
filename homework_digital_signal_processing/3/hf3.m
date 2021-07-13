% create base variables and generate signal

f = 10;
fs = 1e3;
N = 1e3;

x = sawtooth(2*pi*f/fs*[1:N], 0.5);

%% calculate spectrum

X = fft(x);

%% add zero padding

X2 = zeros(1, 9*N+1+length(X));
X2(1:500) = X(1:500);
X2((length(X2)-498):length(X2)) = X(502:1000);

%% calculate ifft and plot against original signal

x2 = ifft(X2, 'symmetric');

subplot(3,1,1)
plot(x, 'b');
subplot(3,1,2)
plot(x2, 'r');
subplot(3,1,3);
plot(abs(X), 'o');
hold on
plot(abs(X2), 'g');