function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
  steps = 1;
  [nr, nr] = size(G);
  x = sparse(1, nr);
  x = G * x0 + c;
  err = norm(x - x0, 2);
  x_ant = sparse(1, nr);
  while (err > tol && steps <= max_steps)
    x_ant = x;
    x = G * x_ant + c;
    err = norm(x - x_ant, 2);
    steps = steps + 1;
  endwhile
endfunction
