function resultado = filtros_mediana_modificada(img_str, metodo)
  if(metodo == "f") %fmf = fast median filter
    resultado = fast_median_filter(img_str);
  elseif(metodo == "i") %iam =  improved approximated median
    resultado = improved_approximated_median(img_str);
  endif
endfunction

