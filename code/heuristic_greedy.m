function [path] = heuristic_greedy (start_position, probabilities, Adj)
  nr = size(Adj);
  path = zeros(1,nr);
  path(1) = start_position;
  visited = sparse(1,nr);
  visited(start_position) = 1;
  last = 1;
  while (last != 0)
    position = path(last);
    if (position == nr - 1) 
      break;
    endif
    nr_unvisited_neighbours = 0;
    v_unvisited_neigbhours = sparse (1, 4);
    for j = 1:nr
      if(Adj(position, j) != 0 && visited(j) == 0)
     nr_unvisited_neighbours = nr_unvisited_neighbours + 1; 
     v_unvisited_neigbhours(nr_unvisited_neighbours) = j;
     endif
    endfor
    if (nr_unvisited_neighbours == 0)
      path(last) = 0;
      last = last - 1;
    else
      prob_max = probabilities(v_unvisited_neigbhours(1));
      neigh = v_unvisited_neigbhours(1);
      for i = 2:nr_unvisited_neighbours
        if (probabilities(v_unvisited_neigbhours(i)) > prob_max)
          prob_max = probabilities(v_unvisited_neigbhours(i));
          neigh = v_unvisited_neigbhours(i);
        endif
      endfor
      last = last + 1;
      visited(neigh) = 1;
      path(last) = neigh;
    endif
  endwhile
  path = path';
  path = resize(path, [last, 1]);
endfunction
