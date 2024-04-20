function f=fftplot(signal, dt, varargin)

% f=fftplot(signal, dt <, minfreq, maxfreq>)
%
% Plodt the first half of the spectrumtrum of the signal.
%
% dt is the sampling period.
%
% minfreq and maxfreq, if spectrumified, determine the frequency range of the
% final FFT that will be kept and plotted (useful for cropping large records).
%

p = floor(log(length(signal))/log(2));

n=2^p;

sig = signal((length(signal)-n+1):(length(signal)));

sig = sig.*blackman(length(sig));

f = fft(sig);

n2 = n/2;

fbin = 1/(n*dt);		% bin spacing (in frequency)

if nargin == 2
  minfreq = 0;
  maxfreq = fbin*(n2-1);
elseif nargin == 4
  minfreq = varargin{1};
  maxfreq = varargin{2};
else
  error('Error: expected two or four arguments.');
end

minfreqbin = round(minfreq/fbin)+1;
maxfreqbin = round(maxfreq/fbin)+1;
minfreq = (minfreqbin - 1)*fbin;
maxfreq = (maxfreqbin - 1)*fbin;
if minfreqbin < 1
  error('Error: minimum specified frequency is negative.');
end
if maxfreqbin > n2
  error('Error: maximum specified frequency is >= 1/(2*dt).');
end


spectrum = db20(f(minfreqbin:maxfreqbin)*2/0.42/n);
% spectrum = db20(f(minfreqbin:maxfreqbin)*2/n);

% spectrum = spectrum - max(spectrum);

% freq = linspace(0, (n2-1)/(dt*n), n2);
freq = minfreq:fbin:maxfreq;

plot(freq, spectrum);

f=spectrum;
