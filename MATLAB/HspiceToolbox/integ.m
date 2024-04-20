%   written by Mike Perrott
%   Copyright 1999 by Silicon Laboratories, Inc.
function [y] = integ(time,x)

if size(time,1) < size(time,2)
  time = time';
end
if size(x,1) < size(x,2)
  x = x';
end
y = zeros(size(x));
y(1,:) = 0;
for i = 2:length(x)
     y(i,:) = y(i-1,:) + x(i,:).*(time(i,:)-time(i-1,:));
end
