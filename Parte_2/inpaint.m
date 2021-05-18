
function Y=inpaint(img, mask, kernel, itermax=10)
  A=im2double(img);
  mask=im2double(mask);
  mask=binaria(mask);
  for i=1:itermax
    T=conv2(A, kernel, 'same');
    T(mask==0)=0;
    A(mask==1)=0;
    A=A+T;
  endfor
  Y=A;
endfunction

