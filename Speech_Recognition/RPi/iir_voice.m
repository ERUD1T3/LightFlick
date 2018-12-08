function Hd = iir_voice
%IIR_VOICE Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.3 and Signal Processing Toolbox 7.5.
% Generated on: 04-Dec-2018 18:38:00

% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 16000;  % Sampling Frequency

Fstop1 = 250;         % First Stopband Frequency
Fpass1 = 350;         % First Passband Frequency
Fpass2 = 3300;        % Second Passband Frequency
Fstop2 = 3500;        % Second Stopband Frequency
Astop1 = 60;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 80;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]