%  written by Mike Perrott with modifications by Scott Willingham
function [] = plotsig1(x,s,log)

global sweep;

title_str = s(1);
sig = evalsig(x, char(s(1)));
for i = 2:length(s)
  title_str = strcat(title_str,', ',s(i));
  sig = [sig, evalsig(x, char(s(i)))];
end

% timesteps are different across sweeps, so replicate:
if strcmp(x(1).name, 'TIME')
      szdata = size(x(1).data);
      if sweep > 0 & sweep <= szdata(2)
         ivar = x(1).data(:,sweep);
      else
         ivar = repmat(x(1).data, 1, length(s));
      end
else
    ivar = x(1).data(:,1);
end

if nargin > 2
    switch log
	case 'logx'
	    h = semilogx(ivar, sig);
	case 'logy'
	    h = semilogy(ivar, sig);
	case {'logxy','loglog'}
	    h = loglog(ivar, sig);
	otherwise
	    fprintf('Warning (plotsig1): unrecognized plot_args\n')
	    h = plot(ivar, sig);
    end
else
    h = plot(ivar, sig);
end

% Thicken the lines
for i=1:length(h)
  set(h(i), 'LineWidth', 2);
end

title_str = strrep(title_str, '_', '.');
% ylabel(title_str);
grid on;
