clc;clear;close all;

pkg load image
pkg load video

video_original="VIDEO_pequeno.mp4";

video_ruido="video_con_ruido.mp4";

video_limpio_fmf="video_sin_ruido_alg1.mp4";

video_limpio_iam="video_sin_ruido_alg2.mp4";

factor_ruido=0.25;
%frames = 300;
frames=1;
"Generando ruido en el video..."
generar_ruido_video(video_original, video_ruido, factor_ruido, frames);
"Quitando el ruido antes generado con el metodo fmf e iam..."
quitar_ruido_video(video_ruido, video_limpio_fmf, video_limpio_iam, frames);
"Analizando la similitud de los videos video_sin_ruido_alg1.mp4 y video_sin_ruido_alg2.mp4 con su original."
x_vector=1:frames;
[fmf_vector, iam_vector]=resultado_ssim(video_original, video_limpio_fmf, video_limpio_iam)
plot(x_vector, fmf_vector,"-", x_vector, iam_vector, "-");
xlabel("Frames");
ylabel("SSIM");
legend("FMFA", "IAMFA-I");
title("Comparación entre algoritmos FMFA y IAMFA-I")