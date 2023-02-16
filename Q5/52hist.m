%%%%%%         Problem5.2  [hist]       %%%%%%
clear;close all;clc;

% Set the mean and variance of the complex Gaussian distribution
mu = 0;
sigma = 1;

% Generate a vector of 10,000 complex Gaussian variables
n = 10000;
z = normrnd(mu, sigma, [n, 1]) + 1i * normrnd(mu, sigma, [n, 1]);

% Calculate the squared magnitude of the complex Gaussian variables
z_abs2 = abs(z).^2;

% Calculate the empirical probability of |z|^2 < epsilon
epsilon = 0.01;
p_empirical = sum(z_abs2 < epsilon) / n;

% Calculate the theoretical probability of |z|^2 < epsilon
p_theoretical = epsilon;

% Plot the histogram of |z|^2 and the theoretical probability
figure;
histogram(z_abs2, 'Normalization', 'probability', 'FaceColor', [0.5 0.5 0.5]);
hold on;
xline(epsilon, '--r', 'LineWidth', 2);
xlabel('|z|^2');
ylabel('Probability density');
legend('Empirical distribution', 'Theoretical probability');
title('Comparison of Empirical Distribution and Theoretical Probability for |z|^2');

% Print the empirical and theoretical probabilities
fprintf('The empirical probability P(|z|^2 < epsilon) is approximately %f.\n', p_empirical);
fprintf('The theoretical probability P(|z|^2 < epsilon) is %f.\n', p_theoretical);
