function [horizDerivImage,vertDerivImage] = computeDerivImages( imageData,sigma )

gaussFilt = fspecial('gaussian',sigma);
rowNum = ceil(sigma/2);
gaussFilter = gaussFilt(rowNum,:);
filteredImageData = conv2(imageData,gaussFilter,'same');
horizDerivFilter = [1 -1];
horizDerivImage = conv2(filteredImageData,horizDerivFilter,'same');
vertDerivFilter = [1;-1];
vertDerivImage = conv2(filteredImageData,vertDerivFilter,'same');

end