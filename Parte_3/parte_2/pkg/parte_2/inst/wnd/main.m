## -*- texinfo -*-
## @deftypefn  {} {@var{wnd} =} main ()
##
## Create and show the dialog, return a struct as representation of dialog.
##
## @end deftypefn
function wnd = main()
[_dir, _name, _ext] = fileparts( mfilename('fullpathext') );
global _parte_2BasePath = strtrunc(_dir, length(_dir) - 4);
global _parte_2ImgPath = [ strtrunc(_dir, length(_dir) - 4) filesep() 'img'];
  main_def;
  wnd = show_main();
end
