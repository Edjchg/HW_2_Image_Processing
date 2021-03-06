%-*- texinfo -*-
%@deftypefn {Function File} {@var{imagen_limpia} =}  fast_med(@var{I})
%Function fast_med()
%@end deftypefn

function imagen_limpia=fast_med(I)
  % Esta funcion toma una imagen con ruido de 'sal y pimienta' y lo reduce.
  % Entradas: Una imagen sucia en formato de 8 bits.
  % Salidas: Una imagen limpia en formato de 8 bits.
  [m n k]=size(I);% Obteniendo las dimensiones de la imagen I.
  imagen_limpia=uint8(zeros(m,n, k)); % Creando una imagen de salida del mismo tama?o que la imagen I.
  median_vector=uint8(zeros(1,3));% Creando un vector de tama?o 3 para hacer el vector de medianas.
  A=uint8(zeros(1,3));% Creando un vector de tama?o 3 para hacer el vector A.
  B=uint8(zeros(1,3));% Creando un vector de tama?o 3 para hacer el vector B.
  C=uint8(zeros(1,3));% Creando un vector de tama?o 3 para hacer el vector C.
  for z=1:k 
    for i=1:m
      i_left=(1<i);i_right=(i<m);i_init=(i==1);i_end=(i==m);
      if i_left && i_right % Caso donde no se encuentra en bordes, que es la mayor?a del tiempo.
        A=sort(I(i-1:i+1, 1, z)); %Extrayendo la columna A del kernel y ordenandola de forma ascendente.
        B=sort(I(i-1:i+1, 2, z)); %Extrayendo la columna B del kernel y ordenandola de forma ascendente.
      elseif i_init %Revisando borde superior
        %A no existe para este pixel
        B=sort(I(i:i+1,1,z));% Extrayendo la columna B del kernel y ordenandola de forma ascendente.
      elseif i_end %Revisando borde inferior
        %A no existe para este pixel
        B=sort(I(i-1:i,1,z));% Extrayendo la columna B del kernel y ordenandola de forma ascendente.
      endif
      for j=1:n
        j_left=(2<j);j_right=(j<n);j_init=(j==1);j_end=(j==n);
        if i_left && i_right && j_left && j_right %Caso donde no se encuentra en bordes, que es la mayor?a del tiempo.  
          C=sort([I(i-1:i+1,j+1,z)]);% Tomando la columna C del kernel y ordenandola de forma ascendente.
          median_vector = sort([A(2) B(2) C(2)]); % Creando el vector de medianas con los pixeles medios de A,B,C.
        elseif i_left && i_right && j_init %Revisando borde izquierdo
          %A no existe en este caso.
          %B = sort(I(i-1:i+1, j, z));%Extrayendo la columna B del kernel y ordenandola de forma ascendente.
          C = sort(I(i-1:i+1, j+1, z));% Tomando la columna C del kernel y ordenandola de forma ascendente.
          median_vector = sort([B(2) C(2)]); % Creando el vector de medianas con los pixeles medios de B,C.
        elseif i_left && i_right && j_end %Revisando borde derecho
          %C no existe para este pixel
          median_vector = sort([A(2) B(2)]); % Creando el vector de medianas con los pixeles medios de A,B,C.
        elseif i_init && j_init % Revisando esquina superior izquierda.
          C=sort(I(i:i+1,2,z));% Tomando la columna C del kernel y ordenandola de forma ascendente.
          median_vector = sort([B(1) C(2)]);% Creando el vector de medianas con los pixeles medios de B,C.
        elseif i_init && j_left && j_right %Revisando borde superior
          C=sort(I(i:i+1,j+1,z));% Tomando la columna C del kernel y ordenandola de forma ascendente.
          median_vector = sort([A(2) B(2) C(2)]); % Creando el vector de medianas con los pixeles medios de A,B,C.
        elseif i_init && j_end %Revisando esquina superior derecha
          median_vector = sort([A(2) B(2)]); % Creando el vector de medianas con los pixeles medios de A,B.
        elseif i_end && j_init %Revisando esquina inferior izquierda
          C=sort(I(i-1:i,j+1,z));% Tomando la columna C del kernel y ordenandola de forma ascendente.
          median_vector = sort([B(2) C(2)]);% Creando el vector de medianas con los pixeles medios de B,C.
        elseif i_end && j_left && j_right % Revisando el borde inferior.
          C=sort(I(i-1:i,j+1,z));% Tomando la columna C del kernel y ordenandola de forma ascendente.
          median_vector = sort([A(2) B(2) C(2)]); % Creando el vector de medianas con los pixeles medios de A,B,C.
        elseif i_end && j_end % Revisando el ultimo pixel
          median_vector = sort([A(2) B(2)]); % Creando el vector de medianas con los pixeles medios de A,B.
        endif
        imagen_limpia(i,j, z) = median_vector(2); % Asignando el nuevo pixel a la imagen de salida.
        A=B;% Actualizando el valor de la columna A a su columna adyacente para reutilizarla el siguiente ciclo.
        B=C;% Actualizando el valor de la columna B a su columna adyacente para reutilizarla el siguiente ciclo.
      endfor
     endfor
  endfor
endfunction
