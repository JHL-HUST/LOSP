function V = Walk(graph,p,k,steps,randomWalkMode,alpha)
% p is initial probability vector and steps is the number of random walk steps, 
% k is the dimension of the probability space
% return the k vectors in columns

if nargin < 1,
    % two overlapping cliques of size 5
    A = zeros(8,8);
    A(1:6,1:6)=1;
    A(5:8,5:8)=1;
    graph = A - diag(diag(A))
    % start from vertex 1
    p =[ 1     0     0     0     0     0     0     0 ];
    k = 2; % dimension of the subspace    
    steps = 3;
end

if nargin < 5
    randomWalkMode = 1; 
end

initP = p;

n = length(graph);

% randomWalkMode  1: standard, 2: light lazy, 3: lazy, 4: personalized 
% 1: standard, do nothing
% 2: add selfloop, light lazy, save 1/(d+1) prob at the current node

if(randomWalkMode ==2)
    graph = sparse(alpha*eye(n) + graph); % its iteration curve is more stable
else if(randomWalkMode == 3) % lazy random walk, save one half prob at the current node
        graph = alpha*diag(sum(graph)) + graph;
    end
end

graph = NormalizeGraph(graph); % aij=aij/di such that aij=pij
n = length(graph);
V = zeros(steps+1,n);
V(1,:) = p;

if (randomWalkMode == 4) % personalized random walk, with alpha = 0.1 probability to restart from the inital seeds
    for i = 1 : steps 
        V(i+1,:) = (1-alpha)*V(i,:)*graph + alpha * initP;
    end
else
    for i = 1 : steps
        V(i+1,:) = V(i,:)*graph; 
    end
end

V = V(steps-k+2:end,:);
V = orth(V');
end
