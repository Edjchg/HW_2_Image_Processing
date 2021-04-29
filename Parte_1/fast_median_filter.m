function denoised_image = fast_median_filter(img_str)
  I = imread(img_str);
  [m n] = size(I);
  denoised_image = uint8(zeros(m,n));
  for i=2:m-1
    A = [I(i-1,1) I(i, 1) I(i+1, 1)];
    A = sort(A);
    B = [I(i-1, 2) I(i, 2) I(i+1, 2)];
    B = sort(B);
    for j=3:n-1
      pix_A = A(2);
      pix_B = B(2);
      C = [I(i-1,j) I(i,j) I(i+1, j)];
      C = sort(C);
      pix_C = C(2);
      median_vector = [pix_A pix_B pix_C];
      median_vector = sort(median_vector);
      median_pixel = median_vector(2);
      denoised_image(i,j) = median_pixel;
      A = B;
      B = C;
    endfor
  endfor
  
endfunction
