function measure(varargin)

% measure(<sigfig>)
%
% Interactive GUI for measuring points on a plot.
%
% sigfig is number of significant figures you would like to display. Default
% is four.
%
% Procedure:
%
% 1) Plot whatever it is you want to do measurements on.
%
% 2) Make sure it is the current figure (use the 'figure(x)' command, where 
%    'x' is the number of the figure).
%
% 3) Type 'measure'.
%
% 4) Move the mouse pointer around until the desired first measurement
%    point is highlighted.
%
% 5) Click the left-hand mouse button to select the first point.
%
% 6) Move the pointer around to select the second measurement point.
%
% 7) Click again to select the second point.
%
% 8) Selected points are labeled on the plot and printed in the MATLAB
%    command window, along with differences between the points and the slope
%    between them.
%
% 9) MATLAB's plot editing features can be used to move the labels around,
%    delete them, modify them, etc. (In the plot window, select 
%    Tools-> Enable Plot Editing.)
%
% NOTE: At any time during the measurement, you can press ESC to abort the
% measurement.
%
% Russell Croman
% 7 Apr 00
% Silicon Laboratories Inc.
% CONFIDENTIAL INFORMATION


clear global meas;
global meas;
clear measure_init;
clear measure_click;
clear measure_newloc;
clear measure_newaxes;
clear measure_done;

% Get information about the current figure
measure_init;

% Set number of significant figures if the user specified it.
if nargin > 0
  meas.sigfig = varargin{1};
else
  meas.sigfig = 4;
end

% Bring the current figure to the foreground
figure(meas.fig.h);

% Save all the current callbacks so plot editing/zooming state can be restored
meas.WindowButtonMotionFcn = get(meas.fig.h, 'WindowButtonMotionFcn');
meas.WindowButtonDownFcn = get(meas.fig.h, 'WindowButtonDownFcn');
meas.ResizeFcn = get(meas.fig.h, 'ResizeFcn');
meas.KeyPressFcn = get(meas.fig.h, 'KeyPressFcn');
meas.Interruptible = get(meas.fig.h, 'Interruptible');
meas.BusyAction = get(meas.fig.h, 'BusyAction');
meas.DoubleBuffer = get(meas.fig.h, 'DoubleBuffer');

% Set callbacks
set(meas.fig.h, 'WindowButtonMotionFcn', 'measure_newloc');
set(meas.fig.h, 'WindowButtonDownFcn', 'measure_click');
% set(meas.fig.h, 'ResizeFcn', 'meas.ax.h=0;');		% Cause a reevaluation if figure window resized
set(meas.fig.h, 'KeyPressFcn', 'measure_done');		% Any keypress in the figure causes an exit

set(meas.fig.h, 'Interruptible', 'off');
set(meas.fig.h, 'BusyAction', 'cancel');

set(meas.fig.h, 'DoubleBuffer', 'on');
