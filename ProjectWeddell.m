function [ sealCount, crack_Im, seals_Im ] = ProjectWeddell( path, width, probabilityThreshold )
    % INPUT
    % path is a path (absolute or real) to the image to analyze
    % Width is the width in pixels around the tide-cracks in crack_Im
    
    % OUTPUT
    % sealCount is the number of seals found in image I
    % crack_Im is image I masked by the tide-cracks
    % seals_Im is image I with the identified seals shown
    
    % Get resolution of image from input string
    [pathstr,name,ext] = fileparts(path);
    identifier = name(1:4);
    
    switch identifier
        case 'WV02' 
            resolution = 0.46;
        case 'WV01'
            resolution = 0.46;
        case 'QB02'
            resolution = 0.65;
        otherwise
            warning('File resolution unknown, defaulting to 0.46m.  Expected file beginning with WV02, WV01, or QB02');
            resolution = 0.46;
    end

    I = imread(path);
    I = im2double(I);
    
    crack = getCrack(I, resolution);
    crackMask = getCrackMask(crack, width, resolution);
    %crack_Im = applyCrackMask(crackMask, I);
    seals_Im = blobDetector(I, .8, resolution);
    %binaryImage = imfill(binaryImage, 'holes');
   
    
    CC = bwconncomp(seals_Im, 4);
    prob = Likelihood(CC, crack, probabilityThreshold);

    sealCount = CC.NumObjects;

%     figure; imshow(seals_Im);

end

