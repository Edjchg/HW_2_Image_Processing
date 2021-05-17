

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
%Dar formato a la matriz C
C=zeros(size(A));         
%Asignacion de -30 a todas la entradas menores o iguales
% a 10.
C(A<=10)=-30;
%Asignacion de 30 a todas las entradas mayores a
% 10.
C(A>10)=30;

C