clc
clear
close all
%% Problem 2 - Receiver Beamforming with CSIR, MRC and SIMO
% Probability outage vs SNR for three different channel realizations:
% 1. Uncorrelated channels, h1, h2, h3 and h4 complex gaussian i.i.d
% 2. Correlated channels, h2 = h4 = (h1 x h3), h1 and h3 i.i.d complex
    %  gaussian, product channel, relay case
% 3. h4 = 1/3(h1+h2+h3), average of three i.i.d compl. gaussian

snr_db= -10:2:30; %SNR interval in dB
bits = 2^10; %Number of bits = 1024
iterations = 1000; %cut-off
snr_linear = 10.^(snr_db/10); %SNR in "normal" unit

P_out = zeros(1,size(snr_db,2)); %empty matrix of sixe 1 x SNR interval

%Iterate through SNR interval
for iSNR = 1:size(snr_db,2)

    sigma = 1/sqrt(snr_linear(iSNR)); %Sigma for AWGN
    
    for i = 1:iterations
        TX = round(rand(1,bits))*2-1;

        %Channel H consists of Nr = 4 column vectors h1, h2, h3 and h4
        h1 = complex(randn(1,bits),randn(1,bits));
        h2 = complex(randn(1,bits),randn(1,bits));
        h3 = complex(randn(1,bits),randn(1,bits));
        h4 = complex(randn(1,bits),randn(1,bits));

        %%%CASE1 Uncomment each case for each plot
        H = [h1' h2' h3' h4'];
        %%%%%%%

        %%%CASE2
        %H = [h1' (h1.*h3)' h3' (h1.*h3)'];
        %%%%%%%

        %%%CASE3
        %H = [h1' h2' h3' (1/3).*(h1' + h2' + h3')];
        %%%%%%%

        AWGN = 1/sqrt(2)*(randn(1,bits)+j*randn(1,bits))*sigma; %additive noise
        RX = H'.*TX + AWGN; %Output signal
        detected_bits = ((RX.*conj(H')) >= 0)*2 - 1; %Detected signal (bits)
        nr_of_errors = sum(not(detected_bits == TX)); %Counting non-detected bits
        P_out(iSNR) = P_out(iSNR) + nr_of_errors(i); %Add errors in P_out matrix
    end

    P_out(iSNR) = P_out(iSNR)./iterations./bits; %Average over iterations and nr of bits
end

figure(1)
semilogy(snr_db,P_out); %P_out in log scale
title('Probability of deep fade')
xlabel('SNR [dB]')
ylabel('Outage Probability [log]')
