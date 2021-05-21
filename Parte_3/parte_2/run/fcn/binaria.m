%-*- texinfo -*-
%@deftypefn {Function File} {@var{Y} =}  binaria(@var{X})
%Function binaria()
%@end deftypefn

%Entradas:
% X=imagen a convertir en binaria en double normalizado.
%Salida: 
% Y=imagen binaria en double normalizado 
%
function Y=binaria(X)
  Y=zeros(size(X));
  ind_blancos=(X>=0.5);
  ind_negros=(X<0.5);
  Y(ind_blancos)=1;
  Y(ind_negros)=0;
endfunction
