## -*- texinfo -*-
## @deftypefn  {} {@var{wnd} =} help_dialog ()
##
## Create and show the dialog, return a struct as representation of dialog.
##
## @end deftypefn
function wnd = help_dialog()
[_dir, _name, _ext] = fileparts( mfilename('fullpathext') );
global _parte_2BasePath = strtrunc(_dir, length(_dir) - 4);
global _parte_2ImgPath = [ strtrunc(_dir, length(_dir) - 4) filesep() 'img'];
  help_dialog_def;
  wnd = show_help_dialog();
end
