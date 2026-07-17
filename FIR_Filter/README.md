# Project 1 — Topic 4: VLSI Design of FIR Filter for DSP Applications

## Description
- Designed a 4-tap Low Pass FIR Filter.
- MATLAB generated coefficients:
  h = [0.0416, 0.4584, 0.4584, 0.0416]
- Scaled coefficients (×256):
  h = [11, 117, 117, 11]
- Sampling Frequency: Fs = 1000 Hz
- Cutoff Frequency: Fc = 100 Hz
- Filter Order: 3

## Results
- Step input response verified.
- Impulse response matches coefficients.
- Ramp input smoothing demonstrated.
- Area: 4 multipliers + 3 adders.
- Speed: 1 sample per clock cycle.
- Power: Low — shift register design.

## Tools Used
- MATLAB Online — coefficient generation.
- Vivado 2024.2 — simulation and synthesis.
