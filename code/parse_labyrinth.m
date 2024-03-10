function [Labyrinth] = parse_labyrinth (file_path)
  filein = fopen(file_path, 'r');
  m = fscanf(filein, '%d', 1);
  n = fscanf(filein, '%d', 1);
  Labyrinth = zeros(m,n);
  for i = 1:m
    for j = 1:n
      Labyrinth(i,j) = fscanf(filein, '%d', 1);
    endfor
  endfor
endfunction
