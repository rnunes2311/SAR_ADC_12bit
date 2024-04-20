function tzoom (Command , Command_input)
%TZOOM   adds GUI zooming/panning and cropping to a 2-D figure with a single plot or
%           multiple axes with a common abscissa (e.g. time).
%
%           Notes:
%           1)TZOOM can be used with any 2-D figure regardless of the
%               subplots nature in the figure, and hence the x-axis is not
%               restricted to time. Nevertheless, it will be assumed for the
%               help content below, that x-axis represents time.
%           2)hotkeys are enclosed within parenthesis in the button name,
%               and they are stay active when the buttons are removed
%           3)Some buttons have tips which pop up when the mouse hover overt it
%           4)The left-hand mouse button is used for point selection.
%               Pressing any other button is interpreted as a cancel code.
%           5)All button functionalities are accessible from command line.
%           6)Clicking outside the plot areas avoids the annoying delay between the pressing of the mouse button and the
%               actual point that gets selected (this happens if the mouse moves after pressing on a plot with a large number of data points)
%
%   TZOOM with no arguments adds the GUI buttons to the current figure.
%       It does nothing if no figures exist 
%
%   TZOOM COMMAND executes the tzoom associated 'COMMAND' . TZOOM commands are described below 
%   TZOOM('COMMAND',command_argument) executes the tzoom 'COMMAND' using the
%       command_argument array as an input. For example: tzoom('zoom',[t1 t2])
%
%   TZOOM ZOOM zooms the time scale to the time coordinates of the two pointes selected using the left-hand mouse button 
%   TZOOM('zoom',[t1 t2]) zooms the time scale to between the coordinates t1 and t2
%
%   TZOOM UNZOOM unzooms the time scale. Similar to TZOOM ZOOM in
%       operation, but instead unzooms the time scale according to the following rules: 
%       1)scale_center=midpoint between the two points 
%       2)unzoom_factor=(time distance between the two points)/(current scale range)    
%
%   TZOOM FULL sets the x-axis scale mode to auto, to show the full range of the data 
%
%   TZOOM LIMITS sets the lower and upper time limits using a user input dialog box.
%       This is useful when precise time scale limits are needed. For example when
%       comparing two figures with slightly shifted signals.
%
%   TZOOM CROP crops the time scale. Similar to TZOOM ZOOM but instead
%       deletes the data outside the selected limits. This especially useful for
%       plots with a large number of points which take a long time for the
%       figure to refresh. Note that each plot in MATLAB stores its data in 
%       its properties, even if the data was removed from the MATALB workspace.
%       The crop functions are not reversible. All the data
%       outside the specified range will be deleted from the figure (but
%       not from the MATLAB workspace).
%
%   TZOOM CROPNEW copies the figure to a new one with identical format but
%       with only the data in the selected time range 
%       This function is especially useful when comparing signals at
%       different times of the same figure.
%       The figure name of the new figure is changed to reflect its origin.
%       For example figure number 13 which was cropped from a figure with the name
%       "Figure No. 11" will be given the name"11/13". The figure name can
%       be changed through the figname function, in CppSim toolbox  
%
%   TZOOM MARKER toggles the marker in all the plots between a circle and no
%       marker. This is useful to distinguish the location of the data points.
%
%   TZOOM POINTER toggles the pointer between an arrow and a full
%       crosshair. This is useful when comparing signal levels of different
%       plots at the same time point, e.g. transitions in time diagrams
%
%   TZOOM REMOVE removes the TZOOM buttons from the figure (usually for exporting)
%   
%   TZOOM MEASURE measures the y-value, time and index at the selected point.
%       To access these measured values, issue the following command in your
%       workspace window: global time_value y_value index_value
%
%   TZOOM MEASUREDIFF measures the difference of the coordinates (y-value, time and index) of two selected points.
%       To access these measured values, issue the following command in your
%       workspace window: global time_value y_value index_value
%
%   TZOOM EXTRACT extracts the x and y data values of the current axis.
%   Currently only one line per axis is supported. 
%       To access the data, issue the following command in your
%       workspace window: global time_value y_value index_value
%           
%   TZOOM YFULL  expands the y-axis scale of a plot to the maximum and minimum
%       values of the visible points of the selected plot (selected by the
%       mouse). 
%       If the y-axis value is constant, then the y-axis scale is expanded
%       to show a percentage of the absolute value of the constat y-value.
%       This percentage is set by the variable 'y_ratio' which has the
%       default value of 1% (i.e y_ratio=0.01).
%
%   TZOOM PAN moves the center of the plots to the right or to the left, if the pan value is positive or negative, respectively
%       Note that pressing the button or issuing the command TZOOM PAN
%       without arguments causes a dialog box to appear. Using the hot keys
%       for left "[" and right "]" panning only works when the buttons are
%       not removed, as the pan value is stored in the button's properties.
%   
%   Hotkeys: (Z):zoom (U):unzoom (F):full-time (P):pan ([):pan left (]):pan right 
%       (C):crop time (N):crop to a new figure (M):toggle marker (R):toggle pointer (Y):full y-axis 
%       There is no hotkey for button removal, to avoid unintentional
%       invoking. The hotkeys can be customized. Search for the word 'hotkey'.
%       
%      
%   Written by Belal M Helal (bhelal@mit.edu) as part of the CppSim package.
%   For more information: http://www-mtl.mit.edu/research/perrottgroup/tools.html
%   Comments, suggestions, error reporting, or any feedback are very welcome.
%
%
%   Version 2.0 2-4-2004
%   Version 1.0: 6-16-2003
grid on;                                    %display grid                         
hf=get(0,'currentfigure');                  %get the handle for the current figure
fig_name=get(hf,'Name');    %get the figure name
if isempty(hf);return;end;                  %if there is no current figure, do nothing
h_axes=findobj(hf,'Type','axes')';          %find the handles for the axes objects. The transpose is added to make it a one row and hence go through the indices of h_axes
%Check if there is no argument, in which case
if nargin==0
    Command='gui';
elseif nargin==1
    Command_input=[];
end;
Command=lower(Command);                     %make sure that commands are in lower case
switch Command                              %switch branching for different commands
%--------------------------------------------------------------------------
    case 'zoom',
        xx=ginput2(Command_input);          %get the two time points from the figure using the mouse or input arguments
        if xx(1)==xx(2); return;end;        %do nothing if the two points are equal
        set(h_axes,'XLim',xx);              %Update the x-axis scale
%--------------------------------------------------------------------------
    case 'unzoom',
        current_limits=xlim(h_axes(end));                       %get current time limits
        current_range=current_limits(2)-current_limits(1);
		xx=ginput2(Command_input);                              %get the two time points from the figure using the mouse
        if xx(1)==xx(2); return;end;                            %do nothing if the two points are equal
        a=xx(1);  b=xx(2);
        new_range=current_range^2/(b-a);
        new_center=(a+b)/2;
        xx=[new_center-new_range/2 new_center+new_range/2];
        set(h_axes,'XLim',xx);                                  %Update the x-axis scale
%--------------------------------------------------------------------------        
     case 'full',
         set(h_axes,'XLimMode','auto');                         %set the x-axis scale to the auto mode
         set(h_axes,'YLimMode','auto');                         %set the y-axis scale to the auto mode
%--------------------------------------------------------------------------            
    case 'limits',
        current_limits=xlim(h_axes(end));   %get current time limits
        num_digits=10;                      %number of digits in the time limits, change if needed
        def = {num2str(current_limits(1),num_digits),num2str(current_limits(2),num_digits)};
        prompt = {'Enter the Lower time-limit:','Enter the Upper time-limit:'};
        answer  = inputdlg(prompt,'Set Time Scale Limits',1,def);
        if isempty(answer);return;end;      %do nothing in the case of a canceled input
        xx=[str2double(answer(1)) str2double(answer(2))];
        if xx(1)==xx(2); return;end;        %do nothing if the two points are equal
        set(h_axes,'XLim',xx);              %Update the x-axis scale
%--------------------------------------------------------------------------            
    case 'crop',
        xx=ginput2(Command_input);              %get the two time points from the figure using the mouse
        if xx(1)==xx(2); return;end;            %do nothing if the two points are equal
		hl=get(h_axes(end),'Children');         %get the handle of line in the last axis
		xdata=get(hl(1),'XData');               %get the time data points
		x1_index=find( min( abs( xdata-xx(1) ) ) == ( abs( xdata-xx(1) ) ) ); % get the index of the nearset point to the starting of the desired limit     
		x2_index=find( min( abs( xdata-xx(2) ) ) == ( abs( xdata-xx(2) ) ) ); % get the index of the nearset point to the end of the desired limit     
		if(x1_index==x2_index); return;end;
		for hai = h_axes;
            xlim(hai,xx);                       %Update the x-axis scale
			hli=get(hai,'Children');            %get the handle of line in the current axis
            nl=length(hli);
            for i=1:nl;                         %loop through the lines, in case there are more than one in the same axis
                ydata=get(hli(i),'YData');
                set(hli(i),'XData',xdata(x1_index:x2_index),'YData',ydata(x1_index:x2_index));
            end;
		end
 %-------------------------------------------------------------------------
    case 'cropnew',
		xx=ginput2(Command_input);              %get the two time points from the figure using the mouse
        if xx(1)==xx(2); return;end;            %do nothing if the two points are equal
		hl=get(h_axes(end),'Children');         %get the handle of line in the last axis
		xdata=get(hl(1),'XData');                  %get the time data points
		x1_index=find( min( abs( xdata-xx(1) ) ) == ( abs( xdata-xx(1) ) ) ); % get the index of the nearset point to the starting of the desired limit     
		x2_index=find( min( abs( xdata-xx(2) ) ) == ( abs( xdata-xx(2) ) ) ); % get the index of the nearset point to the end of the desired limit     
		if(x1_index==x2_index); return;end;     %do nothing if the two points are the same
		old_fig=hf;                             %get the handle of the parent figure
        new_fig=figure; %make a new figure and return its handle
                        %name the figure to refelect that it is a cropped part of the original figure
                        %   this is useful when you have many figures and are trying to
                        %   figure the origins of these figures
        
        %Copy the figure name and change it to refulect its origin (i.e. which figure it was cropped from)                
        old_fig_name=get(old_fig,'Name');
        if strcmp(get(old_fig,'NumberTitle'),'on');                     %if the figure title is on (i.e. "Figure No. x)
            new_fig_name=[num2str(old_fig) '/' num2str(new_fig)];       %name the new figure x/y, where x and y are the number of the old and new figures, respectively
            if ~isempty(old_fig_name);
                new_fig_name=[new_fig_name ': ' old_fig_name];          %add the old name, in case it was not empty 
            end;
        else                                                            %if the figure title is turned off (i.e. no "Figure No. x"
            [old_num old_name]=strtok(old_fig_name,':');    %check if the figure had the format figure_number: figure_name
            last_slash=findstr(old_num,'/');                % get the position of the slashes, if any, before the ':'
                if length(last_slash)>0;                    %if there is a slash in the figure number (before the ':')  
                    last_slash=last_slash(end);             %get the position of the last slash (in case there is more than one, e.g. 1/5/12)
                    old_num_last=str2double( old_num(last_slash+1:end) ); %find the number after the last slash/
                else
                    old_num_last=str2double( old_num);      %there is no slash, take the figure number
                end;
            if isnumeric(old_num_last)                      %double-check to see if the number before the ":" was a number
                old_num_test=old_num_last;                  %valid number before the ":"
            else 
                old_num_test=0;                             %not a valid number, flag to fail the old_num_test
            end;
                
            if old_num_test==old_fig; % this indicates that the old figure has the form "x: figure name"
                new_fig_name=[old_num '/' num2str(new_fig) old_name];
            else
                new_fig_name=[num2str(old_fig) '/' num2str(new_fig) ': ' old_fig_name];
            end;
        end;
        set(new_fig,'Name',new_fig_name);       %set the figure name
		set(new_fig,'NumberTitle','off');       %turn off the default figure title, i.e. don't show "Figure No. "
        
        %Generate the subplots and copy the cropped data
        subplot_i=0;                            %zero the subplot index
        subplot_n=length(h_axes);               %number of subplots in the figure
        %Consruct the subplots
        for hai = fliplr(h_axes);               %the transpose is added to make it a one row and hence go through the indices of h_axes, flip left-2-righ to start with the upper axes first
            hli=get(hai,'Children');            %get the handle of line in the current axis
            nl=length(hli);                     %nl is the number of lines in the current axis
            subplot_i=subplot_i+1;  
            figure(new_fig);                    %focus on the new figure
    		ha_sub=subplot(subplot_n,1,subplot_i);  %focus on the subplot and get its handle
            if nl==1;
                hl_sub=plot([0 0]);                     %plot a line at the orgin, to initialize the plot
            else    %if there are multiple lines in the axis
                for k=1:nl
                    hl_sub(k)=plot([0 0]);                     %plot a line at the orgin, to initialize the plot
                    hold on
                end
                 hl_sub=fliplr(hl_sub);  %to maintain the order of the lines (to have the same color effect)
                hold off;
            end
                   
                    
%             
%             		for hai = h_axes;
%             xlim(hai,xx);                       %Update the x-axis scale
% 			hli=get(hai,'Children');            %get the handle of line in the current axis
%             nl=length(hli);
%             for i=1:nl;                         %loop through the lines, in case there are more than one in the same axis
%                 ydata=get(hli(i),'YData');
%                 set(hli(i),'XData',xdata(x1_index:x2_index),'YData',ydata(x1_index:x2_index));
%             end;
% 		end
%             
           
            for i=1:nl;                         %loop through the lines, in case there are more than one in the same axis
    		    ydata=get(hli(i),'YData');
                set(hl_sub(i),'XData',xdata(x1_index:x2_index),'YData',ydata(x1_index:x2_index),...
                    'Color',get(hli(i),'Color'),    'LineStyle',get(hli(i),'LineStyle'),    'LineWidth',get(hli(i),'LineWidth'),...
                    'Marker',get(hli(i),'Marker'),  'MarkerEdgeColor',get(hli(i),'MarkerEdgeColor'),    'MarkerSize',get(hli(i),'MarkerSize') );
            end;
            y_label=get(hai,'YLabel'); h_y_label=get(hai,'YLabel');y_label=get(h_y_label,'String'); ylabel(y_label); 
            xlim(ha_sub,xx);                    %change the limits
            grid on;
		end
        h_x_label=get(h_axes(1),'XLabel');x_label=get(h_x_label,'String'); xlabel(x_label);     %label the x-axis with the xlabel of the bottom axes
        h_axes_new=findobj(gcf,'Type','axes')';          %find the handles for the axes objects. The transpose is added to make it a one row and hence go through the indices of h_axes
        %  Change letter to copy all the proprties of the old axes, but for now use the default and show only the time label at the bottom
        set(h_axes_new(2:end),'XTicklabel',[])
        %        set(h_axes_new(2:end),'XTicklabel',get(h_axes(2:end),'XTic %     
        tzoom gui;
%--------------------------------------------------------------------------    
    case 'marker',
        for hai = h_axes;
            hli=get(hai,'Children'); %get the handle of line in the current axis
            m_old=get(hli,'Marker');
            %walk around for multiple lines in the same axis, should be
            %vectorized later
            n=size(m_old,1);
            
            for i=1:n;
                if ~iscell(m_old); m_old={m_old};end;   %conver to cell, if m_old is not a cell (i.e. when only a single line)
                switch m_old{i,:}
                    case 'none',
                        set(hli(i),'Marker','o')
                    case 'o',
                        set(hli(i),'Marker','none')
                end;
            end;
        end
%--------------------------------------------------------------------------
    case 'pointer',
        pointer = get(hf,'pointer');
        switch pointer
            case 'arrow',
                   set(hf,'pointer','fullcrosshair');
            case 'fullcrosshair',
                   set(hf,'pointer','arrow');
        end

%--------------------------------------------------------------------------                
    case 'gui'
		% Construct GUI
		%position format is [buttonx, buttony,buttonwidth,buttonheight]
	    hb = uicontrol(hf   ,...                 % Time Zoom Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , '(Z)oom Time',...
             'Position'       , [.607, 0.05+.9 ,.09,.05],...
             'Callback'       ,'tzoom zoom');
         
		hb = uicontrol(hf   ,...                 % Time Un-Zoom Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , '(U)nZoom-Time',...
             'Position'       , [.517, 0.05+.9,.09,.05],...
             'Callback'       ,'tzoom unzoom');

		hb = uicontrol(hf   ,...                 % Full Time Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , '(F)ull Time',...
             'Position'       , [.909, 0.05+.9,.09,.05],...
             'Callback'       ,'tzoom full');         

        hb = uicontrol(hf   ,...                 % Set time-limits Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , 'Set Time (L)imits',...
             'Position'       , [.714, 0.05+.9,.09,.05],...
             'Callback'       ,'tzoom limits');
		         
		hb = uicontrol(hf   ,...                 % crop Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , '(C)rop Time Scale',...
             'Position'       , [.309, 0.05+.9,.09,.05],...
             'Callback'       ,'tzoom crop');
		
        hb = uicontrol(hf   ,...                 % crop_newfig Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , 'Crop to (N)ewFig',...
             'Position'       , [.399, 0.05+.9,.09,.05],...
             'Callback'       ,'tzoom cropnew');
         
		hb = uicontrol(hf   ,...                 % Toggle Marker Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , 'Toggle (M)arker',...
             'Position'       , [.194, 0.05+.9,.09,.05],...
             'Callback'       ,'tzoom marker');
         
		hb = uicontrol(hf   ,...                 % Toggle Pointer Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , 'Toggle Pointe(R)',...
             'Position'       , [.104, 0.05+.9,.09,.05],...
             'Callback'       ,'tzoom pointer');
         
        hb = uicontrol(hf   ,...                 % remove GUI Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , 'Remove Buttons',...
             'Position'       , [0, 0.05+.9,.09,.05],...
             'Callback'       ,'tzoom remove');
         
        hb = uicontrol(hf   ,...                 % full y-axis Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , 'Full (Y)-Axis',...
             'Position'       , [.909, -.02+.9,.09,.05],...
             'Callback'       ,'tzoom yfull');
         
        hb = uicontrol(hf   ,...                 % measure point
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , 'Measure poin(T)',...
             'Position'       , [.909, -.12+.9,.09,.05],...
             'Callback'       ,'tzoom measure');

         hb = uicontrol(hf   ,...                 % measure time difference
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , 'Measure (D)ifference',...
             'Position'       , [.909, -.17+.9,.09,.05],...
             'Callback'       ,'tzoom measurediff');         

         hb = uicontrol(hf   ,...                 % extract data
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , '(E)xtract Data',...
             'Position'       , [.909, -.22+.9,.09,.05],...
             'TooltipString'  , 'To access the data, issue the following command in your workspace window: global time_value y_value index_value',...
             'Callback'       ,'tzoom extract');      
         
        hb = uicontrol(hf   ,...                 % y-limit
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , 'Set Y-axis Limit(S)',...
             'Position'       , [.909, -.07+.9,.09,.05],...
             'Callback'       ,'tzoom ylimits');

        hb = uicontrol(hf   ,...                 % pan x-axis Button
             'Style'          , 'pushbutton',...
             'Units'          , 'normalized',...
             'String'         , '([P])an Time',...
             'Position'       , [.804, .05+.9,.09,.05],...
             'TooltipString'  , '(P) input and pan, Use the [ and ] keys to pan to the left and right using the last entered pan value',...
             'Callback'       ,'tzoom pan');        
         set(hb,'Tag','0');        % reset the current pan amount (in the tag property of the button)

         set(hf,'KeyPressFcn','tzoom hotkey');       %enable hotkeys for the tzoom buttons
         warning off MATLAB:deblank:NonStringInput  % temp until I fix it
         warning off MATLAB:nonIntegerTruncatedInConversionToChar
%--------------------------------------------------------------------------                
    case 'remove'
        h_uic=findobj(hf,'Type','uicontrol')';
        delete(h_uic);
%--------------------------------------------------------------------------                
    case 'hotkey'
        hkey=get(gcf,'CurrentCharacter');
        switch hkey     %you can modify the hotkeys from the case statements below
            case {'z','Z'}
                tzoom zoom
            case {'u','U'}
                tzoom unzoom
            case {'f','F'}
                tzoom full
            case {'l','L'}
                tzoom limits
            case {'c','C'}
                tzoom crop
            case {'n','N'}
                tzoom cropnew
           case {'m','M'}
                tzoom marker
           case {'e','E'}
                tzoom extract
                
           case {'t','T'}
                tzoom measure
           case {'d','D'}
                tzoom measurediff                
            case {'r','R'}
                tzoom pointer
            case {'y','Y'}
                tzoom yfull
            case {'s','S'}
                tzoom ylimits
            case {'p','P'}
                tzoom pan
            case {'[',']'}  %panning to the left and to the right
                hb_pan=findobj(hf,'Callback','tzoom pan')';          %find the handles to the Pan button   
                if isempty(hb_pan);return;end;  %do nothing if you can't find the pan button tag
                current_pan=str2double(get(hb_pan,'Tag'));      % get the current pan amount (from the tag property of the button)
                if current_pan==0|isnan(current_pan);
                    tzoom('pan');
                    return; % if the is the first time Pan hotkey is pressed, go to the pan routine (ie ask for the value)
                end;
                
                if hkey==']'    %pan to the right
                    Pan_value=abs(current_pan); % the absolute value is to make sure that the direction is not dependant on the pan value stored in the button
                elseif hkey=='[' %pan to the left
                    Pan_value=-abs(current_pan); 
                end
                tzoom('pan',Pan_value);
        end
%--------------------------------------------------------------------------   
    case 'yfull'
        y_ratio=.05;  %percentage by which the y-axis get scaled above and below the y-value if the data was constant (i.e. not changing in the visible data range). Default is 10%
        [x,y,button]=ginput(1); if button~=1;return;end    %get the two time points from the figure using the mouse
        ha=gca;
    	hl=get(ha,'Children');         %get the handle of line in the last axis
        nl=length(hl);
        h_y_label=get(ha,'YLabel');y_label=get(h_y_label,'String'); 
        
             %error handling for when the label is a Cell and not just one string 
             if iscell(y_label); %ischar
                y_label=y_label{1};
            end;
        %y_label=y_label{1};
		for i=1:nl;     %loop through the lines, in case there are more than one in the same axis
                xdata=get(hl(1),'XData');   %get the time data points
                xx=xlim(ha);          %get the x-axis limits, in order to zoom the y-axis using just the displayed data    
                x1_index=find( min( abs( xdata-xx(1) ) ) == ( abs( xdata-xx(1) ) ) ); % get the index of the nearset point to the starting of the desired limit     
		    	x2_index=find( min( abs( xdata-xx(2) ) ) == ( abs( xdata-xx(2) ) ) ); % get the index of the nearset point to the end of the desired limit     
        		if(x1_index==x2_index); return;end;
            ydata=get(hl(i),'YData'); 
            ydata=ydata(x1_index:x2_index);       %get the y-axis data points and limit to the displayed points


			yy(i,[1 2])=[min(ydata) max(ydata)];
	    end;
        y1=min(yy(:)) ;y2=max(yy(:));
        
        yy=[y1-(y2-y1)*y_ratio y2+(y2-y1)*y_ratio];
        if yy(1)==yy(2);
            if yy(1)==0; return;end;    %if the y-data is constant and equal zero-->do nothing
            yy(1)=yy(1)-y_ratio*abs(yy(1));yy(2)=yy(2)+y_ratio*abs(yy(2));  %scale the y-axis to to 
        end;
%             msgbox({['Figure ',fig_name];'';'Max-Min';num2str(abs(yy(2)-yy(1)),10);'';'(Max+Min)/2'; num2str((yy(2)+yy(1))/2,10);'';['Trace:' y_label]},'Full Y measurment')
            msgbox({['Figure ',fig_name];'';'Max-Min';num2str(y2-y1,10);'';'(Max+Min)/2'; num2str((y2+y1)/2,10);'';['Trace:' y_label]},'Full Y measurment')
                set(ha,'YLim',yy);                  %Update the y-axis scale
       
%          ydata=get(hl,'YData');                  %get the time data points
% 			yy=[min(ydata) max(ydata)];
% 			    if yy(1)==yy(2);
%                     if yy(1)==0; return;end;    %if the y-data is constant and equal zero-->do nothing
%                     yy(1)=yy(1)-abs(yy(1));yy(2)=yy(2)+abs(yy(2));  %to 
%                 end;
%                     
%                 set(ha,'YLim',yy);                  %Update the y-axis scale

%--------------------------------------------------------------------------   
    case 'pan'
        current_limits=xlim(h_axes(end));   %get current time limits
        if isempty(Command_input) %ask for the pan value, only if there was none invoked    
            hb_pan=findobj(hf,'Callback','tzoom pan')';          %find the handles to the Pan button       
            if isempty(hb_pan)   %if you can't find the pan button tag, assume current_pan=0
                current_pan='0';
            else
                current_pan=get(hb_pan,'Tag');      % get the current pan amount (from the tag property of the button)
            end; 

            
            prompt = {'Enter the panning amount (i.e. change in the center of the time scale)'};
            answer  = inputdlg(prompt,'Set Pan value',1,{current_pan});
            if isempty(answer)|strcmp(answer{1},'');return;end;      %do nothing in the case of a canceled input
            Pan_value=str2double(answer(1));
            set(hb_pan,'Tag',answer{1});        % set the current pan amount (in the tag property of the button)
            if isempty(answer);return;end      %do nothing in the case of a canceled input
        else
            Pan_value=Command_input(1);
        end
        
        xx=[current_limits(1)+Pan_value current_limits(2)+Pan_value];
        if xx(1)==xx(2); return;end;        %do nothing if the two points are equal
        set(h_axes,'XLim',xx);              %Update the x-axis scale
        
%--------------------------------------------------------------------------
    case 'measure'
        global time_value y_value index_value
        [x,y,button]=ginput(1); if button~=1;return;end    %get the two time points from the figure using the mouse
        ha=gca;
        h_y_label=get(ha,'YLabel');y_label=get(h_y_label,'String');
        if ~isempty(y_label);
             %error handling for when the label is a Cell and not just one string 
             if iscell(y_label); %ischar
                y_label=y_label{1};
            end;
        end;
        hl=get(ha,'Children');         %get the handle of line in the last axis
        fig_name=get(hf,'Name');    %get the figure name
        nl=length(hl);  %nl=number lines
        y_value=zeros(nl,1);
        xdata=get(hl(1),'XData');               %get the time data points
		ind=find( min( abs( xdata-x ) ) == ( abs( xdata-x ) ) ); % get the index of the nearset point to the starting of the desired limit 
        x_index=ind(1);  % this step is used to walk around the error on there are more than one point at the same x-coorindate

        x_value=xdata(x_index);
            for i=1:nl;                         %loop through the lines, in case there are more than one in the same axis
                ydata=get(hl(i),'YData');
                y_value(i)=ydata(x_index);
            end;
            y_value= flipud(y_value);
            ys_value=flipud(sort(y_value));  %sort the array ina desceding order
            msgbox({['Figure ',fig_name];'';'Index-1';num2str(x_index-1);'';'Time='; num2str(x_value,10);'';['Y-Value(s):' y_label];num2str(ys_value,10)},'Nearest Point Coordinates')
            
            time_value=x_value; y_value=y_value; index_value=x_index;

%--------------------------------------------------------------------------
    case 'measurediff'
        global time_value y_value index_value
        [x,y,button]=ginput(2); if button~=1;return;end    %get the two time points from the figure using the mouse
        ha=gca;
        h_y_label=get(ha,'YLabel');
        y_label=get(h_y_label,'String');
        if ~isempty(y_label);
             %error handling for when the label is a Cell and not just one string 
             if iscell(y_label); %ischar
                y_label=y_label{1};
            end;
        end;
    	hl=get(ha,'Children');         %get the handle of line in the last axis
        fig_name=get(hf,'Name');    %get the figure name
        nl=length(hl);  %nl=number lines
        y_value=zeros(nl,1);
        xdata=get(hl(1),'XData');               %get the time data points
        ind=find( min( abs( xdata-x(2) ) ) == ( abs( xdata-x(2) ) ) ); % get the index of the nearset point to the starting of the desired limit 
        x_index(2)=ind(1);  % this step is used to walk around the error on there are more than one point at the same x-coorindate
        x_value(2)=xdata(x_index(2));
		ind=find( min( abs( xdata-x(1) ) ) == ( abs( xdata-x(1) ) ) ); % get the index of the nearset point to the starting of the desired limit 
        x_index(1)=ind(1);  % this step is used to walk around the error on there are more than one point at the same x-coorindate
        x_value(1)=xdata(x_index(1));
ys_value=0;
%             for i=1:nl;                         %loop through the lines, in case there are more than one in the same axis
                ydata=get(hl(1),'YData');
                y_value(1)=ydata(x_index(1));
                y_value(2)=ydata(x_index(2));
                ys_value=abs(y_value(2)-y_value(1));
                slope=(y_value(2)-y_value(1))/(x_value(2)-x_value(1));
%             end;
%             y_value= flipud(y_value);
%             ys_value=flipud(sort(y_value));  %sort the array ina desceding order
            msgbox({['Figure ',fig_name];'';'\Delta Index';num2str(abs(x_index(2)-x_index(1)),20);'';'\Delta Time='; num2str(abs(x_value(2)-x_value(1)),10);'';['\Delta Y-Value:' y_label];num2str(ys_value,10) ;'';['\Delta Slope'];num2str(slope,10) },'2-point Coordinates Difference')
            
            time_value=x_value; y_value=y_value; index_value=x_index;
%--------------------------------------------------------------------------
    case 'extract' 
        global x_data y_data
        [x,y,button]=ginput(1); if button~=1;return;end    %get the two time points from the figure using the mouse
        ha=gca;
    	hl=get(ha,'Children');         %get the handle of line in the last axis
        nl=length(hl);  %nl=number lines
        x_data=get(hl(1),'XData');               %get the time data points
        nt=length(x_data);  %nt=number of points in the line  
        y_data=zeros(nl,nt); %for now assume that there is only one line
%             for i=1:nl;                         %loop through the lines, in case there are more than one in the same axis
                y_data(1,:)=get(hl(1),'YData');
           
%--------------------------------------------------------------------------            
    case 'ylimits',
        [x,y,button]=ginput(1); if button~=1;return;end    %get the two time points from the figure using the mouse
        ha=gca;
        current_limits=ylim(ha);   %get current y-axis limits
        num_digits=10;                      %number of digits in the time limits, change if needed
        def = {num2str(current_limits(1),num_digits),num2str(current_limits(2),num_digits)};
        prompt = {'Enter the Lower y-limit:','Enter the Upper y-limit:'};
        answer  = inputdlg(prompt,'Set Y-scale Scale Limits',1,def);
        if isempty(answer);return;end;      %do nothing in the case of a canceled input
        yy=[str2double(answer(1)) str2double(answer(2))];
        if yy(1)==yy(2); return;end;        %do nothing if the two points are equal
        set(ha,'YLim',yy);              %Update the x-axis scale
		
%--------------------------------------------------------------------------



otherwise  %if the input to the function is unknown then just break 
        return;
    
end     %end of switch statment
%--------------------------------------------------------------------------

function two_points=ginput2(com_inp)
        if isempty(com_inp) %if no arguments are used, then get the two points by mouse
            [x,y,button]=ginput(2);                     %get the two time points from the figure using the mouse
            if sum(button==1)~=2;x=[0 0];end;           %if the buttons pressed are not both the left buttons, flag to do nothing
        else
            x=com_inp;
        end
two_points=[min(x) max(x)];                 %order the two points

