% Set X-limits for all plots in current figure.
% Usage: xlima([xs xe])
%  Note:  xlima('auto') resets to autoscaling on all graphs
%    Or: 'xlima' to set all curves to same as current axis
% Written by Scott Willingham
%   Copyright 1999 by Silicon Laboratories, Inc.

function xlima(xx)

if nargin == 0
    xx = xlim;
end

h=get(gcf,'Children');
for i = 1:length(h)
    xlim(h(i), xx);
end
