% Set XY-limits for all plots in current figure.
% Usage: xylima([xs xe],[ys ye])
%  Note:  xylima('auto') resets to autoscaling on all graphs
%    Or: 'xylima' to set all curves to same as current axis
%  Written by Scott Meninger of MIT based on
%  xlima code by Scott Willingham of Silicon Laboratories, Inc.


function xylima(xx,yy)

if nargin == 0
    xx = xlim;
    yy = ylim;
end

h=get(gcf,'Children');
for i = 1:length(h)
    xlim(h(i), xx);
    ylim(h(i), yy);
end
