% classify.m 
% fitcknn()  k=1 for nearest neighbor  
% pdist2 to compute pairwise distances 
% title, subplot, imagesc, imshow, mean, imread, rgb2gray, dir, reshape

% filelist = dir('images/*.jpg');
%       for i=1:length(filelist)
%                imname = ['images/' filelist(i).name];
%                nextim = imread(imname);
%       . . .
%       end


% load cifar-10-batches-mat/test_batch.mat
load cifar-10-batches-mat/data_batch_1.mat
load cifar-10-batches-mat/batches.meta.mat

size(data)

% data= im2double(data);
R=data(1,1:1024); % first row = first image 
G=data(1,1025:2048);
B=data(1,2049:3072);

% use first 30 ... 

R=data(4,1:1024); % first row = first image 
G=data(4,1025:2048);
B=data(4,2049:3072);


A(:,:,1)=reshape(R,32,32);
A(:,:,2)=reshape(G,32,32);
A(:,:,3)=reshape(B,32,32);

figure; 
imshow(A)

figure; 
image(A)

%%

% Create sample data.
% Make ramp
ramp = uint8(linspace(0,255, 32*32));
% Make a colored ramp with all 3 colors in one row.
tripleRamp = [ramp, fliplr(ramp) ramp];
% Replicate it to make 3072 long data.
data = repmat(tripleRamp, [10000 1]);
size(data)

% Now run Ankit's code
% Get R, G, and B from the first row.
R=data(1,1:1024);
G=data(1,1025:2048);
B=data(1,2049:3072);
% Create a 32x32 color image.
A = zeros(32,32,3, 'uint8');
A(:,:,1)=reshape(R,32,32);
A(:,:,2)=reshape(G,32,32);
A(:,:,3)=reshape(B,32,32);
% Display the color image.
image(A);
axis on;

%%
% Download CIFAR-10 data to a temporary directory
cifar10Data = tempdir;

url = 'https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz';

helperCIFAR10Data.download(url, cifar10Data);

% Load the CIFAR-10 training and test data.
[trainingImages, trainingLabels, testImages, testLabels] = helperCIFAR10Data.load(cifar10Data);



