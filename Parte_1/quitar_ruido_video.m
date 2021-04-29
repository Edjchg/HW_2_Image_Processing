function quitar_ruido_video(video_input, video_output_fmf, video_output_iam)
  % Esta funcion toma un video y le quita el ruido con dos variaciones del filtro de la mediana.
  % Entradas: - Ruta del video de entrada.
  %           - Nombre del video de salida con el algoritmo 1.
  %           - Nombre del video de salida con el algoritmo 2.
  % Salidas: - Un video escrito en disco procesado con el algoritmo de fmf.
  %          - Un video escrito en disco procesado con el algoritmo iam.
  V=VideoReader(video_input); % Leyendo el video desde la ruta indicada en el parametro.
  frames = V.NumberOfFrames; % Extrayendo la cantidad de frames del video.
  m=V.Height; % Extrayendo la cantidad de filas que posee el video.
  n=V.Width; % Extrayendo la cantidad de columnas que posee el video.
  video_result_fmf = VideoWriter(video_output_fmf); % Creando la instancia en RAM del video de salida con el algoritmo fmf.
  video_result_iam = VideoWriter(video_output_iam); % Creando la instancia en RAM del video de salida con el algoritmo iam.
  for k=1:5 % Recorriendo los frames del video.
    Frame_k = readFrame(V); % Leyendo el k-ésimo frame del video.
    writeVideo(video_result_fmf, filtros_mediana_modificada(Frame_k, 'f')); % Escribiendo en el video de salida el frame procesado con el algoritmo fmf.
    writeVideo(video_result_iam, filtros_mediana_modificada(Frame_k, 'i')); % Escribiendo en el video de salida el frame procesado con el algoritmo iam.
  endfor
  close(video_result_fmf); % Cerrando el video en RAM, para que toda la informacion sea escrita de forma segura en el disco.
  close(video_result_iam); % Cerrando el video en RAM, para que toda la informacion sea escrita de forma segura en el disco.
endfunction