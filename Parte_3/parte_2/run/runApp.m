function ret = runApp()
  [dir, name, ext] = fileparts( mfilename('fullpathext') );
  global _parte_2BasePath = dir;
  global _parte_2ImgPath = [dir filesep() 'img'];
  addpath([dir filesep() "libs" ]);
  addpath([dir filesep() "fcn" ]);
  addpath([dir filesep() "wnd" ]);
  waitfor(main().figure);
end
