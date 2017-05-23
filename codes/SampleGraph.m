function I2 = sampleGraph(seeds,graph )
% Sample the subgraph according to BFS

for k = 1 : length(seeds)
    newI = [];
    tempI = find(graph(seeds(k),:)>0);
    newI = union(newI,tempI,'stable');
    I = union(seeds(k), newI,'stable');
    I = sort(I);
    degreesOut = zeros(1,length(I));
    degrees = sum(graph);
    degrees = degrees(I);
    subgraphI = graph(I,I);
    subdegreesIn = sum(subgraphI);
    
    for i = 1 : length(I)
        degreesOut(1,i) = degrees(1,i)-subdegreesIn(1,i);
    end
    
    degreesRatio = subdegreesIn./degreesOut;
    [~,Ind] = sort(degreesRatio,'descend');
    
    for j = 1 : length(Ind)
        if sum(degreesOut(Ind(1:j))) > 3000
            break;
        end
    end
    
    I2 = I(Ind(1:j));
    [~,I3] = BFS(graph,I2,1);
    I4 = union(I3,I);
    I4 = union(I2,I4);
    I_seeds{1,k} = I4;
    
    if length(I_seeds{1,k}) < 300
        [~,I3] = BFS(graph,I3,1);
        I4 = union(I3,I);
        I4 = union(I2,I4);
        I_seeds{1,k} = I4;
    end
end

cellfun(@length,I_seeds);
I = [];

for k =  1 : length(seeds) 
    I = union(I,I_seeds{1,k});
end

if length(I) > 5000
    p = zeros(1,length(I));
    [~, ind ] = intersect(I,seeds);
    subgraph = graph(I,I);
    p(ind) = 1/length(ind);
    Prob = RandomWalk(subgraph,p,3);
    [~,ind2] = sort(Prob,'descend');
    Idx = ind2(1:5000);
    I2 = I(Idx);
    I2 = union(I2,seeds);
else
    I2 = I;
end

end
