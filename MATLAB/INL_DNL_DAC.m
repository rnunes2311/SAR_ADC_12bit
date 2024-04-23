clear all
close all

%% Function to convert input signal to digital
function result = ADC_Convert(input,reference,weights)
    result = zeros(1,length(input));
    for k=1:length(input)
        ref_signal = 0;
        for i=(length(weights)+1):-1:1
            % Compare input with reference
            if input(k) > ref_signal
                result(k) = result(k) + 2^(i-1);
                if i > 1
                    ref_signal = ref_signal + weights(i-1)*reference;
                end
            else
                if i > 1
                    ref_signal = ref_signal - weights(i-1)*reference;
                end
            end
        end
    end
end


%% DAC Capacitor values
Cu = 2e-15;
C(1) = (2^0)*Cu + 0.251031e-15;
C(2) = (2^1)*Cu + 0.489703e-15;
C(3) = (2^2)*Cu + 0.969976e-15;
C(4) = (2^3)*Cu + 1.92897e-15;
C(5) = (2^4)*Cu + 3.8705e-15;
C(6) = (2^5)*Cu + 7.70134e-15;
C(7) = (2^6)*Cu + 15.418301e-15;
C(8) = (2^7)*Cu + 30.814602e-15;
C(9) = (2^8)*Cu + 61.6921e-15;
C(10) = (2^9)*Cu + 0.123334e-12;
C(11) = (2^10)*Cu + 0.246274e-12;
C_dummy = (2^0)*Cu + 0.251031e-15;

C_total = sum(C) + C_dummy;

%% Weights calculation
w_ideal = ones(1,11)./(ones(1,11).*2.^(11:-1:1));
w_real = C/C_total;

%% Calculate INL and DNL
vin = (-1:(0.01*2/2^12):1);
result_real = ADC_Convert(vin,1,w_real);
ideal_step_width = 100;
INL(1) = 0;
for i = 1:2^12
    DNL(i) = sum(result_real == i-1)/100-1;
    if i > 1
        INL(i) = INL(i-1)+DNL(i);
    end
end

%% Calculate SNDR, SFDR and ENOB
N_points = 512;
f_sample = 5e6;
f_signal = 302.734e3;%nextprime(N_points/40)/N_points*f_sample;
t = (1:N_points)*1/f_sample;
vin = sin(2*pi*f_signal*t);
freq = (0:1:(N_points/2))*f_sample/N_points;

result_dynamic = ADC_Convert(vin,1,w_real);

t = (1:1000000)*1/f_sample;
vin = sin(2*pi*f_signal*t);

result_dynamic = result_dynamic-2048;

FFT_output = fft(result_dynamic);
FFT_output = abs(FFT_output(1:(N_points/2+1))).^2;


SNDR_output = sinad(FFT_output',freq,'psd') % dB
ENOB_output = (SNDR_output - 1.76)/6.02 % bit
SFDR_output = sfdr(FFT_output',freq','power')
THD_output = thd(FFT_output',freq,5,'psd')


