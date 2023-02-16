% Defining R bits per channel use
R = 4;

% Defining SNR in dB and in linear scale
snrdB = -10:1:30;
snr = 10.^(snrdB/10);

%% 2x1 MISO
deep_fade = zeros(size(snrdB)); %deep_fade = sum(abs(h).^2 < SNR.^(-1))
outage = zeros(size(snrdB)); %outage = sum(C < R)/length(C)
iterations = 1000;

for iSNR = 1:size(snrdB,2)
    fadeCount = 0; % Counter of number of deep fades
    outageCount = 0; % Counter for number of outages
    for i = 1:iterations
        % Defining the fading coefficient with mean 0 and variance 1/2
        h = (randn(1,2) + 1i * randn(1,2))/sqrt(2);
        % Calculating the capacity
        C = log2(1 + snr*(abs(h(1)).^2 + abs(h(2)).^2));

        h2 = abs(h(1)).^2 + abs(h(2)).^2;
        snr1 = snrdB.^(-1);
        fadeCount = fadeCount + sum(h2 < snr1);
        outageCount = outageCount + sum(C < R);
    end
    deep_fade(iSNR) = fadeCount / iterations;
    outage(iSNR) = outageCount / iterations;
end

% plot
subplot(1,2,1)
plot(snrdB,deep_fade), title('Probability of deep fade')
grid on;
xlabel('SNR [dB]');
ylabel('Deep fade probability');
subplot(1,2,2)
plot(snrdB,outage), title('Probability of outage')
grid on;
xlabel('SNR [dB]');
ylabel('Outage probability');
sgtitle('Probabilities of deep fade and outage for a 2x1 MISO')

%% 3x1 MISO

%% 5x1 MISO

%% 5x1 MISO with the same fading coefficients
