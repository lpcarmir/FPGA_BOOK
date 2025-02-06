N=256;
n=0:N-1;
Fs=20e3;
Fc=6e3;

sig1=sin(2*pi*Fc/Fs*n);
sig1_fft=fft(sig1);

plot(abs(sig1_fft));