clc; clear; close all;
pkg load image

imagen=uint8(imread('monalisa.png'));
%imagen=imnoise(imagen, "salt & pepper", 0.5);
tic
B = filtros_mediana_modificada(imagen, 'f');
t1=toc
tic
C = filtros_mediana_modificada(imagen, 'i');
t2=toc
subplot(1,3,1)
imshow(imagen)
title("Imagen original")


subplot(1,3,2)
imshow(B)
title("Imagen con FMFA")

subplot(1,3,3)
imshow(C)
title("Imagen con IAMFA-I")
