

clc; clear; close all;
pkg load image

A(:,:,1)= [5 10 15 20;
          4 8 12 16;
          3 6 9 12
          2 4 6 8];
        
A(:,:,2)=[1 2 3 4;
          1 3 5 7;
          2 4 6 8;
          1 4 7 10];
          
A(:,:,3)=[0 0 0 0;
          5 5 5 5;
          10 10 10 10;
          15 15 15 15];
        
%Se aplica se condiccion a cada capa de la 
% matriz A.
B1=(A(:,:,1)>5);
B2=(A(:,:,2)<5);
B3=(A(:,:,3)>=10);

%Se realiza una interseccion de los 
%resultados de cada dimencion de A.
B=B1&B2&B3

