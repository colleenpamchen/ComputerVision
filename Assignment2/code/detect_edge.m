%% detect_edge.m 

img1 = imread('dilbert1.jpg');
img2 = rgb2gray(imread('zebra1.jpg'));
img3 = rgb2gray(imread('zebra2.jpg'));
img4 = rgb2gray(imread('simpsons.jpg'));

img=img2; 
% figure;imshow(img) 
A = im2double(img);
figure; imagesc(A)

sigma=0.5;
filt = fspecial('gaussian') ;
% filt = fspecial('gaussian', hsize, sigma) ;

C = conv2(A,filt,'same');
figure;imagesc(C)

[Gmag, Gdir] = imgradient(C);

figure
imshowpair(Gmag, Gdir, 'montage');
title('Gradient Magnitude, Gmag (left), and Gradient Direction, Gdir (right), using Prewitt method')


BW1 = edge(C,'sobel');
BW2 = edge(C,'canny');
figure;
imshowpair(BW1,BW2,'montage')
title('Sobel Filter                                   Canny Filter');

