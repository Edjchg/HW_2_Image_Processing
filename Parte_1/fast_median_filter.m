function imagen_limpia = fast_median_filter(I)
  % Esta funcion toma una imagen con ruido de 'sal y pimienta' y lo reduce.
  % Entradas: Una imagen sucia en formato de 8 bits.
  % Salidas: Una imagen limpia en formato de 8 bits.
  [m n k] = size(I); % Obteniendo las dimensiones de la imagen I.
  imagen_limpia = uint8(zeros(m,n, k)); % Creando una imagen de salida del mismo tamaño que la imagen I.
  for z=1:k % Recorriendo los canales de la imagen.
    for i=2:m-1 % Recorriendo las filas de la imagen I.
      A = sort([I(i-1, 1,z) I(i, 1,z) I(i+1, 1,z)]); % Extrayendo la columna A del kernel y ordenandola de forma ascendente.
      B = sort([I(i-1, 2,z) I(i, 2,z) I(i+1, 2,z)]); % Extrayendo la columna B del kernel y ordenandola de forma ascendente.
      for j=3:n % Recorriendo las columnas.
        pix_A = A(2); % Tomando el elemento medio de la columna A.
        pix_B = B(2); % Tomando el elemento medio de la columna B.
        C = sort([I(i-1,j,z) I(i,j,z) I(i+1, j,z)]); % Tomando la columna C del kernel y ordenandola de forma ascendente.
        pix_C = C(2); % Tomando el elemento medio de la columna C.
        median_vector = sort([pix_A pix_B pix_C]); % Creando el vector de medianas, con los pixeles anteriormente tomados y ordenandolo de forma ascendente.
        imagen_limpia(i,j-1, z) = median_vector(2); % Asignando el nuevo pixel a la imagen de salida.
        A = B; % Actualizando el valor de la columna A a su columna adyacente para reutilizarla el siguiente ciclo.
        B = C; % Actualizando el valor de la columna B a su columna adyacente para reutilizarla el siguiente ciclo.
      endfor
    endfor
  endfor
endfunction