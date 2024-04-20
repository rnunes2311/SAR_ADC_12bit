function m = undb20(d)

% m = undb20(d)
%
% Converts the dB value(s) in 'd' to magnitude, using 10^(d/20).
%

m = 10.^(d/20);