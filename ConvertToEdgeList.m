% przerzuc macierz na liste krawedzi do operacji wag
function el=ConvertToEdgeList(adj)

n=length(adj); % il wezlow
edges=find(adj>0); % krawedzie

el=[];
for e=1:length(edges)
  [i,j]=ind2sub([n,n],edges(e)); % indeksowanie
  el=[el; i j adj(i,j)];
end