% Algorytm znajdowania najkrotszej sciezki
% Dziala na grafach skierowanych/nieskierowanych
%
% Parametry wejsciowe: L - (macierz wag), s - (zrodlo), 
%                                       t - (ujscie)
%                                 steps - liczba dozwolonych krokow 
% Parametry wyjsciowe
%       route - kolejnosc wezlow optymalnej sciezki na obecnym etapie
%       route(k,i).path - najlepsza trasa z 'i' do celu 't' w k krokach
%       route_st - najlepsza trasa z  "s" do "t"
%       cost - optimal cost function (path length) from "s" to "t"
%       J(1,i) - dystans aka koszt z i do t w k krokach


function [cost,route_st,J,route]=shortestPathDP(L,s,t,steps)

n = size(L,2);

L(find(L==0))=Inf;  % sciezki 0 to brak polaczenia, koszt trasy nieskonczony

for i=1:n
  J(steps,i) = L(i,t); 
  route(steps,i).path = [t];
end

% znajdz minimum dla kazdego i: Jk(i)=min_j(L(i,j)+Jk+1(j))
for p=1:steps-1
  k=steps-p; % rekurencja wstecz
  
  for i=1:n
    [J(k,i),ind_j] =  min(L(i,:)+J(k+1,:));
    route(k,i).path = [ind_j, route(k+1,ind_j).path];
  end
  
end



[cost,step_ind] = min(J(:,s));               % minimalny koszt z 's' do 't'
route_st = [s, route(step_ind,s).path];      % najkrotsza trasa z 's' do 't'
J=J(sort(1:min([n,steps]),'descend'),:);
route=route(sort(1:min([n,steps]),'descend'),:);