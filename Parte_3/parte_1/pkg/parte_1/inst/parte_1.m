## -*- texinfo -*-
## @deftypefn  {} {@var{ret} =} parte_1 ()
##
## Create and show the main dialog, return a struct as representation of dialog.
##
## @end deftypefn
function ret = parte_1()
  [dir, name, ext] = fileparts( mfilename('fullpathext') );
  global _parte_1BasePath = dir;
  global _parte_1ImgPath = [dir filesep() 'img'];
  addpath( [dir filesep() "img" ]);
  addpath( [dir filesep() "fcn" ]);
  addpath( [dir filesep() "libs" ]);
  addpath( [dir filesep() "wnd" ]);
  main();
end
