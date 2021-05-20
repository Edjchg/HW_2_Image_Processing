pkg load image

%Imagen Original: I1
I1=imread('paisaje.jpg');
subplot(2,2,1)
imshow(I1)
title('Imagen Original (Paisaje)')
%Texto: I2
I2=imread('marca.jpg');
I2(I2<50)=0;I2(I2>=50)=255; %Convertir imagen a Binaria
subplot(2,2,2)
imshow(I2)
title('Region a restaruar (Marca)')
%Imagen a Restaurar: I3
I3=I1+I2;
subplot(2,2,3)
imshow(I3)
title('Region de la Imagen Original a restauar')


a=0.073235; b=0.176765; 
c=0.125;
%a=c;b=c;
M=[a b a;b 0 b;a b a];

A=inpaint(I3,I2, M, 50);

A=im2uint8(A);
subplot(2,2,4)
imshow(A)
title('Imagen Restaurada')