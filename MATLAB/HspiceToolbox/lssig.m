%  written by Mike Perrott with modifications by Scott Willingham
%   Copyright 1999 by Silicon Laboratories, Inc.

function [slist] = lssig(x)

slist = strvcat(x(1:end).name);

nlist = (1:length(x))';
slist = [num2str(nlist,'%5d: '), slist];
