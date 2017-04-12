% Homework1 Colleen Chen

% Load a grayscale image,  
% take a 100x100 sub-region of it. 
% Let the variable A refer to the 100 x 100 matrix representing that image. 
% Load in a color image and then convert it to grayscale using the rgb2gray function. 
% By default, MATLAB loads images a integer datatypes. 
% For this class we will always be performing numerical operations on the 
% pixel values so it is best to convert them to a floating point representation. 
% Use the im2double to convert your loaded image from an uint8 to a double datatype. 
% All together this looks like:

A0 = rgb2gray(imread('IMG_1665.JPG'));
A0 = im2double(A0); 

figure;
subplot(1,2,1)
imshow(A0)

% resize A by taking the 100x100 pixels from the center of image
A = A0 ( (size(A0,1)/2)-50 :  (size(A0,1)/2)+49 , (size(A0,2)/2)-50 :  (size(A0,2)/2)+49 ) ;
subplot(1,2,2)
imshow(A)

% (a) sort intensities. 
x = sort( A(:) ); 
figure; 
plot(x)

% ImgVector = Img(:);
% % Or:
% ImgVector = rehsape(Imgcolor, 1, []);

hist(x,32) 

t=median(x); 
B=A >= t;
imshow( B )
imwrite(B,'fig2c.jpg')















