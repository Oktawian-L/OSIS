% Simple implementation of Bhandari algoritm
% INPUTs: graph structure 
%         s - start node 
%         t - end node
%         k - number of paths
%OUTPUT:
%    edge-disjoint paths matrix

function T=Bhandari(graph,s,t,k)
%Find th shortest path Pi from node s to node t

[ distance, path ]=dijkstra(graph,s,t);

for i = 1:k
  T(i)= i*i % example only
  end
 end 