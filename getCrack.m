function [cracksAndMasses,numConnComps, numPixels] = getCrack(im)
if size(im,3) ~=1
    im = rgb2gray(im);
end
im = im2double(im);
[im,rr,rc] = removePadding(im,1);
BW = edge(im,'prewitt','nothinning');
spread = conv2(double(BW),fspecial('gaussian',5,1),'same') > 0;
%spread = spread > 0;
BW2 = bwareaopen(spread,1000);


CC = bwconncomp(BW2);

%figure; imshow(BW2);
numConnComps = CC.NumObjects;
cracksAndMasses = double(imfill(BW2, 'holes'));
numPixels = sum(BW2(:));
%figure; imshow(cracksAndMasses);

end