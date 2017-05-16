imageData = imread('zebra_small.jpg');

%Zebra stripes on neck
centerX = 90;
centerY = 60;
radius = 40;
[~,~,imagePatch1] = filterDistribution(imageData,centerX,centerY,radius);

%Tree leaves
centerX = 165;
centerY = 20;
radius = 30;
[~,~,imagePatch2] = filterDistribution(imageData,centerX,centerY,radius);

%Grass 
centerX = 136;
centerY = 224;
radius = 20;
[~,~,imagePatch3] = filterDistribution(imageData,centerX,centerY,radius);

imagePatch2=imresize(imagePatch2,[41 41]);
imagePatch3=imresize(imagePatch3,[41 41]);

figure
subplot(1,3,1)
imshow(imagePatch1)
subplot(1,3,2)
imshow(imagePatch2)
subplot(1,3,3)
imshow(imagePatch3)

imwrite(imagePatch1,'imagePatch1.png','PNG')
imwrite(imagePatch2,'imagePatch2.png','PNG')
imwrite(imagePatch3,'imagePatch3.png','PNG')


% filterBank(imagePatch1);
% filterBank(imagePatch2);
% filterBank(imagePatch3);

