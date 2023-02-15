%%%%%%         Problem6         %%%%%%

%Assumption 1: log2(1 + SNR) is approximately equal to log2(SNR) for high SNR values.

% Define the range of values for SNR (focus on high values)
clear;close all;clc
snr_db = 0:0.1:50; %Logarithmic scale
%snr_lin = 10.^(snr_db/10); %Linear scale

% Calculate the values of log2(1+SNR), log2(SNR)
y1 = log2(1+snr_db);
y2 = log2(snr_db);

% Plot the function
figure
plot(snr_db, y1, 'b', snr_db, y2, 'r', 'LineWidth', 2);

% Add title, labels, and legend
%title('Comparison of log2(1+SNR) and log2(SNR)');
title('Validity of the assumption "log2(1 + SNR) is approximately equal to log2(SNR)" for HIGH values of SNR')
xlabel('SNR [dB]');
ylabel('Capacity (bpcu)');
legend('log2(1+SNR)', 'log2(SNR)');

% Add grid
grid on;

%Assumption 2: log2(1 + SNR) is approximately equal to (SNR * log2(e) for low values of SNR
% Define the range of values for SNR (focus on low values)
snr_db = -10:0.01:10; %Logarithmic scale
snr_lin = 10.^(snr_db/10); %Linear scale

% Calculate the values of log2(1+SNR), SNR*log2(e)
y1 = log2(1 + snr_lin);
y3 = snr_lin * log2(exp(1));

% Plot the function
figure
plot(snr_db, y1, 'b', snr_db, y3, 'r', 'LineWidth', 2);
title('Validity of the assumption "log2(1 + SNR) is approximately equal to SNR*log2(e)" for LOW values of SNR')
xlabel('SNR [lin]');
ylabel('Capacity (bpcu)');
legend('log2(1+SNR)', 'SNR*log2(e)');

% Add grid
grid on;
