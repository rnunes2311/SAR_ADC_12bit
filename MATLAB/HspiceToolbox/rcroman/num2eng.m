function string=num2eng(x, varargin)

% function string = num2eng(x <,sigfig> )
%
% Formats x in engineering notation, with proper suffix.
%
% If input argument sigfig is included, will format with that many significant
% figures. This should not be less than three. Default is four.
%
%
% Russell Croman, 6Apr00
% Silicon Laboratories Inc.
% CONFIDENTIAL INFORMATION

if nargin == 2
  sigfig = varargin{1};
else
  sigfig = 4;
end

if sigfig < 3
  sigfig = 3;
end

if x ~= 0			% non-zero
  suffixes = 'zafpnum kMGT';

  % Figure suffix
  i = floor(log10(x)/3);

  if (i < -7) | (i > 4)
    s = sprintf('E%d', i*3) ;
  else
    s = suffixes(i+8);
  end

  % Figure mantissa
  m = x/10^(i*3);

  % Figure number of decimal places
  dp = (sigfig-1) - floor(log10(m));

  % Build string
  format = sprintf('%%%d.%df%s', sigfig, dp, s);
else
  m = 0;
  format = sprintf('%%%d.3f ', sigfig);
end

string = sprintf(format, m);
