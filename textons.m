function [  ] = textons(imageData)

imageDataSize = size(imageData);
numRow = imageDataSize(1);
numColumn = imageDataSize(2);

resp = zeros(numRow,numColumn,8);
[resp(:,:,1),resp(:,:,2),resp(:,:,3),...
    resp(:,:,4),resp(:,:,5),resp(:,:,6),...
    resp(:,:,7),resp(:,:,8)] = ...
    filterBank(imageData);

numPixels = numRow*numColumn;
imageDataRow = reshape(resp,[numPixels 8]);

%k-Means cluster
k=20;
[Indices,~] = kmeans(imageDataRow,k);
labelData = reshape(Indices,[numRow numColumn]);
figure
imagesc(labelData);
colormap jet
colorbar
end