function measure_init

% measure_init
%
% For the current figure, set up the "meas" data structure for efficient
% operations.

global meas;

% Get the current figure's handle
meas.fig.h = gcf;

% Make pointer a watch so the user knows there's something going on.
ptr = get(meas.fig.h, 'Pointer');
set(meas.fig.h, 'Pointer', 'watch');

% Get size and position of figure
pos = get(meas.fig.h, 'Position');
meas.fig.pxmin  = pos(1);
meas.fig.pymin  = pos(2);
meas.fig.pxsize = pos(3);
meas.fig.pysize = pos(4);

% Find the axes
axh = findobj(meas.fig.h, 'Type', 'axes');

% Get info for each one
for a = 1:length(axh)
  ah = axh(a);
  meas.ax(a).h = ah;

  % Get size and position of axes
  units = get(ah, 'Units');
  set(ah, 'Units', 'pixels');
  pos = round(get(ah, 'Position'));
  meas.ax(a).pxmin  = pos(1);
  meas.ax(a).pymin  = pos(2);
  meas.ax(a).pxsize = pos(3);
  meas.ax(a).pysize = pos(4);
  set(ah, 'Units', units);
  
  % Get x and y limits of axes
  xlim = get(ah, 'XLim');
  meas.ax(a).xmin = xlim(1);
  meas.ax(a).xmax = xlim(2);
  
  ylim = get(ah, 'YLim');
  meas.ax(a).ymin = ylim(1);
  meas.ax(a).ymax = ylim(2);
  
  meas.ax(a).xsize = meas.ax(a).xmax - meas.ax(a).xmin;
  meas.ax(a).ysize = meas.ax(a).ymax - meas.ax(a).ymin;
    
  % Pull the scale type (linear or log)
  meas.ax(a).xscale = get(ah, 'XScale');
  meas.ax(a).yscale = get(ah, 'YScale');
  
  % Find the lines
  lineh = findobj(ah, 'Type', 'line');
  
  % Get the data for each of the lines
  for l = 1:length(lineh)
    lh = lineh(l);
    meas.ax(a).line(l).h = lh;
    meas.ax(a).line(l).xorig = get(lh, 'Xdata')';
    meas.ax(a).line(l).yorig = get(lh, 'Ydata')';
  
    % Thresh out only those data points within the current x axis limits
    % (speeds things up for large data sets)
    i = find((meas.ax(a).line(l).xorig >= meas.ax(a).xmin) & ...
             (meas.ax(a).line(l).xorig <= meas.ax(a).xmax));
    meas.ax(a).line(l).x = meas.ax(a).line(l).xorig(i);
    meas.ax(a).line(l).y = meas.ax(a).line(l).yorig(i);
  
    % Now stuff this truncated data back into the plot's data structure 
    % (needed to speed up plot re-draws)
    set(meas.ax(a).line(l).h, 'Xdata', meas.ax(a).line(l).x);
    set(meas.ax(a).line(l).h, 'Ydata', meas.ax(a).line(l).y);
  
    % Compute x pixel positions of each point within axes
    if strcmp(meas.ax(a).xscale, 'linear')
      f = meas.ax(a).pxsize/meas.ax(a).xsize;
      meas.ax(a).line(l).px = (meas.ax(a).line(l).x - meas.ax(a).xmin)*f;
    else	% log scale
      f = meas.ax(a).pxsize/log10(meas.ax(a).xmax/meas.ax(a).xmin);
      meas.ax(a).line(l).px = log10(meas.ax(a).line(l).x/meas.ax(a).xmin)*f;
    end
  
    % Compute y pixel positions of each point within axes
    if strcmp(meas.ax(a).yscale, 'linear')
      f = meas.ax(a).pysize/meas.ax(a).ysize;
      meas.ax(a).line(l).py = (meas.ax(a).line(l).y - meas.ax(a).ymin)*f;
    else
      f = meas.ax(a).pysize/log10(meas.ax(a).ymax/meas.ax(a).ymin);
      meas.ax(a).line(l).py = log10(meas.ax(a).line(l).y/meas.ax(a).ymin)*f;
    end
  end % line loop
  
  % Figure out where the coordinate display should go
  if strcmp(meas.ax(a).xscale, 'linear')
    meas.ax(a).textx = meas.ax(a).xmin + 0.05*meas.ax(a).xsize;
  else
    meas.ax(a).textx = meas.ax(a).xmin*1.05^log10(meas.ax(a).xmax/meas.ax(a).xmin);
  end
  
  if strcmp(meas.ax(a).yscale, 'linear')
    meas.ax(a).texty = meas.ax(a).ymax + 0.05*meas.ax(a).ysize;
  else
    meas.ax(a).texty = meas.ax(a).ymax*1.05^log10(meas.ax(a).ymax/meas.ax(a).ymin);
  end

end % axes loop

% Restore pointer shape  
set(meas.fig.h, 'Pointer', ptr);
