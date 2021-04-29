function resultado = filtros_mediana_modificada(img_str, metodo)
  % Esta funcion toma una imagen y un parametro que selecciona el metodo de filtro que se desea.
  % Entradas: - Una imagen en formato de 8 bits.
  %           - Una cadena de caracteres con el valor del metodo que se desea. 
  % Salidas: - Una imagen en formato de 8 bits limpia mediante el metodo antes seleccionado.
  I = uint8(I);
  if(metodo == "f") %f = fast median filter
    resultado = fast_median_filter(img_str);
  elseif(metodo == "i") %i =  improved approximated median
    resultado = improved_approximated_median(img_str);
  endif
endfunction