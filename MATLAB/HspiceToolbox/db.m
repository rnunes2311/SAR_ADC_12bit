%  written by Mike Perrott 
%   Copyright 1999 by Silicon Laboratories, Inc.

function [y] = db(x)

y = 20*log10(abs(x));
