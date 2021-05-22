pkg load image

%Imagen Original: I1
I1=imread('imagen_p2-4.jpg');
subplot(2,2,1)
imshow(I1)
title('Imagen Original')
%Texto: I2
I2=imread('mascara.jpg');
I2(I2<50)=0;I2(I2>=50)=255; %Convertir imagen a Binaria
subplot(2,2,2)
imshow(I2)
title('Region a restaruar ')
%Imagen a Restaurar: I3
I3=I1+I2;
subplot(2,2,3)
imshow(I3)
title('Region de la Imagen Original a restauar')

%Definicion de los valores para la 
% la construccion del kernel.
a=0.073235; b=0.176765; 
c=0.125;
%Creacion del kernel con todos los valores iguales.
a=c;b=c;
M=[a b a;b 0 b;a b a];
%Se aplica el algoritmo de restauracion a 
% a cada canal de la imagen a color.
A=zeros(size(I3));
A(:,:,1)=inpaint(I3(:,:,1),I2, M, 200);
A(:,:,2)=inpaint(I3(:,:,2),I2, M, 200);
A(:,:,3)=inpaint(I3(:,:,3),I2, M, 200);
%El resultado de algoritmo de convierte a uint8 para 
%visualizar la imagen.
A=im2uint8(A);
subplot(2,2,4)
imshow(A)
title('Imagen Restaurada')