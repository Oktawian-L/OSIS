function elc=AddEdgeWeightsFromList(el)

el2=[el(:,1), el(:,2)]; 
visited=[];             

elc=[];
for e=1:size(el,1)
    if sum(ismember(visited,el2(e,:),'rows'))==0  
        ind=ismember(el2,el2(e,:),'rows');
        ind=find(ind==1);     
        elc=[elc; el(e,1), el(e,2), sum(el(ind,3))];
        visited=[visited; el2(e,:)];
    end
end