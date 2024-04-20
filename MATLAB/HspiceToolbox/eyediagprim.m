%function [] = eyediagprim(period,start_off,time,data,ylabel_str,color)
%Written by Scott Meninger as a fast eye diagram generator this is a 
%replacement for plot for use with eye diagrams
function [] = eyediagprim(period,start_off,time,data,ylabel_str,color)
%tic
     Ts=time(20)-time(19);
     ti=round(start_off/Ts)+1;
     data_samp=round(period/Ts);
%    clf;
     hold on;

     check=0.0;
     for i=1:round((max(time)-start_off)/period)-1
     if check <length(data)
     plot(time(ti:ti+data_samp)-start_off,data(ti+data_samp*(i-1):ti+data_samp*i),color);

end
     check=check+1;
end

%xlabel('Time (seconds)');
%ylabel_str = strrep(ylabel_str, '_', '\_');
%ylabel(ylabel_str);
%title('Eye Diagram');
xlima([0 period])
%grid on
%zoom on
%toc
%hold on
