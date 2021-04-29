function pixel = mid_value_decision_median(P)
  P = sort(P);
  if P(2) == 255
    pixel = P(1);
  elseif 0 < P(2) && P(2) < 255
    pixel = P(2);
  elseif P(2) == 0
    pixel = P(3);
  endif
endfunction
