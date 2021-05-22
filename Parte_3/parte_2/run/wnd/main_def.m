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

## @deftypefn  {} {} btn_help_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of btn_help control.
##
## @end deftypefn
function btn_help_doIt(src, data, main)

% This code will be executed when user click the button control.
% As default, all events are deactivated, to activate must set the
% propertie 'generateCallback' from the properties editor

waitfor(help_dialog().figure)
end

## @deftypefn  {} {} btn_load_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of btn_load control.
##
## @end deftypefn
function btn_load_doIt(src, data, main)

% This code will be executed when user click the button control.
% As default, all events are deactivated, to activate must set the
% propertie 'generateCallback' from the properties editor

[file,path]=uigetfile(); %Ventana de dialogo para seleccionar la imagen

%Variable global para la imagen de entrada
global A;
global B;
B=0;

%Comprueba que el ui consiguio un archivo
if size(file,2)>1 && size(path,2)>1
  text=fullfile(path, file); %Direccion donde se encuentra la imagen
%Lectura y mostrado de la imagen de entrada
  A=imread(text);
  axes(main.img_input)
  imshow(A)
%Reseteo de mensajes
  set(main.btn_process,'foregroundcolor',[0.0 0.0 0.0]);
  set(main.btn_process,'string','Restaurar');
  set(main.btn_save,'foregroundcolor',[0.0 0.0 0.0]);
  set(main.btn_save,'string','Guardar Imagen');
endif
end

## @deftypefn  {} {} btn_mask_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of btn_mask control.
##
## @end deftypefn
function btn_mask_doIt(src, data, main)

% This code will be executed when user click the button control.
% As default, all events are deactivated, to activate must set the
% propertie 'generateCallback' from the properties editor

[file,path]=uigetfile(); %Ventana de dialogo para seleccionar la imagen

%Variable global para la imagen de entrada
global M;
global B;
B=0;

%Comprueba que el ui consiguio un archivo
if size(file,2)>1 && size(path,2)>1
  text=fullfile(path, file); %Direccion donde se encuentra la imagen
%Lectura y mostrado de la imagen de entrada
  M=imread(text);
  axes(main.img_mask)
  imshow(M)
%Reseteo de mensajes
  set(main.btn_process,'foregroundcolor',[0.0 0.0 0.0]);
  set(main.btn_process,'string','Restaurar');
  set(main.btn_save,'foregroundcolor',[0.0 0.0 0.0]);
  set(main.btn_save,'string','Guardar Imagen');
endif
end

## @deftypefn  {} {} btn_process_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of btn_process control.
##
## @end deftypefn
function btn_process_doIt(src, data, main)

% This code will be executed when user click the button control.
% As default, all events are deactivated, to activate must set the
% propertie 'generateCallback' from the properties editor

%Variable global para la imagen de entrada
global A;
global M;
global B;
B=0;

%Comprobacion que existe una imagen
if sum(size(A))==0 && sum(size(M))==0
%Mensaje indicando que no existe la imagen
  set(main.btn_process,'foregroundcolor',[1.0 0.0 0.0]);
  set(main.btn_process,'string','¡Cargue Imagen o Máscara!');
else
%Mensaje que indica el inicio del procesamiento
  set(main.btn_process,'foregroundcolor',[0.0 0.0 1.0]);
  set(main.btn_process,'string','Procesando...');
%Desabilitacion de botones para evitar problemas
  set(main.btn_process,'enable','off');
  set(main.btn_load,'enable','off');
  set(main.btn_mask,'enable','off');
  set(main.btn_save,'enable','off');
  set(main.input,'enable','off');
%Se consigue la tolerancia de entrada
  tol=str2num(get(main.input,'string'));
%Se consigue el kernel de entrada
  kernel=get(main.op_kernel,'value');
%Se realiza el algoritmo
  M(M<50)=0;M(M>=50)=255; %Convertir imagen a Binaria
  I3=A+M;
  B=zeros(size(I3));
  B(:,:,1)=inpaint(I3(:,:,1),M,tol,kernel);
  B(:,:,2)=inpaint(I3(:,:,2),M,tol,kernel);
  B(:,:,3)=inpaint(I3(:,:,3),M,tol,kernel);
  B=im2uint8(B);
%Se muestra la imagen en su respectivo campo
  axes(main.img_output)
  imshow(B)
%Mensaje que indica el fin del procesamiento
  set(main.btn_process,'foregroundcolor',[0.0 0.0 0.0]);
  set(main.btn_process,'string','Restaurar');
  set(main.btn_save,'foregroundcolor',[0.0 0.0 0.0]);
  set(main.btn_save,'string','Guardar Imagen');
%Se habilidan los botones
  set(main.btn_process,'enable','on');
  set(main.btn_load,'enable','on');
  set(main.btn_mask,'enable','on');
  set(main.btn_save,'enable','on');
  set(main.input,'enable','on');
endif
end

## @deftypefn  {} {} btn_save_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of btn_save control.
##
## @end deftypefn
function btn_save_doIt(src, data, main)

% This code will be executed when user click the button control.
% As default, all events are deactivated, to activate must set the
% propertie 'generateCallback' from the properties editor

%Variable global de imagen de salida
global B;

if sum(size(B))>0
%Consigue el archivo de salida
  [file,path]=uiputfile({"*.gif;*.png;*.jpg", "Supported Picture Formats"});

%Comprueba que se selecciono un archivo
  if size(file,2)>1 && size(path,2)>1
    text=fullfile(path,file); %Direccion donde se encuentra la imagen
%Escribe la imagen de salida
    imwrite(B,text);
  endif
else
  set(main.btn_save,'foregroundcolor',[1.0 0.0 0.0]);
  set(main.btn_save,'string','Requiere Imagen');
endif
end

 
## @deftypefn  {} {@var{ret} = } show_main()
##
## Create windows controls over a figure, link controls with callbacks and return 
## a window struct representation.
##
## @end deftypefn
function ret = show_main()
  _scrSize = get(0, "screensize");
  _xPos = (_scrSize(3) - 695)/2;
  _yPos = (_scrSize(4) - 661)/2;
   main = figure ( ... 
	'Color', [0.941 0.941 0.941], ...
	'Position', [_xPos _yPos 695 661], ...
	'resize', 'off', ...
	'windowstyle', 'normal', ...
	'MenuBar', 'none');
	 set(main, 'visible', 'off');
  btn_help = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Comic Sans MS', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [600 18 80 28], ... 
	'String', 'Ayuda', ... 
	'TooltipString', '');
  img_input = axes( ...
	'Units', 'pixels', ... 
	'parent',main, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [15 337 309 284]);
  img_output = axes( ...
	'Units', 'pixels', ... 
	'parent',main, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [355 332 309 284]);
  img_mask = axes( ...
	'Units', 'pixels', ... 
	'parent',main, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [15 17 309 284]);
  Label_4 = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Comic Sans MS', ... 
	'FontSize', 14, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [82 631 132 24], ... 
	'String', 'Imagen a Restaurar', ... 
	'TooltipString', '');
  Label_5 = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Comic Sans MS', ... 
	'FontSize', 14, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [410 629 131 24], ... 
	'String', 'Imagen Restaurada', ... 
	'TooltipString', '');
  Label_6 = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Comic Sans MS', ... 
	'FontSize', 14, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [126 307 58 24], ... 
	'String', 'Máscara', ... 
	'TooltipString', '');
  btn_load = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Comic Sans MS', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [425 268 168 33], ... 
	'String', 'Cargar Imagen', ... 
	'TooltipString', '');
  btn_mask = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Comic Sans MS', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [425 213 168 33], ... 
	'String', 'Cargar Máscara', ... 
	'TooltipString', '');
  btn_process = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Comic Sans MS', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [403 103 222 33], ... 
	'String', 'Restaurar', ... 
	'TooltipString', '');
  Label_7 = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'italic', ... 
	'FontName', 'Comic Sans MS', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [406 174 85 17], ... 
	'String', 'Tolerancia (tol>0):', ... 
	'TooltipString', '');
  btn_save = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Comic Sans MS', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [425 48 168 33], ... 
	'String', 'Guardar Imagen', ... 
	'TooltipString', '');
  input = uicontrol( ...
	'parent',main, ... 
	'Style','edit', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [1.000 1.000 1.000], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'left', ... 
	'Position', [413 144 63 22], ... 
	'String', '0.1', ... 
	'TooltipString', '');
  op_kernel = uicontrol( ...
	'parent',main, ... 
	'Style','popupmenu', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Yrsa', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [560 144 64 22], ... 
	'String', 'a=b|a=/b', ... 
	'TooltipString', '');
  Kernel = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'italic', ... 
	'FontName', 'Z003 [UKWN]', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'left', ... 
	'Position', [575 175 35 16], ... 
	'String', 'Kernel', ... 
	'TooltipString', '');

  main = struct( ...
      'figure', main, ...
      'btn_help', btn_help, ...
      'img_input', img_input, ...
      'img_output', img_output, ...
      'img_mask', img_mask, ...
      'Label_4', Label_4, ...
      'Label_5', Label_5, ...
      'Label_6', Label_6, ...
      'btn_load', btn_load, ...
      'btn_mask', btn_mask, ...
      'btn_process', btn_process, ...
      'Label_7', Label_7, ...
      'btn_save', btn_save, ...
      'input', input, ...
      'op_kernel', op_kernel, ...
      'Kernel', Kernel);


  set (btn_help, 'callback', {@btn_help_doIt, main});
  set (btn_load, 'callback', {@btn_load_doIt, main});
  set (btn_mask, 'callback', {@btn_mask_doIt, main});
  set (btn_process, 'callback', {@btn_process_doIt, main});
  set (btn_save, 'callback', {@btn_save_doIt, main});
  dlg = struct(main);

  set(main.figure, 'visible', 'on');

%
% The source code writed here will be executed when
% windows load. Work like 'onLoad' event of other languages.
%

pkg load image
  ret = main;
end

