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

for i = 2:k
  pos = find(path > i); % find position - only for x < i 
  
  T = [path(path(1):path(pos-1)) 
        path(pos)+0.1 
        path(pos)+0.2 
        path(path(pos+1):end)];

 
  end
 end 