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

%% download cifar10 dataset
system('wget https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz') 
system('tar -xzvf cifar-10-matlab.tar.gz')
load cifar-10-batches-mat/test_batch.mat

%% convert test dataset of cifar10, and save
X = reshape(data', [32, 32, 3, 10000]);
X = permute(X, [2 1 3 4]);
Y = labels + 1;


save cifar10-test X Y
%% preview one picture
imshow(imresize(X(:,:,:,2), [128, 128]))


%%
% load cifar-10-batches-mat/test_batch.mat
load cifar-10-batches-mat/data_batch_1.mat
load cifar-10-batches-mat/batches.meta.mat
size(data)
   
n=30;
A=zeros([32 32 3 n]);

for i = 1:n
% use first 30 ...
R=data(i,1:1024); % first row = first image 
G=data(i,1025:2048);
B=data(i,2049:3072);

A(:,:,1,i)=reshape(R,32,32);
A(:,:,2,i)=reshape(G,32,32);
A(:,:,3,i)=reshape(B,32,32); % this is of data type double 

end

i=30
figure; 
subplot(1,2,1)
imshow(uint8(A(:,:,:,i))) % to imshow/image, must convert from double to uint8 
subplot(1,2,2)
imagesc(uint8(A(:,:,:,i)))


img = A(:,:,:,i);


%%



%% 
Mdl = fitcknn(img,labels,'NumNeighbors',5,'Standardize',1);









