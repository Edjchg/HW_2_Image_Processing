clc;clear;close all;

pkg load image
pkg load video

video_original="VIDEO.mp4";
video_ruido="video_con_ruido.mp4";
video_limpio_alg1="video_sin_ruido_alg1.mp4";
video_limpio_alg2="video_sin_ruido_alg2.mp4";
factor_ruido=0.5;
frames = 5;

"Generando ruido en el video..."
%generar_ruido_video(video_original, video_ruido, factor_ruido);
"Quitando el ruido antes generado con el metodo fmf e iam..."
%quitar_ruido_video(video_ruido, video_limpio_alg1, video_limpio_alg2);
"Analizando la similitud de los videos video_sin_ruido_alg1.mp4 y video_sin_ruido_alg2.mp4 con su original."
[resultado_fmf, resultado_iam] = resultado_ssim(video_original, video_limpio_alg1, video_limpio_alg2)
