clc; clear; close all;
pkg load image


B = filtros_mediana_modificada('monalisa.png', 'i');

subplot(1,2,1)
imshow(imread('monalisa.png'))



subplot(1,2,2)
imshow(B)