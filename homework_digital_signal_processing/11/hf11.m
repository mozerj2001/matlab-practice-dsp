% Kahan's method of floating-point summation on 1e6 numbers

num_iter = 1e4;     % Number of iterations
N = 1e3;            % Number of random numbers each iteration


%% The default method:

sum_precise = zeros(1,num_iter);    % array of accurate sums for comparison

 
%% Kahan's method:
 
error_kahan = zeros(1, num_iter);   % array of errors of the Kahan method
sum_kahan = zeros(1, num_iter);     % sums as per the kahan method
error_def = zeros(1, num_iter);     % array of errors of the default method

 for i = 1:num_iter
     numbers = sort(randn(1, N), 'descend');     
     sum_precise(i) = sum(numbers);
     numbers = single(numbers);   
     
     % default method
     c_single = single(numbers);     
     error_def(i) = (sum(c_single) - sum_precise(i))/sum_precise(i);
          
     % prepare array for manual summation per Kahan's method
     for k = 1:N-2
         tempsum = numbers(k) + numbers(k+1);
         tempsum = tempsum - numbers(k);
         tempsum = tempsum - numbers(k+1);
         numbers(k+2) = numbers(k+2) + tempsum;
     end
%      tempsum = numbers(N-1) + numbers(N);
%      tempsum = tempsum - numbers(N-1);
%      tempsum = tempsum - numbers(N);
%      numbers(1) = numbers(1) + tempsum;
%      tempsum = numbers(N) + numbers(1);
%      tempsum = tempsum - numbers(N);
%      tempsum = tempsum - numbers(1);
%      numbers(2) = numbers(2) + tempsum;
     
     % manual summation
     for k = 1:N
        sum_kahan(i) = sum_kahan(i) + numbers(k); 
     end
     error_kahan(i) = (sum_kahan(i) - sum_precise(i))/sum_precise(i);
 end