% measure_newaxes.m
%
% Acquire the new axes and precalculate pixel coordinates.
%

function measure_newaxes(ax)

global meas;

% Make pointer watch so the user knows there's something going on.
ptr = get(meas.fig.h, 'Pointer');
set(meas.fig.h, 'Pointer', 'watch');

% First, restore the axes' old Xdata & Ydata from previous truncation
if meas.ax.h
  for c = 1:length(meas.line)
    set(meas.line(c).h, 'Xdata', meas.line(c).xorig);  
    set(meas.line(c).h, 'Ydata', meas.line(c).yorig);
  end
end

clear global meas.ax;
clear global meas.line*;
meas.ax.h = ax;

% Get size and position of figure
pos = get(meas.fig.h, 'Position');
meas.fig.pxmin  = pos(1);
meas.fig.pymin  = pos(2);
meas.fig.pxsize = pos(3);
meas.fig.pysize = pos(4);

% Get size and position of axes
units = get(meas.ax.h, 'Units');
set(meas.ax.h, 'Units', 'pixels');
pos = round(get(meas.ax.h, 'Position'));
meas.ax.pxmin  = pos(1);
meas.ax.pymin  = pos(2);
meas.ax.pxsize = pos(3);
meas.ax.pysize = pos(4);
set(meas.ax.h, 'Units', units);

% Get x and y limits of axes
xlim = get(meas.ax.h, 'XLim');
meas.ax.xmin = xlim(1);
meas.ax.xmax = xlim(2);

ylim = get(meas.ax.h, 'YLim');
meas.ax.ymin = ylim(1);
meas.ax.ymax = ylim(2);

meas.ax.xsize = meas.ax.xmax - meas.ax.xmin;
meas.ax.ysize = meas.ax.ymax - meas.ax.ymin;
  
% Pull the scale type (linear or log)
meas.xscale = get(meas.ax.h, 'XScale');
meas.yscale = get(meas.ax.h, 'YScale');

% Find the lines
clear global meas.line*;
lineh = findobj(meas.ax.h, 'Type', 'line');
% meas.line(:).h = findobj(meas.ax.h, 'Type', 'line');

% Get the data for each of the lines
for c = 1:length(lineh)
  meas.line(c).h = lineh(c);
  meas.line(c).xorig = get(meas.line(c).h, 'Xdata')';
  meas.line(c).yorig = get(meas.line(c).h, 'Ydata')';

  % Thresh out only those data points within the current x axis limits
  % (speeds things up for large data sets)
  i = find((meas.line(c).xorig >= meas.ax.xmin) & ...
           (meas.line(c).xorig <= meas.ax.xmax));
  meas.line(c).x = meas.line(c).xorig(i);
  meas.line(c).y = meas.line(c).yorig(i);

  % Now stuff this truncated data back into the plot's data structure 
  % (needed to speed up re-draws)
  set(meas.line(c).h, 'Xdata', meas.line(c).x);
  set(meas.line(c).h, 'Ydata', meas.line(c).y);

  % Compute x pixel positions of each point within axes
  if strcmp(meas.xscale, 'linear')
    f = meas.ax.pxsize/meas.ax.xsize;
    meas.line(c).px = (meas.line(c).x - meas.ax.xmin)*f;
  else
    f = meas.ax.pxsize/log10(meas.ax.xmax/meas.ax.xmin);
    meas.line(c).px = log10(meas.line(c).x/meas.ax.xmin)*f;
  end

  % Compute y pixel positions of each point within axes
  if strcmp(meas.yscale, 'linear')
    f = meas.ax.pysize/meas.ax.ysize;
    meas.line(c).py = (meas.line(c).y - meas.ax.ymin)*f;
  else
    f = meas.ax.pysize/log10(meas.ax.ymax/meas.ax.ymin);
    meas.line(c).py = log10(meas.line(c).y/meas.ax.ymin)*f;
  end
end

% Figure out where the coordinate display should go
if strcmp(meas.xscale, 'linear')
  meas.textx = meas.ax.xmin + 0.05*meas.ax.xsize;
else
  meas.textx = meas.ax.xmin*1.05^log10(meas.ax.xmax/meas.ax.xmin);
end

if strcmp(meas.yscale, 'linear')
  meas.texty = meas.ax.ymax + 0.05*meas.ax.ysize;
else
  meas.texty = meas.ax.ymax*1.05^log10(meas.ax.ymax/meas.ax.ymin);
end

set(meas.fig.h, 'Pointer', ptr);
