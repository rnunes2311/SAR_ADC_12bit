% measure_newloc.m
%
% Acquire the new pointer location and highlight the nearest graph curve
% data point.

function measure_newloc

global meas;

sf = meas.sigfig;

% See if we've moved over new axes
axh = overobj('axes');

if ~isempty(axh)		% we are over axes
  for i = 1:length(meas.ax)
    measaxh(i) = meas.ax(i).h;
  end
  axi = find(measaxh == axh);
  if ~isempty(axi) & ~isfield(meas, 'point')
    meas.axi = axi;		% set current axes index to current axes
  end
end

% Is there a current axes?
if isfield(meas, 'axi')
  if ~meas.axi
    return
  end
  axi = meas.axi;
else
  return
end

% Now we know there is a current axes. So find the closest line point
% and display a marker and label on it.


% Find current pointer location within the figure (in pixels)
loc = get(0, 'PointerLocation');
pxroot = loc(1);
pyroot = loc(2);
pxfig = pxroot - meas.fig.pxmin;
pyfig = pyroot - meas.fig.pymin;

% Now get pixel position within axes
px = pxfig - meas.ax(axi).pxmin;
py = pyfig - meas.ax(axi).pymin;

% Figure out which section of data to look at
% (speeds things up for large numbers of data points)
pxsmin = px - meas.ax(axi).pxsize*0.05;
pxsmax = px + meas.ax(axi).pxsize*0.05;

% Scan all lines for point closest to pointer
for l = 1:length(meas.ax(axi).line)
  i = find((meas.ax(axi).line(l).px >= pxsmin) & ...
           (meas.ax(axi).line(l).px <= pxsmax));
  if isempty(i)
    i = 1:length(meas.ax(axi).line(l).px);
  end

  % Compute Euclidean distance to each point from current pointer location
  dist = sqrt((meas.ax(axi).line(l).px(i)-px).^2 + ...
              (meas.ax(axi).line(l).py(i)-py).^2);

  % Select the minimum for this line
  [mindist(l) imindist(l)] = min(dist);

  % Convert index back to raw xdata array
  imindist(l) = i(imindist(l));
end

% Find closest point to pointer
[d, line] = min(mindist);

% Extract the data
% x  = get(meas.ax(axi).line(line).h, 'Xdata');
% y  = get(meas.ax(axi).line(line).h, 'Ydata');
xl = meas.ax(axi).line(line).x(imindist(line));
yl = meas.ax(axi).line(line).y(imindist(line));

% Store values in cursor data structure
meas.cursor.x = xl;
meas.cursor.y = yl;

% Delete old coordinate label, if it exists
if isfield(meas.cursor, 'texth')
  delete(meas.cursor.texth);
  meas.cursor.texth = [];
end

% Delete old marker, if it exists
if isfield(meas.cursor, 'markerh')
  delete(meas.cursor.markerh);
  meas.cursor.markerh = [];
end

% Delete old rubber band, if it exists
if isfield(meas.cursor, 'rubberh')
  delete(meas.cursor.rubberh);
  meas.cursor.rubberh = [];
end

% Display point coordinates
if ~isfield(meas, 'point')				% no first point yet
  string = strcat('[', num2eng(xl, sf),', ', num2eng(yl, sf), ']');
  meas.cursor.texth = text(meas.ax(axi).textx, meas.ax(axi).texty, string);
elseif ~((xl == meas.point(1).x) & (yl == meas.point(1).y))	% second point
  dx = xl - meas.point(1).x;
  dy = yl - meas.point(1).y;
  string = strcat('[', num2eng(xl, sf),', ', num2eng(yl, sf), ']   dx=', num2eng(dx, sf), '   dy=', num2eng(dy, sf));
  meas.cursor.texth = text(meas.ax(axi).textx, meas.ax(axi).texty, string);
end

% Put a marker on that point
axes(meas.ax(axi).h);
hold on;
meas.cursor.markerh = plot(xl, yl, 'ro');

% If a first point has been selected, draw a rubber band from
% that point to this point
if isfield(meas, 'point')
  meas.cursor.rubberh = plot([meas.point(1).x xl], [meas.point(1).y yl], 'r');
end

% Save points in case a button press happens
meas.curx = xl;
meas.cury = yl;

