%%%%%%         Problem5.1         %%%%%%
clear;close all;clc;

% Set the mean and variance of the Gaussian distribution
mu = 0;
sigma = 1;

% Generate a vector of 10,000 random Gaussian variables
n = 10000;
x = normrnd(mu, sigma, [n, 1]);

% Sort the vector in ascending order
x = sort(x);

% Calculate the empirical CDF of the sorted vector
ecdf = (1:n) / n;

% Calculate the Q-function for the same values as x
qfunc = 0.5 * erfc(x / sqrt(2));

% Calculate the theoretical CDF of the standard normal distribution
z = linspace(-5, 5, 1000);
cdf = 0.5 * erfc(-z / sqrt(2));

% Plot the results
figure;
histogram(x, 'Normalization', 'pdf', 'LineWidth', 2);
hold on;
plot(z, cdf, 'r', 'LineWidth', 2);
plot(x, qfunc, 'g', 'LineWidth', 2);
xlabel('x');
ylabel('Probability Density Function');
legend('Gaussian Distribution', 'Theoretical CDF', 'Q-function');
title('Comparison of Gaussian Distribution, Theoretical CDF, and Q-function');