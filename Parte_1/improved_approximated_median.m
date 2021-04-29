function imagen_limpia = improved_approximated_median(img_str)
  I = imread(img_str);
  [m n] = size(I);
  imagen_limpia = uint8(zeros(m,n));
  for i=2:m-1
    A = mid_value_decision_median([I(i-1,1) I(i,1) I(i+1,1)]);
    B = mid_value_decision_median([I(i-1,2) I(i,2) I(i+1,2)]);
    for j=3:n-1
      C = mid_value_decision_median([I(i-1,j) I(i,j) I(i+1,j)]);
      imagen_limpia(i,j) = mid_value_decision_median([A B C]);
      A = B;
      B = C;
    endfor
  endfor
endfunction
