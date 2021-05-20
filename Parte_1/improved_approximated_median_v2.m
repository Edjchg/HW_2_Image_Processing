function imagen_limpia = improved_approximated_median_v2(I)
  [m n k] = size(I); % Obteniendo las dimensiones de la imagen I.
  imagen_limpia = uint8(zeros(m,n, k)); % Creando una imagen de salida del mismo tamaño que la imagen I.
  A=0;B=0;C=0;
  for z=1:k
    for i=1:m
      i_left=(1<i);i_right=(i<m);i_init=(i==1);i_end=(i==m);
      if i_left && i_right
        A=mid_value_decision_median(I(i-1:i+1,1,z),3);% Tomando el nuevo pixel de la columna A.
        B=mid_value_decision_median(I(i-1:i+1,2,z),3);% Tomando el nuevo pixel de la columna B.
      elseif i_init
        %A no existe para este pixel.
        B=mid_value_decision_median(I(i:i+1,1,z),2);% Tomando el nuevo pixel de la columna B.
      elseif i_end
        B=mid_value_decision_median(I(i-1:i,1,z),2);
      endif
      for j=1:n
        j_left=(1<j);j_right=(j<n);j_init=(j==1);j_end=(j==n);
        if i_left && i_right && j_left && j_right %Revisando cuando no esta en los bordes que es la mayoria del tiempo.
          C=mid_value_decision_median(I(i-1:i+1,j+1,z),3); %Tomando el nuevo píxel de la columna C.
          imagen_limpia(i,j,z) = mid_value_decision_median([A B C],3); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
        elseif i_init && j_init %Revisando la esquina superior izquierda.
          C=mid_value_decision_median(I(i:i+1,j+1,z),2); %Tomando el nuevo píxel de la columna C.
          imagen_limpia(i,j,z)=mid_value_decision_median([B C],2); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
        elseif i_init && j_left && j_right %Revisando el borde superior.
          C=mid_value_decision_median(I(i:i+1,j+1,z),2); %Tomando el nuevo píxel de la columna C.
          imagen_limpia(i,j,z)=mid_value_decision_median(sort([A B C]),3); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
        elseif i_init && j_end %Revisando la esquina superior derecha.
          %No existe columna C.
          imagen_limpia(i,j,z)=mid_value_decision_median([A B],2); % Tomando el nuevo pixel de los tres mejores pixeles antes tomados y guardandolo en la nueva imagen.
        elseif i_left && i_right && j_init% Revisando borde izquierdo.
          % No existe columna A.
          C=mid_value_decision_median(I(i-1:i+1,j+1,z),3);
          imagen_limpia(i,j,z)=mid_value_decision_median([B C],2);
        elseif i_left && i_right && j_end %Revisando borde derecho.
          %No hay borde C.
          imagen_limpia(i,j,z)=mid_value_decision_median([A B],2);
        elseif i_end && j_init %Revisando esquina inferior izquierda.
          %No hay A.
          C=mid_value_decision_median(I(i-1:i,j+1,z),2);
          imagen_limpia(i,j,z)=mid_value_decision_median([B C],2);
        elseif i_end && j_end %Revisando esquina inferior derecha
          %No hay C para este pixel
          imagen_limpia(i,j,z)=mid_value_decision_median([A B],2);
        elseif i_end && j_left && j_right %Revisando el borde inferior
          C=mid_value_decision_median(I(i-1:i,j+1,z),2);
          imagen_limpia(i,j,z)=mid_value_decision_median([A B C],3);
        endif
        A=B; % Actualizando el valor de A hacia la columna adyacente que corresponde a B.
        B=C; % Actualizando el valor de B hacia la columna adyacente que corresponde a C.
      endfor
    endfor
  endfor
endfunction


%mejorar las condiciones que se repiten.