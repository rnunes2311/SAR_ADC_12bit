function [] = eye_diag(period,start_off,time,data,ylabel_str)

%clf;
hold on;
for i = 1:length(time)
   if time(i) > start_off
      break;
   end
end
data = data(i:length(data));
time = time(i:length(time));

time = time-time(1);
time_off = 0;
j = 1;
for i = 1:length(data)
   if (time(i) - time_off) > period
      j = 1;
      time_off = time_off + period;
      plot(time_per,data_per);
      data_per = zeros(1,1);
      time_per = zeros(1,1);
   end
   data_per(j) = data(i);
   time_per(j) = time(i) - time_off;
   j = j+1;
end

xlabel('Time (seconds)');
ylabel_str = strrep(ylabel_str, '_', '\_');
ylabel(ylabel_str);
title('Eye Diagram');
grid on
zoom on
