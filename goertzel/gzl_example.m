function [I, Q] = gzl_example(x, k, N)
w = 2*pi*k/N;
cw = cos(w); c = 2*cw;
sw = sin(w);
z1=0; z2=0; % init
for n = 1 : N
   z0 = x(n) + c*z1 - z2;
   z2 = z1;
   z1 = z0;
end
% real part (in-phase)
I = cw*z1 - z2;
% imaginary part (quadrature-phase)
Q = sw*z1;
end