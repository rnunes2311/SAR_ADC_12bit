function figname(figure_name);
% FIGNAME      Replaces the window title of the figure with a custom name
%
%   FIGNAME(figure_name) replaces the name of the figure to the string
%       value 'x: figure_name', where x is the figure number (which can always be
%       retrieved using GCF)
%       This function is especially useful when there are many figure on
%       the screen which can be confusing. Changing the figure name, instead 
%       of just the figure title makes it easier to find the right figure.
%
%       For example: if the name of the current figure is 'Figure No. 3',
%       excuting the following commmand
%           figname('MDLL Timing Diagram, Ts=1e-12, k=1e-6')
%       will change the figure name to the following
%           3: MDLL Timing Diagram, Ts=1e-12, k=1e-6
%   
%   Written by Belal M Helal (bhelal@mit.edu) as part of the CppSim package. 6-16-2003
%   For more information: http://www-mtl.mit.edu/research/perrottgroup/tools.html

fig=get(0,'currentfigure');                  %get the handle for the current figure
    if isempty(fig)                          %if there is no current figure, do nothing
        return;
    end;
set(fig,'Name',[num2str(fig) ': ' figure_name]);    %set the figure name
set(fig,'NumberTitle','off');
