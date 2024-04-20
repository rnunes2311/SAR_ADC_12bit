function [rise_cr,fall_cr] = tr_times(time,data,rise_thresh,fall_thresh)

rise_count = 1;
fall_count = 1;
for i = 2:length(data)
   if (data(i) > rise_thresh & data(i-1) <= rise_thresh)
      rise_count = rise_count + 1;
   end
   if (data(i) < fall_thresh & data(i-1) >= fall_thresh)
      fall_count = fall_count + 1;
   end
end

rise_cr = zeros(rise_count,1);
fall_cr = zeros(fall_count,1);

rise_count = 1;
fall_count = 1;

for i = 2:length(data)
   if (data(i) > rise_thresh & data(i-1) <= rise_thresh)
      interp_time = time(i) + (rise_thresh - data(i))*(time(i)-time(i-1))/(data(i)-data(i-1));
      rise_cr(rise_count) = interp_time;
      rise_count = rise_count + 1;
   end
   if (data(i) < fall_thresh & data(i-1) >= fall_thresh)
      interp_time = time(i) + (fall_thresh - data(i))*(time(i)-time(i-1))/(data(i)-data(i-1));
      fall_cr(fall_count) = interp_time;
      fall_count = fall_count + 1;
   end
end

