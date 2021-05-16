function imagen_limpia = improved_approximated_median_v2(I)
  [m n k] = size(I); % Obteniendo las dimensiones de la imagen I.
  imagen_limpia = uint8(zeros(m,n, k)); % Creando una imagen de salida del mismo tamaño que la imagen I.
  for z=1:k
    for i=1:m
      if 1<i && i<m
        A = mid_value_decision_median(sort(I(i-1:i+1,1,z)));% Tomando el nuevo pixel de la columna A.
        B = mid_value_decision_median(sort(I(i-1:i+1,2,z)));% Tomando el nuevo pixel de la columna B.
      endif
      for j=1:n
        if 3<i && i<m && 1<j && j<n
          C = mid_value_decision_median(sort(I(i-1:i+1,j,z))); %Tomando el nuevo píxel de la columna C.
          imagen_limpia(i,j-1,z) = mid_value_decision_median(sort([A B C])); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
          A = B; % Actualizando el valor de A hacia la columna adyacente que corresponde a B.
          B = C; % Actualizando el valor de B hacia la columna adyacente que corresponde a C.
        endif
      endfor
    endfor
  endfor
endfunction