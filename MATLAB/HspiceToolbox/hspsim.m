function [] = hspsim(parfile_name)

cppsim_home = getenv('CppSimHome');
if length(cppsim_home) == 0
   cppsim_home = getenv('CPPSIMHOME');
end
if length(cppsim_home) == 0
   disp('Error running hspsim Matlab script:  environment variable');
   disp('   CPPSIMHOME is undefined');
   return
end
cppsim_home = strrep(cppsim_home,'\','/'); 
cppsim_home = strrep(cppsim_home,'C:','c:'); 
cppsim_home = strrep(cppsim_home,' ',''); 

cppsimshared_home = getenv('CppSimSharedHome');
if length(cppsimshared_home) == 0
   cppsimshared_home = getenv('CPPSIMSHAREDHOME');
end
if length(cppsimshared_home) == 0
   disp('Error running hspsim Matlab script:  environment variable');
   disp('   CPPSIMSHAREDHOME is undefined');
   return
end
cppsimshared_home = strrep(cppsimshared_home,'\','/'); 
cppsimshared_home = strrep(cppsimshared_home,'C:','c:'); 
cppsimshared_home = strrep(cppsimshared_home,' ',''); 

%% directory where sue.lib is placed
suelib_dir = sprintf('%s/Sue2',cppsim_home);

os_var = getenv('OS');
if length(os_var) == 0
   operating_system = 'Linux  ';
else
   operating_system = 'Windows';
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% no changes required for stuff below  %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% note:  directory name must correspond to cell name
%%        parent directory of cell directory must correspond to library name
cur_dir = lower(pwd);
cur_dir = strrep(cur_dir,'\','/'); 
i = findstr(cur_dir,'/simruns/');
cur_dir = pwd;
cur_dir = strrep(cur_dir,'\','/'); 
if length(i) < 1
   disp('Error:  you need to run the hspsim.m script in a directory');
   disp('    of form '' ...../SimRuns/Library_name/Cell_name''');
   disp('    -> in this case, you ran in directory:');
   disp(cur_dir); 
   return
end
library_cell = cur_dir(i+9:length(cur_dir));
[library_name,r] = strtok(library_cell,'/');
cell_name = r(2:length(r));

if nargin == 0
   sim_file = 'test.hspc';
else
   i = findstr(parfile_name,'.hspc');
   if length(i) < 1
      sim_file = sprintf('%s.hspc',parfile_name);
   else
      sim_file = parfile_name;
   end
end

disp_msg = sprintf('Library: %s,  Cell: %s,  Parameter file: %s',library_name,cell_name,sim_file);
disp(disp_msg)


disp('... netlisting ...');
if operating_system == 'Windows'
   run_program = sprintf('%s/Sue2/bin/win32/sue_spice_netlister %s %s/sue.lib netlist.hspsim no_top',cppsimshared_home,cell_name,suelib_dir);
else
   run_program = sprintf('%s/Sue2/bin/sue_spice_netlister %s %s/sue.lib netlist.hspsim no_top',cppsimshared_home,cell_name,suelib_dir);
end
[status] = system(run_program);

if status ~= 0
   disp('************** ERROR:  exited Hspice run prematurely! ****************');
   return
end

disp('... running hspc ...');
if operating_system == 'Windows'
   run_program = sprintf('%s/HspiceToolbox/HSPC/bin/win32/hspc netlist.hspsim simrun.sp %s.hspc',cppsimshared_home,strtok(sim_file,'.'));
else
   run_program = sprintf('%s/HspiceToolbox/HSPC/bin/hspc netlist.hspsim simrun.sp %s.hspc',cppsimshared_home,strtok(sim_file,'.'));
end
[status] = system(run_program);

if status ~= 0
   disp('************** ERROR:  exited Hspice run prematurely! ****************');
   return
end

disp('... running hspice ...');

run_program = sprintf('hspice -i simrun.sp -o simrun');
[status] = system(run_program);

if status ~= 0
   disp('************** ERROR:  exited Hspice run prematurely! ****************');
   return
end



