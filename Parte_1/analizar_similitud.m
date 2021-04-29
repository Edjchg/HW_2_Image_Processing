function [resultado_fmf, resultado_iam] = analizar_similitud(video_original, video_procesado_fmf, video_procesado_iam)
  V_original=VideoReader(video_original);
  V_fmf = VideoReader(video_procesado_fmf);
  V_iam = VideoReader(video_procesado_iam);
  frames = V_fmf.NumberOfFrames; % Extrayendo la cantidad de frames que contiene el video.
  m_org=V_original.Height; % Extrayendo la cantidad de filas que contiene el video.
  n_org=V_original.Width; % Extrayendo la cantidad de columnas que contiene el video.
  m_fmf=V_fmf.Height;
  n_fmf=V_fmf.Width;
  m_iam=V_iam.Height;
  n_iam=V_iam.Width;
  if m_org == m_fmf && m_org == m_iam && n_org == n_fmf && n_org == n_iam
    for k=1:frames
      Frame_org_k = readFream(V_original);
      Frame_fmf_k = readFream(V_fmf);
      Frame_iam_k = readFream(V_iam);
      resultado_fmf += ssim(Frame_org_k, Frame_fmf_k);
      resultado_iam += ssim(Frame_org_k, Frame_iam_k);
    endfor
    resultado_fmf = resultado_fmf/frames;
    resultado_iam = resultado_iam/frames;
  else
    resultado_fmf = 0;
    resultado_iam = 0;
  endif 
endfunction