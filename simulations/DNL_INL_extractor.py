from tabulate import tabulate
import numpy as np
from matplotlib import pyplot as plt

def simulate_ADC_conversion(vin, vref, cdac_p, cdac_n):
    result = 0
    reference = 0
    for i in range(len(cdac_p)-1,-1,-1):
        if vin > reference:
            result += 2**i
            reference = reference + cdac_p[i]/sum(cdac_p)*vref
        else:
            reference = reference - cdac_n[i]/sum(cdac_n)*vref
            
    return result

# Net names in the netlist for bottom plates of positive DAC caps
btm_plates_p = ["C0_dummy_p_btm",
                "C0_p_btm",
                "C1_p_btm",
                "C2_p_btm",
                "C3_p_btm",
                "C4_p_btm",
                "C5_p_btm",
                "C6_p_btm",
                "C7_p_btm",
                "C8_p_btm",
                "C9_p_btm",
                "C10_p_btm"]
                
# Net names in the netlist for bottom plates of negative DAC caps                
btm_plates_n = ["C0_dummy_n_btm",
                "C0_n_btm",
                "C1_n_btm",
                "C2_n_btm",
                "C3_n_btm",
                "C4_n_btm",
                "C5_n_btm",
                "C6_n_btm",
                "C7_n_btm",
                "C8_n_btm",
                "C9_n_btm",
                "C10_n_btm"]

# Net name in the netlist for top plates (output) of the positive DAC
top_plate_p = "VDAC_P"

# Net name in the netlist for top plates (output) of the negative DAC
top_plate_n = "VDAC_N"

# Component name for the unit caps and value
pdk_cap = "sky130_fd_pr__cap_mim_m3_1"
pdk_cap_val = 2 # fF

# Open C extraction netlist
f = open("../layout/SAR_ADC_12bit_flat.spice", "r")

cdac_p_pdk_units = [0]*len(btm_plates_p)
cdac_n_pdk_units = [0]*len(btm_plates_n)

cdac_p_par = [0]*len(btm_plates_p)
cdac_n_par = [0]*len(btm_plates_p)


# Extraction of capacitances from the netlist
for line in f:
    splitLine = line.split()
    if len(splitLine) < 3:
        continue
        
    # Extraction of positive DAC capacitances
    for i in range(len(btm_plates_p)):
        if (splitLine[1].lower() == top_plate_p.lower() and splitLine[2].lower() == btm_plates_p[i].lower()) or (splitLine[2].lower() == top_plate_p.lower() and splitLine[1].lower() == btm_plates_p[i].lower()):
            if splitLine[3] == pdk_cap:
                cdac_p_pdk_units[i] += 1
            elif splitLine[3].find("f") > -1:
                cdac_p_par[i] += float(splitLine[3].strip("f"))
            elif splitLine[3].find("p") > -1:
                cdac_p_par[i] += float(splitLine[3].strip("p"))*1000
            else:
                cdac_p_par[i] += float(splitLine[3])*1e15

    # Extraction of negative DAC capacitances
    for i in range(len(btm_plates_n)):
        if (splitLine[1].lower() == top_plate_n.lower() and splitLine[2].lower() == btm_plates_n[i].lower()) or (splitLine[2].lower() == top_plate_n.lower() and splitLine[1].lower() == btm_plates_n[i].lower()):
            if splitLine[3] == pdk_cap:
                cdac_n_pdk_units[i] += 1
            elif splitLine[3].find("f") > -1:
                cdac_n_par[i] += float(splitLine[3].strip("f"))*1
            elif splitLine[3].find("p") > -1:
                cdac_n_par[i] += float(splitLine[3].strip("p"))*1000
            else:
                cdac_n_par[i] += float(splitLine[3])*1e15
        
# Print tables with the capacitances found
print(" "*55 + "PDK DAC Capacitances Found")
table = [["PDAC bottom plate net", "PDAC capacitance to top plate (units)", "NDAC bottom plate net", "NDAC capacitance to top plate (units)"]]

for i in range(len(btm_plates_p)):
    table.append([btm_plates_p[i], cdac_p_pdk_units[i], btm_plates_n[i], cdac_n_pdk_units[i]])
    
print(tabulate(table, headers='firstrow', tablefmt='fancy_grid'))
print("")

print(" "*90 + "Parasitic DAC Capacitances Found")
table = [["PDAC bottom plate net", "PDAC capacitance to top plate (fF)", "PDAC cap normalized to previous", "NDAC bottom plate net", "NDAC capacitance to top plate (fF)", "NDAC cap normalized to previous"]]

for i in range(len(btm_plates_p)):
    if i == 0:
        table.append([btm_plates_p[i], round(cdac_p_par[i],5), 1, btm_plates_n[i], round(cdac_n_par[i],5), 1])
    else:
        table.append([btm_plates_p[i], round(cdac_p_par[i],5), round(cdac_p_par[i]/cdac_p_par[i-1],3), btm_plates_n[i], round(cdac_n_par[i],5), round(cdac_p_par[i]/cdac_p_par[i-1],3)])

print(tabulate(table, headers='firstrow', tablefmt='fancy_grid'))

######################### DNL/INL Calculation ##########################

# Reference voltage
vref = 1.2

# Input values to the ADC
n_samples_per_code = 100
ADC_inputs = np.linspace(-vref, vref, n_samples_per_code*(2**12))

# Total DAC capacitances
pdac_cap_values = np.array(cdac_p_pdk_units,dtype=float)*pdk_cap_val+cdac_p_par
ndac_cap_values = np.array(cdac_n_pdk_units,dtype=float)*pdk_cap_val+cdac_n_par

ADC_outputs = [0]*(2**12)

# Simulate ADC to calculate DNL
for input_val in ADC_inputs:
    result = simulate_ADC_conversion(input_val, vref, pdac_cap_values, ndac_cap_values*pdk_cap_val+cdac_n_par)
    ADC_outputs[result] += 1
    
    # Print progress
    print("Simulating DNL:", round((input_val+vref)/(2*vref)*100, 0), "%", end = '\r')
print()

# DNL and INL calculation
dnl = np.array(ADC_outputs)/n_samples_per_code-1
inl = np.cumsum(dnl)

my_colors = plt.rcParams['axes.prop_cycle']() 
fig, ax = plt.subplots(2, 1, sharex=True)

ax[0].plot(dnl, **next(my_colors), label="DNL")
ax[1].plot(inl, **next(my_colors), label="INL")


# Add title and labels
ax[1].set_xlabel("Output Code")
ax[0].set_ylabel("DNL (LSB)")
ax[1].set_ylabel("INL (LSB)")
ax[0].set_xlim(0,2**12-1)
ax[0].set_xticks([0, 2**10, 2**11, 3*(2**10), 2**12-1])
fig.suptitle("Expected ADC DNL/INL")


plt.show()