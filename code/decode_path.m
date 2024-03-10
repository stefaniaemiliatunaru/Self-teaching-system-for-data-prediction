function [decoded_path] = decode_path (path, lines, cols)
  [nr, nraux] = size(path);
  decoded_path = zeros(nr-1, 2);
  for i = 1:nr-1
      column = mod(path(i), cols);
      if(column == 0) 
      column = cols;
    endif
    line = ((path(i) - column)/cols) + 1;
  decoded_path(i, 1) = line;
  decoded_path(i, 2) = column;
  endfor
endfunction
