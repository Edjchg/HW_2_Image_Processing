function generar_ruido_video(video_input, video_output, factor)
  % Este metodo toma un video de entrada y le aplica ruido de sal y pimienta.
  % Entradas: - La ruta del video que se desea procesar.
  %           - El nombre del video de salida.
  %           - Porcentaje de cantidad de ruido deseado en la imagen.
  % Salidas: - El video escrito en disco duro con el ruido implementado.
  V=VideoReader(video_input); % Leyendo el video desde la ruta brindada. 
  frames = V.NumberOfFrames; % Extrayendo la cantidad de frames que contiene el video.
  m=V.Height; % Extrayendo la cantidad de filas que contiene el video.
  n=V.Width; % Extrayendo la cantidad de columnas que contiene el video.
  video_result = VideoWriter(video_output); % Creando una instancia en memoria RAM del video que se desea escribir en disco.
  for k=1:frames % Iterando sobre los frames que contiene el video.
    Frame_k = readFrame(V); % Leyendo el k-ésimo frame del video.
    writeVideo(video_result, imnoise(Frame_k, "salt & pepper", factor)); %Escribiendo el k-ésimo frame ya sucio en el video de salida.
  endfor
  close(video_result); % Cerrando el archivo que se creó para que toda la información se escriba en el disco de forma segura.
endfunction