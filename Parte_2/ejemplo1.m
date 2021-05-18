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

iterMax=50;
I2=im2double(I2); I3=im2double(I3);

a=0.125; b=0.125; 
M=[a b a;b 0 b;a b a];
for i=1:iterMax
  C=conv2(I3,M,'same');
  C(I2==0)=0;
  I3(I2==1)=0;
  I3=I3+C;
end

F=im2uint8(I3);
subplot(2,2,4)
imshow(F)
title('(d) Imagen Restaurada','FontSize',16)