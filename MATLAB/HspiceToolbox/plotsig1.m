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
	    semilogx(ivar, sig)
	case 'logy'
	    semilogy(ivar, sig)
	case {'logxy','loglog'}
	    loglog(ivar, sig)
	otherwise
	    fprintf('Warning (plotsig1): unrecognized plot_args\n')
	    plot(ivar, sig)
    end
else
    plot(ivar, sig)
end

title_str = strrep(char(title_str), '_', '\_');
ylabel(title_str);
grid on;
