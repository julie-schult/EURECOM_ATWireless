%% Instantaneous capacity vs SNR

% Defining the number of fading realizations
nFading = 100;

% Defininf SNR in dB and in linear scale
snrdB = -10:1:30;
snr = 10.^(snrdB/10);

% Defining the fading coefficient with mean 0 and variance 1/2
h = (randn(nFading, 1) + 1i * randn(nFading, 1))/(sqrt(2));
 
% Calculating the instantaneous capacity from the formula
InstC = log2(1+abs(h).^2*snr);

% Plotting of C vs SNR
figure(1)
plot(snrdB, InstC);
title('Instantaneous capacity for different values of SNR and 100 fading realizations');
xlabel('SNR [dB]');
ylabel('Capacity [bits/channel use]');

%% Ergodic capacity vs SNR

% Calculating the ergodic capacity by taking the average value from the instantaneous capacity
ergoC = mean(InstC, 1);

% Plotting of C vs SNR
figure(2)
plot(snrdB, ergoC);
title('Ergodic capacity for different values of SNR and 100 fading realizations');
xlabel('SNR [dB]');
ylabel('Capacity [bits/channel use]');

%% Outage probability vs SNR

% Defining the target rate
R = 2;

% Finding the number of realizations where the instantaneous capacity is
% smaller than the target value
outage_count = sum(InstC < R);

% Calculating the probability with the number of fading realizations
outage_prob = outage_count / nFading;

% Plotting of outage probabilty vs SNR
figure(3)
plot(snrdB, outage_prob);
title('Outage probability for different values of SNR and 100 fading realizations');
xlabel('SNR [dB]');
ylabel('Outage probability');