% Algorytm Dijkstry
% 
% Parametry wejscia: M - macierz polaczen (nxn), s - zrodlo, t - ujscie
% Paramtery wyjscia: dist - dystans, P sciezka


function [dist,P]=dijkstra(M,s,target)

n=length(M);              % number of nodes
adjL=adj2adjL(M);         % list of neighbors

dist=inf(1,n);              % initialize distances
dist(s)=0;

previous=[1:n; inf(1,n)]';  % {i: inf}, i=1:n, inf -> not assigned
S=cell(1,n);                % initialize shortest path sequence


Q=[1:n]; % all unvisited vertices, entire graph

while length(Q)>0 % while not empty
  
    % get min dist member among unvisited vertices
    [mindist,min_ind]=min(dist(Q));
    u=Q(min_ind);
    
    % termination condition - save "source-u" path
    S{u}=[];
    t=u;
    while not(isempty(find(previous(:,1)==t)))  % t in previous.keys():
        % insert u at the beginning of S
        S{u}=[t S{u}];
        t=previous(t,2);
    end
    if length(target)>0 && u==target
        dist=dist(u); P=S{u};
        return
    end            
    
    % path book-keeping
    Q = setdiff(Q,u);         % remove u from Q
    
    for v=1:length(adjL{u})   % across all neighbors of u
        v=adjL{u}(v);        
        alt=dist(u)+M(u,v);
        if alt < dist(v)      % update the distance and path
            dist(v)=alt;
            previous(v,2)=u;
        end
    end
end

P=S;