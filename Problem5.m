%% Q-function
%  Q-function can be calculated using the built-in qfunc function
N = 10000; % Number of samples
T = 1:10; % Threshold
Z = randn(1,N);  % Generate standard normal random variables
tail = zeros(size(T)); % Tail probability
q = zeros(size(T)); % Q-func probability
for i = 1:size(T)
    tail(i) = sum(Z > i)/N; 
    q(i) = (T(i));
end
plot(T,tail)
hold on;
plot(T,q)
%%