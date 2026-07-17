Fs = 1000;
Fc = 100;
N  = 4;
h = fir1(N-1, Fc/(Fs/2));
h_scaled = round(h * 256);
disp('Original Coefficients:')
disp(h)
disp('Scaled Coefficients (x256):')
disp(h_scaled)
freqz(h, 1, 512, Fs);
title('FIR Low Pass Filter Response');