function [ expandedCrack ] = getCrackMask( Bim, width )
    
    %This gets an averaging kernel in factored form
    u = zeros(1,width);
    u(:) = 1/width;
    v = u';
      
    expandedCrack = conv2(u, v, Bim, 'same');
    expandedCrack(expandedCrack > 0) = 1;
    

end

