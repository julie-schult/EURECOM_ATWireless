
h = generate_noise(3);
w = generate_noise(3);

% Generate all possible PAM-symbols
M = 16;
X = pammod(0:M-1,M);

% Genrating all possible code words X_tr:


%% 1. PAM
iterations = 1000;
theta_range = 1:1:10;
error_SNRs = zeros(1, 10);
tester = 0;
% Looping over Theta = {1,2, ... 10}
for theta = theta_range
    tester = tester +1;
    num_errors = 0;
    % Iterating the 1000 times to estimate error for this theta
    for a = 1:iterations
        x1 = X(randi([1,M]));
        x2 = X(randi([1,M]));
        x3 = X(randi([1,M]));

        Y = theta*h*xtr_matr([x1,x2,x3])+w;

        % Comparing the y with every possible code, according to the ML rule
        n = 1;
        all_possible = ones(1,M^3);
        all_xtr = ones(M^3,3);
        for i = 1:length(X)
            for j = 1:length(X)
                for k = 1:length(X)
                    all_possible(n) = sum(sum(abs(Y-theta*h*xtr_matr([X(i),X(j),X(k)]))))^2;
                    all_xtr(n,:) = [X(i) X(j) X(k)];
                    n = n+1;
                end
            end
        end

        [min_value, index_min] = min(all_possible);
        X_pred = xtr_matr(all_xtr(index_min,:));
        real_xtr = xtr_matr([x1,x2,x3]);
        if ~(isequal(X_pred, real_xtr))
            num_errors = num_errors + 1;
        end
    end
    prob_error = num_errors/iterations;
    error_SNRs(theta) = prob_error;
end