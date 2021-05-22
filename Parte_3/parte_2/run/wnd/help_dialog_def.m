## -*- texinfo -*-
## @deftypefn  {} {} dummy()
##
## This is a dummy function documentation. This file have a lot functions
## and each one have a little documentation. This text is to avoid a warning when
## install this file as part of package.
## @end deftypefn
##
## Set the graphics toolkit and force read this file as script file (not a function file).
##
graphics_toolkit qt;
##


##
##
## Begin callbacks definitions 
##

 
## @deftypefn  {} {@var{ret} = } show_help_dialog()
##
## Create windows controls over a figure, link controls with callbacks and return 
## a window struct representation.
##
## @end deftypefn
function ret = show_help_dialog()
  _scrSize = get(0, "screensize");
  _xPos = (_scrSize(3) - 1070)/2;
  _yPos = (_scrSize(4) - 586)/2;
   help_dialog = figure ( ... 
	'Color', [0.941 0.941 0.941], ...
	'Position', [_xPos _yPos 1070 586], ...
	'resize', 'off', ...
	'windowstyle', 'normal', ...
	'MenuBar', 'none');
	 set(help_dialog, 'visible', 'off');
  img_help = axes( ...
	'Units', 'pixels', ... 
	'parent',help_dialog, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [5 16 1052 565]);

  help_dialog = struct( ...
      'figure', help_dialog, ...
      'img_help', img_help);


  dlg = struct(help_dialog);

  set(help_dialog.figure, 'visible', 'on');

%
% The source code writed here will be executed when
% windows load. Work like 'onLoad' event of other languages.
%

global _parte_2ImgPath;

%Direccion donde se encuentra la imagen
text=fullfile(_parte_2ImgPath,'help_parte2.png');

help_img=imread(text);
axes(help_dialog.img_help)
imshow(help_img)

  ret = help_dialog;
end

