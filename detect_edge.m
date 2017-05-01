%% detect_edge.m 

% img = imread('simpsons.jpg');
% img = imread('zebra1.jpg');
% img = imread('zebra2.jpg');

img = imread('dilbert1.jpg');
figure;imshow(img) 

A = im2double(img);
figure; imagesc(A)

sigma=0.5;
filt = fspecial('gaussian') ;

% filt = fspecial('gaussian', hsize, sigma) ;
% returns a rotationally symmetric Gaussian lowpass filter of size hsize 
% with standard deviation sigma (positive). hsize can be a vector specifying 
% the number of rows and columns in h, or it can be a scalar, in which case h 
% is a square matrix. The default value for hsize is [3 3]; the default value 
% for sigma is 0.5. Not recommended. Use imgaussfilt or imgaussfilt3 instead.


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



F = fft2(X);
m = abs(F);
p = angle(F)+ 2*pi*rand(size(p));
Y = real(ifft2(m.*exp(i*p),'symmetric'));
R = conv2(Y,[-1 1]);
[v,b] = hist(R(:),linspace(-50,50,49));
semilogy(b,log(v),'b'); 
