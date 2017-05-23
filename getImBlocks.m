function [blocks] = getImBlocks(im,rows,cols)
[h,w,~] = size(im);
blocks = cell(ceil(h/rows),ceil(w/cols));

for i = 1:ceil(h/rows);
    for j = 1:ceil(w/cols);
        blocks{i,j} = im((i-1)*rows+1:min((i)*rows,h),(j-1)*cols+1:min((j)*cols,w));
    end
end
end