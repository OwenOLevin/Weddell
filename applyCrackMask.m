function [ out ] = applyCrackMask( Bim, Rim  )

    
    [Brows, Bcols] = size(Bim);
    [Rrows, Rcols] = size(Rim);
    
    rows = min(Brows, Rrows);
    cols = min(Bcols, Rcols);
    
    Bim = Bim(1:rows, 1:cols);
    Rim = Rim(1:rows, 1:cols);
    
    out = zeros(rows, cols);
    
    %B = repmat(Bim,[1,1,3]);
    Rim = im2double(Rim);
    
    [Rim,rr,rc] = removePadding(Rim,1);
    [r, c] = size(Rim);
    Bim = Bim(1:r,1:c);
    out = im2double(Rim) .* Bim;
    


end

