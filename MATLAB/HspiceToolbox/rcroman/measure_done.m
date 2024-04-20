% measure_done.m
%
% Clean up.

function measure_done

global meas;

% Make pointer a watch so the user knows there's something going on.
ptr = get(meas.fig.h, 'Pointer');
set(meas.fig.h, 'Pointer', 'watch');

% Restore callbacks
set(meas.fig.h, 'WindowButtonMotionFcn', meas.WindowButtonMotionFcn)
set(meas.fig.h, 'WindowButtonDownFcn', meas.WindowButtonDownFcn);
set(meas.fig.h, 'ResizeFcn', meas.ResizeFcn);
set(meas.fig.h, 'KeyPressFcn', meas.KeyPressFcn);
set(meas.fig.h, 'Interruptible', meas.Interruptible);
set(meas.fig.h, 'BusyAction', meas.BusyAction);
set(meas.fig.h, 'DoubleBuffer', meas.DoubleBuffer);

% Remove marker objects
if isfield(meas, 'cursor')
  % Delete old coordinate label, if it exists
  if meas.cursor.texth
    delete(meas.cursor.texth);
    meas.cursor.texth = [];
  end

  % Delete old marker, if it exists
  if meas.cursor.markerh
    delete(meas.cursor.markerh);
    meas.cursor.markerh = [];
  end

  % Delete old rubber band, if it exists
  if isfield(meas.cursor, 'rubberh')
    if meas.cursor.rubberh
      delete(meas.cursor.rubberh);
      meas.cursor.rubberh = [];
    end
  end
end

% Restore the axes' old Xdata & Ydata from previous truncation
for axi = 1:length(meas.ax)
  for l = 1:length(meas.ax(axi).line)
    set(meas.ax(axi).line(l).h, 'Xdata', meas.ax(axi).line(l).xorig);
    set(meas.ax(axi).line(l).h, 'Ydata', meas.ax(axi).line(l).yorig);  
  end
end

% Restore pointer shape
set(meas.fig.h, 'Pointer', ptr);

clear global meas;

hold off;
