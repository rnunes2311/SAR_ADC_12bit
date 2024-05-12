## Ideas for validating the circuit
- Use FPGA or microcontroller to read ADC outputs and send them to computer through serial port. Microcontroller sounds easier?
- Oscillator IC to generate 8x clock frequency
- D flip flops to generate divided down clock, used for FPGA/microcontroller
- D flip flops to generate ADC clock: divided down clock combined with a delayed version of itself using the 8x faster clock. This way it's easy to generate variable duty cycle. Flip flops to generate delay can be clocked by 8x faster clock signal or inverted version for fine adjustment of duty cycle.

D flip flop example:
- SN74AUP2G80

Or gate:
- SN74ALVC32