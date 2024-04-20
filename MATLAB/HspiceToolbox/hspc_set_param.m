function [] = hspc_set_param(param_name, param_value, parfile_name)

%% note:  directory name must correspond to cell name
%%        parent directory of cell directory must correspond to library name
cur_dir = lower(pwd);
cur_dir = strrep(cur_dir,'\','/'); 
i = findstr(cur_dir,'/simruns/');
cur_dir = pwd;
cur_dir = strrep(cur_dir,'\','/'); 
if length(i) < 1
   disp('Error:  you need to run the hspc_set_param.m script in a directory');
   disp('    of form '' ...../SimRuns/Library_name/Cell_name''');
   disp('    -> in this case, you ran in directory:');
   disp(cur_dir); 
   return
end
library_cell = cur_dir(i+9:length(cur_dir));
[library_name,r] = strtok(library_cell,'/');
cell_name = r(2:length(r));

if nargin == 2
   sim_file = 'test.hspc';
else
   i = findstr(parfile_name,'.hspc');
   if length(i) < 1
      sim_file = sprintf('%s.hspc',parfile_name);
   else
      sim_file = parfile_name;
   end
end


fid = fopen(sim_file,'r');
if (fid == -1)
     temp_string = sprintf('Error in ''hspc_set_param'':  file ''%s'' not found',sim_file);
     disp(temp_string);
     return;
end

disp_msg = sprintf('-> Changing parameter ''%s'' to value ''%g'' in file ''%s''',param_name, param_value, sim_file);
disp(disp_msg);

temp_filename = sprintf('%s_temp',sim_file);
fod = fopen(temp_filename,'w');

found_flag = 0;

while 1
   tline = fgets(fid);
   new_line = '';
   if ~ischar(tline)
     break
   end
   [tok,rem] = strtok(tline,' ');
   if (strcmp(tok,'.param') == 1)
     while 1
        [tok, rem] = strtok(rem,' =');
        if isempty(tok)
           break;
        end
        if (strcmp(tok,param_name) == 1)
            index_set = findstr(tline,tok);
            for i = 1:length(index_set)
               check_index = index_set(i) + length(tok);
               if (tline(check_index) == ' ' || tline(check_index) == '=')
                  break
               end
            end
	    index = index_set(i)-1;

            [tok, rem] = strtok(tline((index+1):end),' =');
            if isempty(rem)
               disp('Error:  .param statement in simrun.sp appears faulty');
	       disp('-> line reads:'); 
               disp(tline);
	       return;
            end
	    [tok, rem] = strtok(rem,' =');
            if isempty(rem)
               new_line = sprintf('%s%s=%g\n',tline(1:index),param_name,param_value);
	    else
               new_line = sprintf('%s%s=%g%s\n',tline(1:index),param_name,param_value,rem);
            end
            found_flag = 1;
        end
     end
   end
   if isempty(new_line)
      fprintf(fod,'%s',tline);
   else
      fprintf(fod,'%s',new_line);
   end
end
fclose(fid);
fclose(fod);

if (found_flag == 0)
     error_message = sprintf('Error in ''hspc_set_param'':  can''t find parameter ''%s''',param_name);
     disp(error_message);
     return;
end

copyfile(temp_filename,sim_file);
