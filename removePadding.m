function [im_out, numRowsRemoved, numColsRemoved] = removePadding(im, thresh)

[h,w,~] = size(im);
[~,notZeroCols] = find((sum(im(:,:,1),1)) > 0);
[notZeroRows,~] = find((sum(im(:,:,1),2)) > 0);
im_out = im(notZeroRows,notZeroCols,:);
numRowsRemoved = h - size(notZeroRows,1)+1;
numColsRemoved = w - size(notZeroCols,2)+1;

[height,width,~] = size(im_out);
[~,notOneCols] = find((sum(im_out(:,:,1),1)) < height);
[notOneRows,~] = find((sum(im_out(:,:,1),2)) < width);
im_out = im_out(notOneRows,notOneCols,:);
numRowsRemoved = numRowsRemoved + height - size(notOneRows,1)+1;
numColsRemoved = numColsRemoved + width - size(notOneCols,2)+1;

%sum(im_out(:,end,1),1)