
function [resultado_fmf, resultado_iam] = resultado_ssim(video_original, video_procesado_fmf, video_procesado_iam)
  % Esta función toma la ruta del video original y los compara estructuralmente con las reconstrucciones hechas por las varaiciones del algoritmo de filtro de la mediana.
  % Entradas: - Ruta del video original
  %           - Ruta del video que fue procesado con el algoritmo fmf.
  %           - Ruta del video que fue procesado con el algoritmo iam.
  % Salida: - Resultado de similitud estructural entre el video original y el video procesado con fmf.
  %         - Resultado de similitud estructural entre el video original y el video procesado con iam.
  V_original=VideoReader(video_original); % Cargando en RAM el video original.
  V_fmf = VideoReader(video_procesado_fmf); % Cargando en RAM el video procesado con fmf.
  V_iam = VideoReader(video_procesado_iam); % Cargando en RAM el video procesado con iam.
  frames = V_fmf.NumberOfFrames; % Extrayendo la cantidad de frames que contiene el video.
  m_org=V_original.Height; % Extrayendo la cantidad de filas que contiene el video original.
  n_org=V_original.Width; % Extrayendo la cantidad de columnas que contiene el video original.
  m_fmf=V_fmf.Height;% Extrayendo la cantidad de filas que contiene el video procesado con fmf.
  n_fmf=V_fmf.Width;% Extrayendo la cantidad de columnas que contiene el video procesado con fmf.
  m_iam=V_iam.Height;% Extrayendo la cantidad de filas que contiene el video procesado con iam.
  n_iam=V_iam.Width;% Extrayendo la cantidad de columnas que contiene el video procesado con iam.
  if m_org == m_fmf && m_org == m_iam && n_org == n_fmf && n_org == n_iam % Verificando que los tamaños de los videos sean iguales para de esa forma determinar si se puede hacer un analisis de ssim.
    resultado_fmf = 0; % Estableciendo el valor inicial de la variable del resultado de la similitud estructural de fmf.
    resultado_iam = 0;  % Estableciendo el valor inicial de la variable del resultado de la similitud estructural de iam.
    for k=1:frames % Recorriendo los frames
      Frame_org_k = readFrame(V_original); % Leyendo los frames del video original.
      Frame_fmf_k = readFrame(V_fmf); % Leyendo los frames del video procesado con fmf.
      Frame_iam_k = readFrame(V_iam); % Leyendo los frames del video procesado con iam.
      resultado_fmf += ssim(Frame_org_k, Frame_fmf_k); % Sumando el resultado de cada frame del video procesado con fmf.
      resultado_iam += ssim(Frame_org_k, Frame_iam_k); % Sumando el resultado de cada frame del video procesado con iam.
    endfor
    resultado_fmf = resultado_fmf/frames; % Calculando el promedio los resultados de similitud estructural de cada frame.
    resultado_iam = resultado_iam/frames; % Calculando el promedio los resultados de similitud estructural de cada frame.
  else
    resultado_fmf = 0;
    resultado_iam = 0;
  endif 
>>>>>>> c0ec123b7659e2c3d1a71ee30f49b507b2e20770
endfunction