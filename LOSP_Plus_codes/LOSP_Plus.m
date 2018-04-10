function [] = LOSP_Plus(WalkMode,d,k,alpha,TruncateMode,beta) 
% Local Spectral Method Variations
% WalkMode: 1: standard, 2: light lazy, 3: lazy, 4: personalized
% d: dimension of local spectral subspace
% k: number of random walk steps
% alpha: a parameter of random walk diffusion
% TruncateMode: 1: truncation by truth size, 2: truncation by local minimal conductance
% beta: a parameter of local minimal conductance

if nargin < 1
    WalkMode = 2;
end

if nargin < 2
    d = 2;
end

if nargin < 3
    k = 3;
end

if nargin < 4
    alpha = 1;
end

if nargin < 5
    TruncateMode = 2;
end

if nargin < 6
    beta = 1.02;
end

graphPath = '../example/Amazon/graph';
communityPath = '../example/Amazon/community';

% load graph
graph = loadGraph(graphPath);

% load truth communities
comm = loadCommunities(communityPath);

% choose a community from truth communities randomly
commId = randi(length(comm));

% choose 3 nodes from selected community randomly
seedId = randperm(length(comm{commId}),3);
seed = comm{commId}(seedId);

% grab subgraph from each seed set
sample = SampleGraph(seed,graph);

% preprocessing, delete isolated nodes
subgraph = graph(sample,sample);
idx = find(sum(subgraph)==0);

if length(idx) > 0
    sample = setdiff(sample,sample(idx));
end

% approximate local spectral subspace
subgraph = graph(sample,sample);
p = zeros(1,length(sample));
[~, ind] = intersect(sample,seed);
p(ind) = 1/length(ind);
% local spectral subspace built on Nrw^T
V = Walk(subgraph,p,d,k,WalkMode,alpha);
% local spectral subspace built on Nrw
% V = Walk_Nrw(subgraph,p,d,k,WalkMode,alpha);

% get sparse vector by linear programming
v = pos1norm(V,ind);

if TruncateMode == 1
    % bound detected community by truth community size
    if length(sample) < length(comm{commId})
        detectedComm = sample;
    else
        [~,I] = sort(v,'descend');
        detectedComm = sample(I(1:length(comm{commId})));
    end
end

if TruncateMode == 2
    % bound detected community by local minimal conductance
    % compute conductance
    [~,I] = sort(v,'descend');
    conductance = zeros(1,length(I));
    for j = 1 : length(I)
        conductance(j) = getConductance(subgraph,I(1:j));
    end
    
    % compute first local minimal conductance
    [~,I2] = intersect(I,ind);
    startId = max(I2);
    index = GetLocalCond(conductance,startId,beta);
    detectedComm = sample(I(1:index));
end

% compute F1 score
jointSet = intersect(detectedComm,comm{commId});
jointLen = length(jointSet);
F1 = 2*jointLen/(length(detectedComm)+length(comm{commId}));

% printing out result
fprintf('The detected community is')
disp(detectedComm')
fprintf('The F1 score between detected community and ground truth community is %.3f\n',F1)

% save out result
savePathandName = '../example/Amazon/output_LOSP_Plus.txt';
dlmwrite(savePathandName,'The detected community is','delimiter','');
dlmwrite(savePathandName,detectedComm','-append','delimiter','\t','precision','%.0f');
dlmwrite(savePathandName,'The F1 score between detected community and ground truth community is','-append','delimiter','');
dlmwrite(savePathandName,F1,'-append','delimiter','\t','precision','%.3f');

end
