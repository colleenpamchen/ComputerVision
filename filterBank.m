imname = 'zebra_small.jpg';
imageData = im2double(rgb2gray(imread(imname)));

% prob2function(imageData)
% function [  ] = prob2function( imageData )
%PROB2FUNCTION Summary of this function goes here
%   Detailed explanation goes here
%
%h1 means horizontal derivative, sigma 1
%h2, h4, v1, v2, v4 follow the same thing
%g42 is gaussian 4-2, g21 is similar
[h1,v1,h2,v2,h4,v4,g42,g21] = get8FilterImages(imageData);



[h1, vertDeriv_Sigma1_imageData] = computeDerivImages(imageData,1);
[h2, vertDeriv_Sigma2_imageData] = computeDerivImages(imageData,2);
[horizDeriv_Sigma4_imageData,vertDeriv_Sigma4_imageData] = computeDerivImages(imageData,4);
gaussDiff_4_2_imageData = computeGaussDiff(imageData,1,2);
gaussDiff_2_1_imageData = computeGaussDiff(imageData,2,4);


figure

subplot(2,4,1)
imshow(h1,[])
title('Horiz,sigma=1');

subplot(2,4,2)
imshow(h2,[])
title('Horiz,sigma=2');

subplot(2,4,3)
imshow(h4,[])
title('Horiz,sigma=4');

subplot(2,4,4)
imshow(g42,[])
title('G_4 - G_2');

subplot(2,4,5)
imshow(v1,[])
title('Vert,sigma=1');

subplot(2,4,6)
imshow(v2,[])
title('Vert,sigma=2');

subplot(2,4,7)
imshow(v4,[])
title('Vert,sigma=4');

subplot(2,4,8)
imshow(g21,[])
title('G_2-G_1');

% end

% function [ horizDeriv_Sigma1_imageData,vertDeriv_Sigma1_imageData,...
%     horizDeriv_Sigma2_imageData,vertDeriv_Sigma2_imageData,...
%     horizDeriv_Sigma4_imageData,vertDeriv_Sigma4_imageData,...
%     gaussDiff_4_2_imageData,gaussDiff_2_1_imageData] = get8FilterImages( imageData )
%GET8FILTERIMAGES Summary of this function goes here
%   Detailed explanation goes here


% end


