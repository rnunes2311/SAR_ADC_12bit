% Set Y-limits for all plots in current figure.
% Usage: ylima([ys ye])
%  Note:  ylima('auto') resets to autoscaling on all graphs
%    Or: 'ylima' to set all curves to same as current axis
%  Written by Scott Meninger of MIT, based
%  xlima code by Scott Willingham of Silicon Laboratories, Inc.

function ylima(yy)

if nargin == 0
    yy = ylim;
end

h=get(gcf,'Children');
for i = 1:length(h)
    ylim(h(i), yy);
end
