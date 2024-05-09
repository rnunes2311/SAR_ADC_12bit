from PyLTSpice import RawRead as RawRead
from matplotlib import pyplot as plt
import mplcursors
import numpy as np
from tabulate import tabulate

# Change file name if needed
LTR = RawRead("./simulation/top_level_differential_sim.raw")

fig, ax = plt.subplots(12, 1, height_ratios=[10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], sharex=True)


# DAC outputs
vdac_p = LTR.get_trace("v(x1.vdac_p)")
vdac_n = LTR.get_trace("v(x1.vdac_n)")

# Clock and start signals
clk = LTR.get_trace("v(clk)")
start = LTR.get_trace("v(start)")

# Input signals
vin_p = LTR.get_trace("v(vin_p)")
vin_n = LTR.get_trace("v(vin_n)")

# Comparator outputs
comp_p = LTR.get_trace("v(x1.comp_p)")
comp_n = LTR.get_trace("v(x1.comp_n)")

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

# Plot all signals
my_colors = plt.rcParams['axes.prop_cycle']() 
l = []

l.append(ax[0].plot(time.get_wave()*1e6, vdac_p.get_wave(), **next(my_colors), label="DAC_P"))
l.append(ax[0].plot(time.get_wave()*1e6, vdac_n.get_wave(), **next(my_colors), label="DAC_N"))
l.append(ax[0].plot(time.get_wave()*1e6, vin_p.get_wave(), **next(my_colors), label="VIN_P"))
l.append(ax[0].plot(time.get_wave()*1e6, vin_n.get_wave(), **next(my_colors), label="VIN_N"))

l.append(ax[1].plot(time.get_wave()*1e6, clk.get_wave(), **next(my_colors), label="CLK"))
l.append(ax[2].plot(time.get_wave()*1e6, start.get_wave(), **next(my_colors), label="START"))

l.append(ax[3].plot(time.get_wave()*1e6, comp_p.get_wave(), **next(my_colors), label="COMP_P"))
l.append(ax[4].plot(time.get_wave()*1e6, comp_n.get_wave(), **next(my_colors), label="COMP_N"))

l.append(ax[5].plot(time.get_wave()*1e6, data[5].get_wave(), **next(my_colors), label="DATA[5]"))
l.append(ax[6].plot(time.get_wave()*1e6, data[4].get_wave(), **next(my_colors), label="DATA[4]"))
l.append(ax[7].plot(time.get_wave()*1e6, data[3].get_wave(), **next(my_colors), label="DATA[3]"))
l.append(ax[8].plot(time.get_wave()*1e6, data[2].get_wave(), **next(my_colors), label="DATA[2]"))
l.append(ax[9].plot(time.get_wave()*1e6, data[1].get_wave(), **next(my_colors), label="DATA[1]"))
l.append(ax[10].plot(time.get_wave()*1e6, data[0].get_wave(), **next(my_colors), label="DATA[0]"))

l.append(ax[11].plot(time.get_wave()*1e6, clk_data.get_wave(), **next(my_colors), label="CLK_DATA"))


# Add legend, title, labels
fig.legend(loc='outside right center') 
ax[11].set_xlabel("Time ($ \\mu $s)")
ax[0].set_ylabel("Voltage (V)")
fig.suptitle("ADC Waveforms")

# Remove y ticks from the digital signals
for i in range(1,len(ax)):
    ax[i].set_yticks([])

# Cursor (left click to see annotation, right click on the annotation to hide it)
mplcursors.cursor()


# Extract start signal rising edges, clk_data rising and falling edges
hyst = 0.1
vdd = 1.8

start_dig = 0 if start.get_wave()[0] < 0.9 else 1
clk_data_dig = 0 if clk_data.get_wave()[0] < 0.9 else 1

start_rising = []
clk_data_rising = []
clk_data_falling = []

for i in range(1,len(time.get_wave())):
    start_thr = vdd/2 + hyst if start_dig == 0 else vdd/2 - hyst
    clk_data_thr = vdd/2 + hyst if clk_data_dig == 0 else vdd/2 - hyst
    
    # Check if rising and falling edges of start signal
    if (start.get_wave()[i] > start_thr) and (start_dig == 0):
        start_rising.append(i)
        start_dig = 1
    elif (start.get_wave()[i] < start_thr) and (start_dig == 1):
        start_dig = 0
        
    # Check if rising and falling edges of clk_data signal
    if (clk_data.get_wave()[i] > clk_data_thr) and (clk_data_dig == 0):
        clk_data_rising.append(i)
        clk_data_dig = 1
    elif (clk_data.get_wave()[i] < clk_data_thr) and (clk_data_dig == 1):
        clk_data_falling.append(i)
        clk_data_dig = 0

# Extract sampled input signal    
vin_samples = vin_p.get_wave()[start_rising] - vin_n.get_wave()[start_rising]

# Calculate expected output codes
vref = 1.2
n = 12
expected_codes = np.round((vin_samples/vref + 1) * 2**(n-1) - 0.5).astype(int)

# Extract obtained output codes

obtained_codes = [0]*len(expected_codes)
for i in range(6):
    data_rising_dig = data[i].get_wave()[clk_data_rising] > vdd/2
    data_falling_dig = data[i].get_wave()[clk_data_falling] > vdd/2
    obtained_codes = obtained_codes + data_rising_dig * 2**(i+6) + data_falling_dig * 2**i  

# Print table with results
table = [['Input Signal (V)', 'Expected Output (LSB)', 'Obtained Output (LSB)', 'Error (LSB)']]
for i in range(len(expected_codes)):
    table.append([vin_samples[i], expected_codes[i], obtained_codes[i], obtained_codes[i]-expected_codes[i]])

print(tabulate(table, headers='firstrow', tablefmt='fancy_grid'))

# Show plot
plt.show()