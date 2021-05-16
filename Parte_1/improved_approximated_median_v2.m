function imagen_limpia = improved_approximated_median_v2(I)
  [m n k] = size(I); % Obteniendo las dimensiones de la imagen I.
  imagen_limpia = uint8(zeros(m,n, k)); % Creando una imagen de salida del mismo tamaño que la imagen I.
  A=0;B=0;C=0;
  for z=1:k
    for i=1:m
      if 1<i && i<m
        A=mid_value_decision_median(sort(I(i-1:i+1,1,z)));% Tomando el nuevo pixel de la columna A.
        B=mid_value_decision_median(sort(I(i-1:i+1,2,z)));% Tomando el nuevo pixel de la columna B.
      elseif i==1
        %A no existe para este pixel.
        B=mid_value_decision_median(sort(I(i:i+1,1,z)));% Tomando el nuevo pixel de la columna B.
      elseif i==m
        B=mid_value_decision_median(sort(I(i-1:i,1,z)));
      endif
      for j=1:n
        if 1<i && i<m && 1<j && j<n %Revisando cuando no esta en los bordes que es la mayoria del tiempo.
          C=mid_value_decision_median(sort(I(i-1:i+1,j+1,z))); %Tomando el nuevo píxel de la columna C.
          imagen_limpia(i,j,z) = mid_value_decision_median(sort([A B C])); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
        elseif i==1 && j==1 %Revisando la esquina superior izquierda.
          C=mid_value_decision_median(sort(I(i:i+1,j+1,z))); %Tomando el nuevo píxel de la columna C.
          imagen_limpia(i,j,z)=mid_value_decision_median(sort([B C])); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
        elseif i==1 && 1<j && j<n %Revisando el borde superior.
          C=mid_value_decision_median(sort(I(i:i+1,j+1,z))); %Tomando el nuevo píxel de la columna C.
          imagen_limpia(i,j,z)=mid_value_decision_median(sort([A B C])); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
        elseif i==1 && j==n %Revisando la esquina superior derecha.
          %No existe columna C.
          imagen_limpia(i,j,z)=mid_value_decision_median(sort([A B])); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
        elseif 1<i && i<m && j==1% Revisando borde izquierdo.
          % No existe columna A.
          B=mid_value_decision_median(sort(I(i-1:i+1,j,z)));
          C=mid_value_decision_median(sort(I(i-1:i+1,j+1,z)));
          imagen_limpia(i,j,z)=mid_value_decision_median(sort([B C]));
        elseif 1<i && i<m && j==n %Revisando borde derecho.
          %No hay borde C.
          imagen_limpia(i,j,z)=mid_value_decision_median(sort([A B]));
        elseif i==m && j==0 %Revisando esquina inferior izquierda.
          %No hay A.
          C=mid_value_decision_median(I(i-1:i,j+1,z));
          imagen_limpia(i,j,z)=mid_value_decision_median(sort([B C]));
        elseif i==m && j==n %Revisando esquina inferior derecha
          %No hay C para este pixel
          imagen_limpia(i,j,z)=mid_value_decision_median(sort([A B]));
        elseif i==m && 1<j && j<n %Revisando el borde inferior
          C=mid_value_decision_median(I(i-1:i,j+1,z));
          imagen_limpia(i,j,z)=mid_value_decision_median(sort([A B C]));
        endif
        A=B; % Actualizando el valor de A hacia la columna adyacente que corresponde a B.
        B=C; % Actualizando el valor de B hacia la columna adyacente que corresponde a C.
      endfor
    endfor
  endfor
endfunction