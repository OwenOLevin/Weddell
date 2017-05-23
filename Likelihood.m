function [ probability ] = Likelihood( blobs, tidecracks )


blobCenters = cell2mat(struct2cell(regionprops(blobs, 'Centroid'))');

dist = distanceToCracks(blobCenters, tidecracks);

E = regionprops(blobs, 'Eccentricity'); 
A = regionprops(blobs, 'Area');
%TODO: get weight for probability of blob being seal for eccentricity and
%area

% notEccentricSeals = ismember(L, find([E.Eccentricity] < ecc));
% notTinySeals = ismember(L, find([A.Area] > 2));

probability = 1 ./ exp(dist);


end

