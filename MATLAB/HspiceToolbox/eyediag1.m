%  written by Mike Perrott with modifications by Scott Willingham
% then modified from plotsig for use with eye diagrams by Scott Meninger
function [] = eyediag1(x,period,start_off,s,color)

global sweep;

title_str = s(1);
sig = evalsig(x, char(s(1)));
%ivar=evalsig(x,'TIME');

%THIS IS WHERE YOU SET THE COLOR SCHEME

switch color
case 1
clr=char('r');
case 2
clr=char('y');
case 3
clr=char('b');
case 4
clr=char('g');
case 5
clr=char('c');
otherwise
clr=char('m');
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

for i = 2:length(s)
  title_str = strcat(title_str,', ',s(i));
  sig = [sig, evalsig(x, char(s(i)))];
end
eyediagprim(period,start_off,ivar,sig,sig,clr);

%if nargin > 2
%    switch log
%	case 'logx'
%	    semilogx(ivar, sig)
%	case 'logy'
%	    semilogy(ivar, sig)
%	case {'logxy','loglog'}
%	    loglog(ivar, sig)
%	otherwise
%	    fprintf('Warning (plotsig1): unrecognized plot_args\n')
%	    plot(ivar, sig)

%    end
%	    else
%myeye(period,start_off,ivar,sig,char(sig));
%end
%legend(char(sig));

title_str = strrep(title_str, '_', '\_');
title(title_str);
grid on;
