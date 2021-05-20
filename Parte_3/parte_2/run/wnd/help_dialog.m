## -*- texinfo -*-
## @deftypefn  {} {@var{wnd} =} help_dialog ()
##
## Create and show the dialog, return a struct as representation of dialog.
##
## @end deftypefn
function wnd = help_dialog()
  help_dialog_def;
  wnd = show_help_dialog();
end
