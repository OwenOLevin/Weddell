function [ dist ] = distanceToCracks( blobCenters, tidecracks )

crackBounds = bwboundaries(tidecracks);
numCracks = size(crackBounds);

[numBlobs, cols] = size(blobCenters);
distToCrack = zeros(numBlobs, 1);

for i = 1 : numBlobs
    for j = 1 : numCracks
        crack = crackBounds{j};
        [r, c] = size(crack);
        min = 2^15;
        for k = 1 : r
            dist = norm(crack(r,:) - blobCenters(i));
            if(dist < min)
                min = dist;
                minInd = i;
            end
        end
    end
    distToCrack(i) = min;
end

dist = distToCrack ./ max(distToCrack);


end

