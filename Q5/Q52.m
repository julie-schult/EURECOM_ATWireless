%%%%%%         Problem5.2         %%%%%%
clear;close all;clc;

% Set the mean and variance of the complex Gaussian distribution

mu = 0;
sigma = 1;

% Generate a vector of 10,000 complex Gaussian variables
n = 10000;
z = normrnd(mu, sigma, [n, 1]) + 1i * normrnd(mu, sigma, [n, 1]);

% Sort the vector in ascending order of the magnitude
[~, idx] = sort(abs(z));
z = z(idx);

% Calculate the empirical CDF of the sorted magnitudes
ecdf = (1:n) / n;

% Calculate the theoretical CDF of the Rayleigh distribution
epsilon = 1e-3;
r = linspace(0, 5, 1000);
cdf = 1 - exp(-pi * r.^2 / (2 * sigma^2));

% Plot the results
figure;
semilogy(abs(z), ecdf, 'LineWidth', 2);
hold on;
semilogy(r, cdf, 'r', 'LineWidth', 2);
xlabel('|z|');
ylabel('P(|z| > |z_0|)');
legend('Empirical CDF', 'Theoretical CDF');
title('Comparison of Empirical CDF and Theoretical CDF for Complex Gaussian Variables');

% Check the near-zero behavior
p = ecdf(abs(z) < epsilon);
if ~isempty(p)
    p = p(end);
    fprintf('The empirical probability P(|z| < epsilon) is approximately %f.\n', p);
else
    fprintf('There are no samples with |z| < epsilon.\n');
end
