from PyLTSpice import RawRead as RawRead
from matplotlib import pyplot as plt
from matplotlib.lines import Line2D
import mplcursors
import numpy as np
from tabulate import tabulate

# Change file name if needed
LTR = RawRead("./simulation/top_level_enob_sim.raw")

# Outputs
data = []
data.append(LTR.get_trace("v(data[0])"))
data.append(LTR.get_trace("v(data[1])"))
data.append(LTR.get_trace("v(data[2])"))
data.append(LTR.get_trace("v(data[3])"))
data.append(LTR.get_trace("v(data[4])"))
data.append(LTR.get_trace("v(data[5])"))
clk_data = LTR.get_trace("v(clk_data)")
time = LTR.get_trace('time')

# Supply/Reference currents and voltages
i_vdd = LTR.get_trace('i(v1)')
i_vcm = LTR.get_trace('i(v2)')
i_vref = LTR.get_trace('i(v3)')

v_vdd = LTR.get_trace('v(vdd)')
v_vcm = LTR.get_trace('v(vcm)')
v_vref = LTR.get_trace('v(vref)')

P_vdd = -np.trapz(v_vdd.get_wave()*i_vdd.get_wave(), time.get_wave())/time.get_wave()[-1]*1e6
P_vcm = -np.trapz(v_vcm.get_wave()*i_vcm.get_wave(), time.get_wave())/time.get_wave()[-1]*1e6
P_vref = -np.trapz(v_vref.get_wave()*i_vref.get_wave(), time.get_wave())/time.get_wave()[-1]*1e6

print("VDD average power:", round(P_vdd, 1), "uW")
print("VCM average power:", round(P_vcm, 1), "uW")
print("VREF average power:", round(P_vref, 1), "uW")
print("Total average power:", round(P_vdd+P_vcm+P_vref, 1), "uW")

# Extract start signal rising edges, clk_data rising and falling edges
hyst = 0.1
vdd = 1.8

clk_data_dig = 0 if clk_data.get_wave()[0] < 0.9 else 1

clk_data_rising = []
clk_data_falling = []

for i in range(1,len(time.get_wave())):
    clk_data_thr = vdd/2 + hyst if clk_data_dig == 0 else vdd/2 - hyst
        
    # Check if rising and falling edges of clk_data signal
    if (clk_data.get_wave()[i] > clk_data_thr) and (clk_data_dig == 0):
        clk_data_rising.append(i)
        clk_data_dig = 1
    elif (clk_data.get_wave()[i] < clk_data_thr) and (clk_data_dig == 1):
        clk_data_falling.append(i)
        clk_data_dig = 0

if len(clk_data_rising) > len(clk_data_falling):
    del clk_data_rising[-1]

# Extract obtained output codes
obtained_codes = [0]*len(clk_data_rising)
for i in range(6):
    data_rising_dig = data[i].get_wave()[clk_data_rising] > vdd/2
    data_falling_dig = data[i].get_wave()[clk_data_falling] > vdd/2
    obtained_codes = obtained_codes + data_rising_dig * 2**(i+6) + data_falling_dig * 2**i 
    

# Reference voltage
vref = 1.2
n = 12
n_fft = 256
f_sample = 1250 # kHz

analog_output = vref*((obtained_codes + 0.5)/2**(n-1) - 1)
fft = np.absolute(np.fft.fft(analog_output[-n_fft:]))[0:int(n_fft/2+1)]
fft = fft/np.max(fft)
fft_dB = 20*np.log10(fft)

freq = np.linspace(0, f_sample/2, int(n_fft/2+1))

# Calculation of harmonic frequencies
n_harm = 7
f_harm = []
f_harm.append(np.argmax(fft_dB))
dir = 1

for i in range(1, n_harm):
    f_harm.append(f_harm[i-1]+dir*f_harm[0])
    if f_harm[-1] >= len(fft):
        dir = -1
        f_harm[-1] = len(fft)-1 - (f_harm[-1]-len(fft)+1)
    elif f_harm[-1] < 0:
        dir = 1
        f_harm[-1] = -f_harm[-1]


P_signal = 1
P_noise = np.sum(fft[1:]**2)-1
P_harm = np.sum(fft[f_harm]**2)-1

sndr = 10*np.log10(P_signal/P_noise)
enob = (sndr - 1.76)/6.02
sfdr = -np.partition(fft_dB[1:].flatten(), -2)[-2]
thd = 10*np.log10(P_signal/P_harm)



fig, ax = plt.subplots()

barlist=plt.bar(freq, fft_dB+[140]*int(n_fft/2+1), width=f_sample/2/(n_fft/2+1)*1.01, bottom=-140)
barlist[0].set_color('r')
barlist[f_harm[0]].set_color('g')
for i in range(1, n_harm):
    barlist[f_harm[i]].set_color('orange')

plt.xlim(0, f_sample/2)
plt.ylim(-130, 0)

plt.xticks(np.arange(0, f_sample/2+f_sample/8, f_sample/8))
plt.ylabel("Power Spectrum (dBFS)")
plt.xlabel("Frequency (kHz)")
plt.title("Output Spectrum")


legend_elements = [Line2D([0], [0], color='r', lw=4, label='DC'),
                   Line2D([0], [0], color='g', lw=4, label='Fundamental'),
                   Line2D([0], [0], color='orange', lw=4, label='First ' + str(n_harm) + ' harmonics'),
                   Line2D([0], [0], ls='', label=''),
                   Line2D([0], [0], ls='', label='SNDR: ' + str(round(sndr,1)) + ' dB'),
                   Line2D([0], [0], ls='', label='ENOB: ' + str(round(enob,1)) + ' bit'),
                   Line2D([0], [0], ls='', label='SFDR: ' + str(round(sfdr,1)) + ' dB'),
                   Line2D([0], [0], ls='', label='THD: ' + str(round(thd,1)) + ' dB')]

ax.legend(handles=legend_elements, loc='upper right')

plt.show()