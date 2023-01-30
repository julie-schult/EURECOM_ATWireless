%%%%%%         Question6         %%%%%%

%Assumption 1: log2(1 + SNR) is approximately equal to log2(SNR) for high SNR values.

% Define the range of values for SNR (focus on high values)
clear;close all;clc
snr = 0:0.1:50;

% Calculate the values of log2(1+SNR), log2(SNR)
y1 = log2(1+snr);
y2 = log2(snr);

% Plot the function
figure
plot(snr, y1, 'b', snr, y2, 'r', 'LineWidth', 2);

% Add title, labels, and legend
%title('Comparison of log2(1+SNR) and log2(SNR)');
title('Validity of the assumption "log2(1 + SNR) is approximately equal to log2(SNR)" for HIGH values of SNR')
xlabel('SNR (dB)');
ylabel('Capacity (bits/symbol)');
legend('log2(1+SNR)', 'log2(SNR)');

% Add grid
grid on;

%Assumption 2: log2(1 + SNR) is approximately equal to (SNR * log2(e) for low values of SNR
% Define the range of values for SNR (focus on low values)
snr = 0:0.005:1;

% Calculate the values of log2(1+SNR), SNR*log2(e)
y1 = log2(1+snr);
y3 = snr*log2(exp(1));

% Plot the function
figure
plot(snr, y1, 'b', snr, y3, 'r', 'LineWidth', 2);
title('Validity of the assumption "log2(1 + SNR) is approximately equal to SNR*log2(e)" for LOW values of SNR')
xlabel('SNR (dB)');
ylabel('Capacity (bits/symbol)');
legend('log2(1+SNR)', 'SNR*log2(e)');

% Add grid
grid on;
