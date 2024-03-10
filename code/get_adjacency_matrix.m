function [Adj] = get_adjacency_matrix (Labyrinth)
  [m, n] = size(Labyrinth);
  nr_el = m * n;
  Adj = sparse(nr_el+2, nr_el+2);
  v = zeros(1, 4);
  Aux = sparse(m,n);
  for i = 1:m
    for j = 1:n
      Aux(i,j) = (i-1) * n + j;
    endfor
  endfor
  for i = 1:m
    for j = 1:n
      v(4) = mod(floor(Labyrinth(i,j) / 1), 2);
      v(3) = mod(floor(Labyrinth(i,j) / 2), 2);
      v(2) = mod(floor(Labyrinth(i,j) / 4), 2);
      v(1) = mod(floor(Labyrinth(i,j) / 8), 2);
      if v(1) == 0
        if i-1  > 0 
          Adj(Aux(i,j),Aux(i-1,j)) = 1;
        else
         Adj(Aux(i,j), nr_el+1) = 1;   
        endif
      endif
      if v(2) == 0
        if i+1 <= m
          Adj(Aux(i,j),Aux(i+1,j)) = 1;
        else 
          Adj(Aux(i,j), nr_el+1) = 1;
        endif  
      endif
      if v(3) == 0
        if j+1 <= n
          Adj(Aux(i,j),Aux(i,j+1)) = 1;
        else 
        Adj(Aux(i,j), nr_el+2) = 1;
        endif
      endif
      if v(4) == 0
        if j-1 > 0
          Adj(Aux(i,j),Aux(i,j-1)) = 1;
        else 
        Adj(Aux(i,j), nr_el+2) = 1;
        endif
      endif
    endfor
  endfor
  Adj(nr_el+1,nr_el+1) = 1;
  Adj(nr_el+2,nr_el+2) = 1;
endfunction
