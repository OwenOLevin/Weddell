function out = blobDetector( I, sigma)

    %get binary image of convolved image
    ker = fspecial('log', [7,7], sigma);
    logI = conv2(I, ker, 'same');
    
    BW = im2bw(logI, .07);   
    CC = bwconncomp(BW, 8);
    
    %Filter blobs
   
    L = labelmatrix(CC);
    BinaryL = im2bw(L, .001);
    
    %% debugging
%     subIm = BW(175:250,1380:1610);
%      figure; imshow(subIm)
     %%
    
%     notEccentricSeals = ismember(L, find([E.Eccentricity] < ecc));
%     notTinySeals = ismember(L, find([A.Area] > 2));
%     
%     potentialSeals = notEccentricSeals & notTinySeals;
%  
    out = BinaryL;
    

end

