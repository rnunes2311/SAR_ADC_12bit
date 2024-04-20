function [pm, gm] = hsmargin(circuit_name)

% [pm, gm] = hsmargin(circuit_name)
%
% Phase margin calculator for HSPICE open-loop frequency response data.
%
% 'circuit_name' is a string containing the prefix of an hspice file. The files
% ciruit_name.ac0 and circuit_name.ac1 should contain the Middlebrook-style
% voltage- and current-mode loop gain simulations.
%
% This program generates the frequency response plot of out/in (magnitude and 
% phase) and then attempts to find the gain and phase margins of the system.
% 
%
% Russell Croman
% Silicon Laboratories Inc.
% Confidential Information
% 1 Aug 00
%

eval(strcat('ac0 = loadsig(''', circuit_name, '.ac0'');'));
eval(strcat('ac1 = loadsig(''', circuit_name, '.ac1'');'));

tv = evalsig(ac0, '-mbk_vy/mbk_vx');
ti = evalsig(ac1, 'mbk_iy/mbk_ix');
h = (tv.*ti-1)./(tv+ti+2);
f = evalsig(ac0, 'HERTZ');

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
set(semilogx(f, mag), 'LineWidth', 2);
hold
a = axis;
set(semilogx([fpm fpm], [0 a(3)], 'r--'), 'LineWidth', 2);
if ~isempty(igm)
  set(semilogx([fgm fgm], [mag(igm) a(3)], 'r--'), 'LineWidth', 2);
  set(semilogx([f(1) fgm], [mag(igm) mag(igm)], 'r--'), 'LineWidth', 2);
end
grid;
ylabel('Gain (dB)');

subplot(2,1,2);
set(semilogx(f, ph), 'LineWidth', 2);
hold
a = axis;
axis([a(1) a(2) a(3) 0]);
set(semilogx([f(1) fpm], [ph(ipm) ph(ipm)], 'r--'), 'LineWidth', 2);
set(semilogx([fpm fpm], [ph(ipm) 0], 'r--'), 'LineWidth', 2);
if ~isempty(igm)
  set(semilogx([fgm fgm], [ph(igm) 0], 'r--'), 'LineWidth', 2);
end
grid;
ylabel('Phase (degrees)');
xlabel('Frequency (Hz)');

