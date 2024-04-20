% Plot expressions invoking signal names from structure x.
% Usage: eyesig(x,period,start_off,exp)
% Where period is the data period, start_off is the offset time, in seconds
% where you want to measure from, exp is the expresion for the signals.
% In exp, commas delimit curves to be overlayed and semicolons delimit
% seperate subplots on the same figure.  E.g., bigeyesig(x,'v1,v2;v3')
% creates two subplots, with eyes for v1 and v2 overlayed.  Also note
% that numeric node names should be prepended by '@' to distinguish
% them from constants.
%  written by Mike Perrott with modifications by Scott Willingham
% then hacked by Scott Meninger for use with eye diagrams
%
% If you want to change the color scheme edit eyediag1.m
%
% function [] = eyesig(x,period,start_off,exp)
function [] = eyesig(x,period,start_off,exp,plot_args)
clf;
delim_m = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@+-/*^().:';

nsp = 1 + sum(exp == ';');	% number of subplots

r = exp;

%% separate curves by '?' to avoid confusion with function arg delimiters
net_paren = 0;
for i=1:length(r)
   if r(i) == '('
      net_paren = net_paren+1;
   elseif r(i) == ')'
      net_paren = net_paren-1;
   elseif r(i) == ','
      if net_paren == 0
        r(i) = '?';
      end
   end
end

for i = 1:nsp
    subplot(nsp,1,i);
    cplot = [];
[t,r] = strtok(r,';');
    while length(t) > 0
    [s,t] = strtok(t,'?');
	if length(s) > 0
    cplot = [cplot, cellstr(s)];
	end
	[s,t] = strtok(t,delim_m);

    end

for y=1:length(cplot)
	eyediag1(x,period,start_off,cplot(y),y);
end

%    if nargin > 2
%	bigeye1(x,period,start_off,cplot);
%    else

%    end
%ylabel(cplot,'Rotation',0,'HorizontalAlignment','left')
     com=char(',');
     out=[];
for a=1:length(cplot)
     if length(cplot)>=2
          if a<=length(cplot)-1
              out=strcat(out,cplot(a),com);     
          else
              out=strcat(out,cplot(a));
          end
     else
	  out=strcat(out,cplot(a));

end
end


title(out)
end


xlabel(x(1).name);

zoom on
