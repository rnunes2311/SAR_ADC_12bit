%   written by Mike Perrott
%   Copyright 1999 by Silicon Laboratories, Inc.
function [y] = avg(time,x)

if size(time,1) < size(time,2)
  time = time';
end
if size(x,1) < size(x,2)
  x = x';
end
y = zeros(size(x));

z = integ(time,x);
t = time - repmat(time(1,:),length(time),1);

y(2:length(y),:) = z(2:length(y),:)./t(2:length(y),:);
y(1,:) = y(2,:);
