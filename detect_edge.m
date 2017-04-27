%% detect_edge.m 

% img = imread('simpsons.jpg');
% img = imread('zebra1.jpg');
% img = imread('zebra2.jpg');

img = imread('dilbert1.jpg');
figure;imshow(img) 
A = im2double(img);
figure; imagesc(A)
filt = fspecial('gaussian') ;

% filt = fspecial('gaussian', hsize, sigma) ;
% returns a rotationally symmetric Gaussian lowpass filter of size hsize 
% with standard deviation sigma (positive). hsize can be a vector specifying 
% the number of rows and columns in h, or it can be a scalar, in which case h 
% is a square matrix. The default value for hsize is [3 3]; the default value 
% for sigma is 0.5. Not recommended. Use imgaussfilt or imgaussfilt3 instead.


% conv2('same') 
