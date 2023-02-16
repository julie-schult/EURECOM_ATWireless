%%%%%%         Problem5.4   [hist]      %%%%%%

k = 5; % number of degrees of freedom
n = 10000; % number of samples
sigma = 1; % standard deviation of the complex Gaussian distribution

% generate complex Gaussian random variables
z = sigma * (randn(n, k) + 1i * randn(n, k));

% compute the chi-squared random variables with 2k degrees of freedom
h = sum(abs(z).^2, 2);

% set the values of epsilon and compute the probabilities
epsilons = [0.01, 0.001, 0.0001];
probs = zeros(length(epsilons), 1);
for i = 1:length(epsilons)
    probs(i) = sum(h < epsilons(i)^k) / n;
end

% plot the complex Gaussian distributions
figure;
histogram(abs(z(:, 1)).^2, 50, 'Normalization', 'pdf', 'FaceColor', 'b');
hold on;
histogram(abs(z(:, 2)).^2, 50, 'Normalization', 'pdf', 'FaceColor', 'r');
histogram(abs(z(:, 3)).^2, 50, 'Normalization', 'pdf', 'FaceColor', 'g');
xlabel('|z|^2');
ylabel('Probability density');
title('Complex Gaussian distributions');
legend({'k = 1', 'k = 2', 'k = 3'}, 'Location', 'Northwest');
set(gca, 'FontSize', 12);
grid on;

% plot the near-zero behavior of the chi-squared random variable
figure;
histogram(h, 50, 'Normalization', 'pdf');
hold on;
for i = 1:length(epsilons)
    plot([epsilons(i)^k, epsilons(i)^k], [0, 1], '--', 'LineWidth', 2);
end
xlabel('|h|^2');
ylabel('Probability density');
title(['Near-zero behavior of |h|^2 with 2k degrees of freedom (k = ' num2str(k) ')']);
legend({'Chi-squared distribution', 'Thresholds'}, 'Location', 'Northwest');
set(gca, 'FontSize', 12);
grid on;
