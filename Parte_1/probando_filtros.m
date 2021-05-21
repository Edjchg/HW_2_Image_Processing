clc; clear; close all;
pkg load image

imagen1=uint8(imread('cameraman.jpg'));
imagen=imnoise(imagen1, "salt & pepper", 0.30);

tic
B = filtros_mediana_modificada(imagen, 'f');
t1=toc
tic
C = filtros_mediana_modificada(imagen, 'i');
t2=toc
subplot(1,4,1)
imshow(imagen1)
title("Imagen original")

subplot(1,4,2)
imshow(imagen)
title("Imagen con ruido")


subplot(1,4,3)
imshow(B)
title("Imagen con FMFA")

subplot(1,4,4)
imshow(C)
title("Imagen con IAMFA-I")

resultado_fmf=ssim(imagen1(:,:,1), B(:,:,1))
resultado_iam=ssim(imagen1(:,:,1), C(:,:,1))