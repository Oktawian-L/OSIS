# convert a standard edge-adjacency matrix (1 for edge to other node, 0
# otherwise), to an initial distance matrx (i.e. Inf for >1-hop nodes).
function A = adj_to_min_plus (A)
        A(A == 0) = Inf;
        A(logical(eye(size(A)))) = 0;
endfunction
 
# less memory intensive, but slower, version for v large graphs.
function A = adj_to_min_plus_s (A)
        for i = 1:rows(A)
                B = A(i,:);
                B(B == 0) = Inf;
                A(i,:) = B;
                A(i,i) = 0;
        endfor
endfunction  
 
 
# matrix multiplication in the (R,min,+) semi-ring,
#
# for A being an initial distance matrix for a graph with no negative
# cycles, this will converge on the shortest distances in the graph.
function [ D changed ] = min_plus_mul (A)
        changed = false;
        n = columns(A);
        # as noted by mcgrant on #octave on Freenode IRC:
        # for non-sparse matrices this could be optimised with bsxfun.
        # in some way similar to:
        # reshape(sum(bsxfun(@times,A,
        #                    reshape(X,[1,size(X)])),
        #             2),size(A,1),size(X,2))
        # 
        # for sparse matrices, it's possible bsxfun could still 
        # be used to optimised the inner loop.
        for i = 1:n
                for j = 1:n
                        val = A(i,j);
                        D(i,j) = min(A(i,:) .+ A(:,j)');
                        if (D(i,j) != val)
                                changed = true;
                        endif
                endfor
        endfor
endfunction
 
# power iterate till convergence, or for the specified number of iterations
function [ A iterations ] = min_plus_mul_power (A, n = columns(A))
        for i = 1:n
                [ A c ] = min_plus_mul (A);
                if (c == false)
                        break;
                endif
        endfor
        iterations = i;
endfunction