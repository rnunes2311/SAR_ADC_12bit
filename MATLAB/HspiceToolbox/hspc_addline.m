function [] = hspc_addline(new_line, parfile_name)

%% note:  directory name must correspond to cell name
%%        parent directory of cell directory must correspond to library name
cur_dir = lower(pwd);
cur_dir = strrep(cur_dir,'\','/'); 
i = findstr(cur_dir,'/simruns/');
cur_dir = pwd;
cur_dir = strrep(cur_dir,'\','/'); 
if length(i) < 1
   disp('Error:  you need to run the hspc_addline.m script in a directory');
   disp('    of form '' ...../SimRuns/Library_name/Cell_name''');
   disp('    -> in this case, you ran in directory:');
   disp(cur_dir); 
   return
end
library_cell = cur_dir(i+9:length(cur_dir));
[library_name,r] = strtok(library_cell,'/');
cell_name = r(2:length(r));

if nargin == 1
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
     temp_string = sprintf('Error in ''hspc_addline'':  file ''%s'' not found',sim_file);
     disp(temp_string);
     return;
end

disp_msg = sprintf('-> Adding line ''%s'' in file ''%s''', new_line, sim_file);
disp(disp_msg);

temp_filename = sprintf('%s_temp',sim_file);
fod = fopen(temp_filename,'w');

found_flag = 0;

while 1
   tline = fgets(fid);
   if ~ischar(tline)
     break
   end
   if (strncmp(tline,'**** added line below using ''hspc_addline'' function ****',55) == 1 || strncmp(tline,'**** added line below using ''hspc_addline_continued'' function ****',65) == 1)
     tline = fgets(fid);
     if ~ischar(tline)
        break
     end
     continue;
   end

   [tok,rem] = strtok(tline,' ');
   if (found_flag == 0)
      if (strcmp(tok,'.param') == 1 || strcmp(tok,'.temp') == 1 || strcmp(tok,'.options') == 1 || strcmp(tok,'.tran') == 1 || strcmp(tok,'.dc') == 1 || strcmp(tok,'.ac') == 1 || strcmp(tok,'.noise') == 1 || strcmp(tok,'.probe') == 1)
         found_flag = 1;
      end
   end
   if (found_flag == 1)
      found_flag = 2;
      fprintf(fod,'%s',tline);
      fprintf(fod,'**** added line below using ''hspc_addline'' function ****\n');
      fprintf(fod,'%s\n',new_line);
   else
      fprintf(fod,'%s',tline);
   end
end

if (found_flag == 0)
    fprintf(fod,'**** added line below using ''hspc_addline'' function ****\n');
    fprintf(fod,'%s\n',new_line);
end

fclose(fid);
fclose(fod);


copyfile(temp_filename,sim_file);
