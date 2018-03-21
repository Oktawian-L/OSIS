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
  path = [path s];  % vector from Ponyhunter
  pos = find(path < i); % find position - only for x < i   
  b = [path(path[1]:path[pos-1]) 3 path(path[pos]:end)]; %  b = [a(1:2) 3 a
   %weigh = 0 
  T = b;
 
  end
 end 