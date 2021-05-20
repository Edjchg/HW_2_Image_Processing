

% #{
% Funccion que implementa el metodo
% Fast Digital Image Inpaiting con una toleracia de error.
% Entradas:
%   img:Imagen a restaurar
%   mask:region de la imagen a restaurar del mismo tamaño que img
%   kernel:kernel con el que se aplicara la convolucion en el proceso de
%          restauracion
%   tol: toleracion de error aceptada en el resultado
% Salida:
%   Y:Imagen restaurada del mismo tamaño que img
% #}
function Y=inpaint_p3(img, mask, kernel, tol=0.1)
  A=im2double(img);
  mask=im2double(mask);
  mask=binaria(mask);
  do
    X_k=A;
    T=conv2(A, kernel, 'same');
    T(mask==0)=0;
    A(mask==1)=0;
    X_k1=A+T;
    err=norm(X_k1-X_k,'fro')/norm(X_k1,'fro');
    A=X_k1;
  until(err<tol)
  Y=X_k1;
endfunction

