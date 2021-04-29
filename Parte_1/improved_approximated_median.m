function imagen_limpia = improved_approximated_median(I)
  % Esta funcion toma una imagen con ruido de 'sal y pimienta' y lo reduce aprovechando el calculo de pixeles anteriores.
  % Entradas: Una imagen sucia en formato de 8 bits.
  % Salidas: Una imagen limpia en formato de 8 bits.
  [m n k] = size(I); % Obteniendo las dimensiones de la imagen I.
  imagen_limpia = uint8(zeros(m,n, k)); % Creando una imagen de salida del mismo tamaño que la imagen I.
  for z=1:k % Recorriendo los canales de la imagen.
    for i=2:m-1 % Recorriendo filas de la imagen.
      A = mid_value_decision_median(sort([I(i-1,1,z) I(i,1,z) I(i+1,1,z)]));% Tomando el nuevo pixel de la columna A.
      B = mid_value_decision_median(sort([I(i-1,2,z) I(i,2,z) I(i+1,2,z)]));% Tomando el nuevo pixel de la columna B.
      for j=3:n-1 % Recorriendo columnas de la imagen.
        C = mid_value_decision_median(sort([I(i-1,j,z) I(i,j,z) I(i+1,j,z)])); %Tomando el nuevo píxel de la columna C.
        imagen_limpia(i,j,z) = mid_value_decision_median([A B C]); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
        A = B; % Actualizando el valor de A hacia la columna adyacente que corresponde a B.
        B = C; % Actualizando el valor de B hacia la columna adyacente que corresponde a C.
      endfor
    endfor
  endfor
endfunction
