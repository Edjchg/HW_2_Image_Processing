%-*- texinfo -*-
%@deftypefn {Function File} {@var{Y} =}  inpaint(img,mask,kernel,tol=0.1)
%Function inpaint()
%@end deftypefn

function Y=inpaint(img,mask,tol=0.1)
  a=0.073235; 
  b=0.176765; 
  c=0.125;
  %a=c;b=c;
  kernel=[a b a;b 0 b;a b a];

  A=im2double(img);
  mask=binaria(im2double(mask));
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
