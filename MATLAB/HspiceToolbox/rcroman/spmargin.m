function [pm, gm] = spmargin()

% [pm, gm] = spmargin()
%
% Phase margin calculator for Spectre open-loop frequency response data.
%
% The program looks for open-loop frequency, gain and phase data in files
% called "voltGain.dat" and "currGain.dat" in the current directory. The first 
% four lines of each file will be skipped in accordance with Spectre ocnPrint()
% output format. The rest of each file should be three-column data containing 
% frequency, real and imaginary loop gain data, in that order.
%
% This program generates the frequency response plot of out/in (magnitude and 
% phase) and then attempts to find the gain and phase margins of the loop.
% 
%
% Russell Croman
% Silicon Laboratories Inc.
% Confidential Information
% 20 Aug 00
%

[fv, vreal, vimag] = textread('voltGain.dat', '%f %f %f', 'headerlines', 4);
[fi, ireal, iimag] = textread('currGain.dat', '%f %f %f', 'headerlines', 4);

if ~prod(fv == fi)
  error('Error: frequency vectors in voltGain.dat and currGain.dat don''t match.')
end

f = fv;

tv = -(vreal + vimag*sqrt(-1));
ti = ireal + iimag*sqrt(-1);

h = (tv.*ti-1)./(tv+ti+2);

mag = db20(h);
ph  = unwrap(angle(h))*180/pi;

% Attempt to find phase margin
[junk, ipm] = min(abs(mag));	% this should be where gain crosses 0dB
fpm = f(ipm);
pm = ph(ipm)+180;

% Attempt to find gain margin
% [junk, igm] = max(abs(ph+180));
igm = min(find(ph < -180));
fgm = f(igm);
gm = -mag(igm);

clf;
subplot(2,1,1);
set(semilogx(f, mag), 'LineWidth', 1);
hold
a = axis;
set(semilogx([fpm fpm], [0 a(3)], 'r--'), 'LineWidth', 1);
if ~isempty(igm)
  set(semilogx([fgm fgm], [mag(igm) a(3)], 'r--'), 'LineWidth', 1);
  set(semilogx([f(1) fgm], [mag(igm) mag(igm)], 'r--'), 'LineWidth', 1);
end
grid;
ylabel('Gain (dB)');

subplot(2,1,2);
set(semilogx(f, ph), 'LineWidth', 1);
hold
a = axis;
axis([a(1) a(2) a(3) 0]);
set(semilogx([f(1) fpm], [ph(ipm) ph(ipm)], 'r--'), 'LineWidth', 1);
set(semilogx([fpm fpm], [ph(ipm) 0], 'r--'), 'LineWidth', 1);
if ~isempty(igm)
  set(semilogx([fgm fgm], [ph(igm) 0], 'r--'), 'LineWidth', 1);
end
grid;
ylabel('Phase (degrees)');
xlabel('Frequency (Hz)');

