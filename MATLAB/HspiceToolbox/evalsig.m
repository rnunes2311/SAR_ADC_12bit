% Evaluate expression, invoking signal names from structure x.
% Usage: y = evalsig(x, expr)
% Note that numeric node names should be prepended by '@' to
% distinguish them from constants.  If the global variable
% 'sweep' exists and is non-zero, a single curve is selected
% from multiple SPICE parameter sweeps.  Setting sweep=0
% returns data for all sweeps.
%
%   Written by Mike Perrott 
%   Sweep selection added by Scott Willingham

function [y] = evalsig(x,expr)

global sweep; % selects just one curve of data set


%% replace ^ with .^, * with .*, / with ./ 
%% unless they are already preceeded by .
expr = strrep(expr,'.^','^');
expr = strrep(expr,'.*','*');
expr = strrep(expr,'./','/');

expr = strrep(expr,'^','.^');
expr = strrep(expr,'*','.*');
expr = strrep(expr,'/','./');

%% parse expression

delim = '+-/*^().:, ';
delim_m = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@';

for j = 1:length(expr)
   if (expr(j) ~= ' ' & expr(j) ~= '-' & expr(j) ~= '(' & expr(j) ~= '+')
      break;
   end
end

if (j > 1)
  beginning = cellstr(expr(1:(j-1)));
else
  beginning = ' ';
end
i = 1;

r = expr(j:length(expr));
while(1)
   if length(r) > 0
      [t,r] = strtok(r,delim);
      if length(t) > 0
         c(i) = cellstr(t);
      end
      i = i+1;
      [t,r] = strtok(r,delim_m);
      if length(t) > 0
         c(i) = cellstr(t);
      end
      i=i+1;
   else
      break;
   end
end

%% prepend all node names that are pure numbers with @
for i=1:length(x)
  temp_string = x(i).name;
  if sum(isletter(temp_string)) == 0
    x(i).name = strcat('@',x(i).name);
  end
end

%% substitute structure names for spice signals names
for i = 1:length(x)
   match_vec = strmatch(x(i).name,c,'exact');

   if length(match_vec) > 0
      for k=1:length(match_vec)
         if match_vec(k) < length(c)
            if strncmp(c(match_vec(k)+1),'(',1) ~= 1 %%avoid subst of functions
               szdata = size(x(i).data);
               if sweep > 0 & sweep <= szdata(2)
		   c(match_vec(k))=cellstr(sprintf('x(%d).data(:,%d)',i,sweep));

               else
		   c(match_vec(k))=cellstr(sprintf('x(%d).data',i));
               end
            end
         else
               szdata = size(x(i).data);
               if sweep > 0 & sweep <= szdata(2)
		   c(match_vec(k))=cellstr(sprintf('x(%d).data(:,%d)',i,sweep));

               else
		   c(match_vec(k))=cellstr(sprintf('x(%d).data',i));
               end
         end
      end
   end
end

%% convert to string
pexp='';
for i=1:length(c)
   pexp = strcat(pexp,c(i));
end

pexp = strcat(beginning,pexp);
%% evaluate expression

y = eval(char(pexp));
