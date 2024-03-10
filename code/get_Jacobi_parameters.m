function [G, c] = get_Jacobi_parameters (Link)
  [m, n] = size(Link);
  m = m - 2;
  n = n - 2;
  G = sparse(m, n);
  c = sparse(1,n);
  G = Link(1:m, 1:n);
  c = Link(1:m, n+1);
endfunction
