adj =[0 1 1 1 0 0 0 0; 
      1 0 1 0 0 1 0 0; 
      1 0 0 1 1 0 1 0; 
      1 0 1 0 0 0 1 0; 
      0 0 1 0 0 1 0 1; 
      0 1 0 0 1 0 1 1;
      0 0 1 1 0 1 0 1;
      0 0 0 0 1 1 1 0] 
A = [1 1 0 0 1 0;
     1 0 1 0 1 0;
     0 1 0 1 0 0;
     0 0 1 0 1 1;
     1 1 0 1 0 0;
     0 0 0 1 0 0];
      
wg = [0 2 4 5 0 0 0 0;
      2 0 1 0 0 3 0 0;
      4 1 0 6 8 0 1 0;
      3 0 6 0 0 0 5 0;
      0 0 8 0 0 4 0 5;
      0 3 0 0 4 0 1 1;
      0 0 1 5 0 1 0 3;
      0 0 0 0 5 1 3 0]
      
%list = ConvertToEdgeList(adj)
%zm = AddEdgeWeightsFromList(list)
%[ Jst , route_st , J , route ]=shortestPathDP( wg , 1 , 6 , 1 ) ;

[d,p] = dijkstra( A, 1 , 6);