function [] = cppsim(parfile_name)

[status] = dos('echo %CppSimHome% > message.out');
home_name = get_output_message('message.out');

home_name = strrep(home_name,'\','/'); 
home_name = strrep(home_name,'C:','c:'); 
home_name = strrep(home_name,' ',''); 

home = char(home_name);

[status] = dos('echo %CppSimSharedHome% > message.out');
shared_home_name = get_output_message('message.out');

shared_home_name = strrep(shared_home_name,'\','/'); 
shared_home_name = strrep(shared_home_name,'C:','c:'); 
shared_home_name = strrep(shared_home_name,' ',''); 

shared_home = char(shared_home_name);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% no changes required for stuff below  %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% note:  directory name must correspond to cell name
%%        parent directory of cell directory must correspond to library name
cur_dir = pwd;
i = findstr(lower(cur_dir),'\simruns\');
library_cell = cur_dir(i+9:length(cur_dir));
[library_name,r] = strtok(library_cell,'\');
cell_name = r(2:length(r));

if nargin == 0
   sim_file = 'test.par';
else
   sim_file = parfile_name;
end

disp('... netlisting ...');
run_program = sprintf('%s/Sue2/bin/win32/sue_cppsim_netlister %s %s/Sue2/sue.lib %s/Netlist/netlist.cppsim',shared_home,cell_name,home,home);
[status] = dos(run_program);

if status ~= 0
   disp('************** ERROR:  exited CppSim run prematurely! ****************');
   return
end

disp('... running net2code ...');
run_program = sprintf('%s/bin/win32/net2code -matlab %s',shared_home,sim_file);
[status] = dos(run_program);

if status ~= 0
   disp('************** ERROR:  exited CppSim run prematurely! ****************');
   return
end

disp('... compiling ...');

newpath = sprintf('%s/Matlab',pwd);
run_program = sprintf('%s/compile_%s',newpath,cell_name);

flag = 0;
out_file = sprintf('%s/%s',newpath,cell_name);
if exist(out_file)
   out_file = sprintf('%s/%s.*',newpath,cell_name);
   delete(out_file);
end

run(run_program);
out_file = sprintf('%s/%s',newpath,cell_name);
if exist(out_file)
     disp(' ')
     disp('*********************  Done!  *********************')
     disp(' ')
     disp_message = sprintf('... adding path: ''%s'' ...',newpath);
     disp(disp_message);
     addpath(newpath);
     disp(' ')
     disp('****** Note:  to run mex function within Matlab: ******')
     disp_message = sprintf('>> %s  %%%% (shows input and output signals) %%%%',cell_name);
     disp(disp_message)
end



function message = get_output_message(filename);

message = {};
fid = fopen(filename,'r');
if fid < 0
   return
end

while 1
   tline = fgetl(fid);
   if tline ~= -1
      if length(message) == 0
         message = tline;
      else
         message = strvcat(message,tline);
      end 
   end
   if ~ischar(tline)
      break;
   end
end
fclose(fid);

