pkg load image

%Imagen Original: I1
I1=imread('paisaje.jpg');
subplot(2,2,1)
imshow(I1)
title('(a) paisaje.jpg','FontSize',16)
%Texto: I2
I2=imread('marca.jpg');
I2(I2<50)=0;I2(I2>=50)=255; %Convertir imagen a Binaria
subplot(2,2,2)
imshow(I2)
title('(b) marca.jpg','FontSize',16)
%Imagen a Restaurar: I3
I3=I1+I2;
subplot(2,2,3)
imshow(I3)
title('(c) Imagen a Restaurar','FontSize',16)

a=0.125; b=0.125; 
M=[a b a;b 0 b;a b a];

A=inpaint(I3,I2, M);

A=im2uint8(A);
subplot(2,2,4)
imshow(A)
title('(d) Imagen Restaurada','FontSize',16)