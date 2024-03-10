function [Link] = get_link_matrix (Labyrinth)
  [m, n] = size(Labyrinth);
  nr_el = m * n;
  Link = sparse(nr_el+2,nr_el+2);
  v = zeros(1,4);
  Aux = zeros(m,n);
  for i = 1:m
    for j = 1:n
      Aux(i,j) = (i - 1) * n + j;
    endfor
  endfor
  for i = 1:m
    for j = 1:n
      nr = 0;
      v(4) = mod(Labyrinth(i,j),2);
      if v(4) == 0
        nr = nr+1;
      endif
      v(3) = mod(floor(Labyrinth(i,j) / 2), 2);
      if v(3) == 0
        nr = nr+1;
        endif
      v(2) = mod(floor(Labyrinth(i,j) / 4), 2);
      if v(2) == 0
        nr = nr+1;
        endif
      v(1) = mod(floor(Labyrinth(i,j) / 8), 2);
      if v(1) == 0
        nr = nr+1;
        endif
      if v(1) == 0
        if i-1  > 0 
          Link(Aux(i,j),Aux(i-1,j)) = 1/nr;
        else Link(Aux(i,j), nr_el+1) = 1/nr;   
        endif
      endif
      if v(2) == 0
        if i+1 <= m
          Link(Aux(i,j),Aux(i+1,j)) = 1/nr;
        else Link(Aux(i,j), nr_el+1) = 1/nr;
        endif  
      endif
      if v(3) == 0
        if j+1 <= n
          Link(Aux(i,j),Aux(i,j+1)) = 1/nr;
        else Link(Aux(i,j), nr_el+2) = 1/nr;
        endif
      endif
      if v(4) == 0
        if j-1 > 0
          Link(Aux(i,j),Aux(i,j-1)) = 1/nr;
        else Link(Aux(i,j), nr_el+2) = 1/nr;
        endif
      endif
    endfor
  endfor
  Link(nr_el+1,nr_el+1) = 1;
  Link(nr_el+2,nr_el+2) = 1;
endfunction
