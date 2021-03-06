function [A W] = LearnGraphStructure(dataset)

% Input:
% dataset: N x 10 x 3, N poses represented by 10 parts in (y, x, alpha)
% 
% Output:
% A: maximum spanning tree computed from the weight matrix W
% W: 10 x 10 weight matrix, where W(i,j) is the mutual information between
%    node i and j. 
%
% Copyright (C) Daphne Koller, Stanford Univerity, 2012

N = size(dataset,1);
K = size(dataset,3);

W = zeros(10,10);
% Compute weight matrix W
% set the weights following Eq. (14) in PA description
% you don't have to include M since all entries are scaled by the same M
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE        
%%%%%%%%%%%%%%%%%%%%%%%%%%%
numBodyParts = 10;
for i = 1:numBodyParts
    bodyPartI = squeeze(dataset(:, i, :));
    for j = 1:numBodyParts
        bodyPartJ = squeeze(dataset(:, j, :));
        curWeightInfo = GaussianMutualInformation(bodyPartI, bodyPartJ);
        W(i, j) = curWeightInfo;
    end
end
% Compute maximum spanning tree
A = MaxSpanningTree(W);