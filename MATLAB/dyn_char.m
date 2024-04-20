%% Script to calculate dynamic performance from transient simulation

clear all;
close all;
clc;

results = loadsig('SAR_ADC_12bit_sim.raw');
done = evalsig(results,'done');
start = evalsig(results,'start');
sample = evalsig(results,'x1_smpl');
vdac_p = evalsig(results,'x1_vdac_p');
vdac_n = evalsig(results,'x1_vdac_n');
en_comp = evalsig(results,'x1_en_comp');
time = evalsig(results,'TIME');
vin_p = evalsig(results,'vin_p');
vin_n = evalsig(results,'vin_n');

i_VDD = evalsig(results,'i_v1');
i_VCM = evalsig(results,'i_v2');
i_VREF = evalsig(results,'i_v3');


for i = 12:-1:1
    output_code(i,:) = evalsig(results,convertStringsToChars(strcat('result_',string(i-1),'_')));
end

%% Search for done signal rising edges, record timepoints

thresh = 0.9;
crossings = 0;
crossings_index = 0;
reference = 1.2;

for i = 2:length(time)
    if done(i) >= thresh && done(i-1) < thresh
        crossings(crossings_index+1) = i;
        crossings_index = crossings_index + 1;
    end
end

weights = 2.^(0:11);
conversion_results = weights*(output_code(:,crossings)>thresh);
conversion_results_voltage = conversion_results/2^12*2*reference-reference;

%% Plot time domain signals
figure;
plot(time(crossings),conversion_results_voltage);
xlabel('Time (s)');
ylabel('ADC Output (V)');


%% Plot FFT
N_points = 256;
f_sample = 10e6;
freq = (0:1:(N_points/2))*f_sample/N_points;

FFT_output = fft(conversion_results_voltage((end-N_points+1):end));
FFT_output = abs(FFT_output(1:(N_points/2+1))).^2;

%% Calculate ENOB, SNDR, THD

figure;
sinad(FFT_output',freq,'psd');

SNDR_output = sinad(FFT_output',freq,'psd'); % dB
ENOB_output = (SNDR_output - 1.76)/6.02; % bit
SFDR_output = sfdr(FFT_output',freq','power');
THD_output = thd(FFT_output',freq,5,'psd','aliased');

%% Calculate Power Consumption

VDD_avg_power = -trapz(time((end-N_points+1):end),i_VDD((end-N_points+1):end))*1.8/(time(end)-time(end-N_points+1));
VREF_avg_power = -trapz(time((end-N_points+1):end),i_VREF((end-N_points+1):end))*1.2/(time(end)-time(end-N_points+1));
VCM_avg_power = -trapz(time((end-N_points+1):end),i_VCM((end-N_points+1):end))*0.6/(time(end)-time(end-N_points+1));

avg_power = VDD_avg_power+VREF_avg_power+VCM_avg_power;

%% Print Results
fprintf('Results:\n');
fprintf('SNDR: %.2f dB\n', SNDR_output);
fprintf('ENOB: %.2f bit\n', ENOB_output);
fprintf('SFDR: %.2f dB\n', SFDR_output);
fprintf('THD: %.2f dB\n', THD_output);
fprintf('VDD power: %.0f uW\n', VDD_avg_power*1e6);
fprintf('VREF power: %.0f uW\n', VREF_avg_power*1e6);
fprintf('VCM power: %.0f uW\n', VCM_avg_power*1e6);
fprintf('Total power: %.0f uW\n', avg_power*1e6);
fprintf('FoM: %.1f fJ/step\n', avg_power/(f_sample*2^ENOB_output)*1e15);

