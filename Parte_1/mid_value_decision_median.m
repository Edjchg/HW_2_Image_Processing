function pixel = mid_value_decision_median(P,len)
  % Este método elige el pixel mas ideoneo del arreglo P de tres pixeles medios.
  % Entradas: - Un arreglo de tres pixeles.
  % Salidas: - El pixel elegido.
  P = sort(P); % Ordenando de forma ascendente al arreglo P.
  %if P(2) == 255 % Si el pixel de en medio es muy blanco, entonces el pixel elegido es el pixel con menor valor.
  %  pixel = P(1);
  %elseif 0 < P(2) && P(2) < 255 % Si el pixel de en medio esta entre el rango de 0 y 255, entonces el pixel elegido es el pixel de en medio.
  %  pixel = P(2);
  %else %P(2) == 0 % Si el pixel de en medio es muy negro, entonces el pixel elegido es el pixel con mayor valor.
  %  pixel = P(3);
  %endif
  P_2=P(2);
  switch len
    case 3
    switch P_2
      case 255
        pixel=P(1);
      case 0
        pixel=P(3);
      otherwise
        pixel=P_2;
    endswitch
  otherwise
    switch P_2
      case 255
        pixel=P(1);
      otherwise
        pixel=P_2;
    endswitch
  endswitch
endfunction
