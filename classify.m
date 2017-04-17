%% download cifar10 dataset
clear all; close all; clc; 
system('wget https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz') 
system('tar -xzvf cifar-10-matlab.tar.gz')
%% load CIFAR images 
load('cifar-10-batches-mat/batches.meta.mat')
load cifar-10-batches-mat/data_batch_1.mat
n=2000; % SUBSAMPLE SIZE 
train = double(data(1:n,:)) ; 
y_train = labels(1:n); 
%% display first airplane image from test set 
load cifar-10-batches-mat/test_batch.mat
test = double(data(1:n,:));
y_test= labels(1:n); 

testd = reshape(test', [32, 32, 3, n]);
testd = uint8(permute(testd, [2 1 3 4]));
test_label = y_test + 1;

for k=1:n
    if test_label(k)==1
    figure; 
    imshow(imresize(testd(:,:,:, k ), [128, 128]))
    title ([cellstr(label_names(test_label(k)))])
    break
    end    
end
%% build nearest neighbor classifier using a subsample of training data batch 1 
traind = reshape(train', [32, 32, 3, n]);
traind = uint8(permute(traind, [2 1 3 4]));
train_label = y_train + 1;

% D = pdist(train,'spearman') ;
D = pdist2(train,test); % returns D(i,j) where X(i) Y(j)
    % [D,I] = pdist2(train,test,'euclidean','smallest',knn); 
    % returns a K-by-my matrix I containing indices of the observations in X corresponding to the K smallest pairwise distances in D. 
% Z = squareform(D) ; 
% [~,index] = sort(D);

nearestnn=zeros(n,4); 

for traincol=1:n
[colval,colidx] = sort(D(:,traincol));
neighbor1 = traincol; % training obs 
neighbor2 = colidx(1); % test obs

nearestnn(traincol,1) = neighbor1;
nearestnn(traincol,2) = neighbor2;
nearestnn(traincol,3) = train_label(neighbor1); % training label | predicted test label 
nearestnn(traincol,4) = test_label(neighbor2); % ACTUAL test label 


% figure;
% subplot(1,2,1)
% imshow(imresize(traind(:,:,:, neighbor1 ), [128, 128]))
% title ([cellstr(label_names(train_label(neighbor1)))])
% subplot(1,2,2)
% imshow(imresize(testd(:,:,:, neighbor2 ), [128, 128]))
% title ([label_names(test_label(neighbor2))])


end

[C,order]=confusionmat(nearestnn(:,4),nearestnn(:,3));
accuracy = (trace(C)/10);

figure;
imagesc(C); 
colorbar 
title(sprintf('class confusion matrix, average classification accuracy: %d',accuracy))

% plot figures 
% figure;
% subplot(1,2,1)
% imshow(imresize(traind(:,:,:,1), [128, 128]))
% title ([cellstr(label_names(train_label(1)))])
% subplot(1,2,2)
% imshow(imresize(traind(:,:,:,4), [128, 128]))
% title ([label_names(train_label(4))])

%% KNN = 1,3,5 
knn=[1 3 5];
neighbors = zeros(n,3,length(knn));

for k=1:length(knn) 
    
    for traincol=1:n
        
        [colval,colidx] = sort(D(:,traincol));
        neighbor1 = traincol; % training obs 
        neighbors2 = colidx(1:knn(k)); % test obs
        class = mode( test_label( neighbors2(:) ) ); 
        neighbors(traincol,1,k) = train_label(neighbor1); % training label 
        neighbors(traincol,2,k) = class; % predicted class label 
        neighbors(traincol,3,k) = test_label(neighbors2(1)); %  
    end
    
    [C,order] = confusionmat( neighbors(:,1,k), neighbors(:,2,k) );
    error = (trace(C)/10);

    figure;
    imagesc(C); 
    colorbar 
    title( sprintf( 'Classification error: %d at KNN=%d ',error, knn(k) ) )

end



%%












%% scratch notes 
% Mdl = fitcknn(img,labels,'NumNeighbors',5,'Standardize',1);
% % classify.m 
% % fitcknn()  k=1 for nearest neighbor  
% % pdist2 to compute pairwise distances 
% % title, subplot, imagesc, imshow, mean, imread, rgb2gray, dir, reshape
% 
% % filelist = dir('images/*.jpg');
% %       for i=1:length(filelist)
% %                imname = ['images/' filelist(i).name];
% %                nextim = imread(imname);
% %       . . .
% %       end
% 
% load cifar-10-batches-mat/data_batch_1.mat
% % load batches.meta.mat
% 
% %% convert training dataset of cifar10 
% X = reshape(data', [32, 32, 3, 10000]);
% X = permute(X, [2 1 3 4]);
% Y = labels + 1;
% 
% save cifar10-test X Y
% %% preview one picture
% figure;
% imshow(imresize(X(:,:,:,2), [128, 128]))
% 
% load cifar-10-batches-mat/test_batch.mat
% test = reshape(data', [32, 32, 3, 10000]);
% test = permute(test, [2 1 3 4]);
% test_label = labels + 1;
% 
% figure; 
% imshow(imresize(test(:,:,:,2), [128, 128]))
% 
% A=zeros([32 32 3 n]);
% for i = 1:n
% % use first 30 ...
% R=train(i,1:1024); % first row = first image 
% G=train(i,1025:2048);
% B=train(i,2049:3072);
% 
% A(:,:,1,i)=reshape(R,32,32);
% A(:,:,2,i)=reshape(G,32,32);
% A(:,:,3,i)=reshape(B,32,32); % this is of data type double 
% 
% end
% figure;
% subplot(1,2,1)
% imshow(imresize(uint8(A(:,:,:,1)), [128, 128]))
% subplot(1,2,2)
% imshow(imresize(uint8(A(:,:,:,4)), [128, 128]))
% 
% for i=1:n
% figure; 
% imshow(imresize(traind(:,:,:,i), [128, 128]))
% end
% 
% [IDX,D] = knnsearch(X,Y)
% 
% for i = 1:n
%     for j = 1:n
% 
% [class] = KNNClassifier( train, test(i,:), knn, y_train) % check one test sample against all training samples 
% 
% 
%     end
% end
% 
% % load cifar-10-batches-mat/test_batch.mat
% load cifar-10-batches-mat/data_batch_1.mat
% load cifar-10-batches-mat/batches.meta.mat
% size(data)
%    
% n=30;
% A=zeros([32 32 3 n]);
% 
% for i = 1:n
% % use first 30 ...
% R=data(i,1:1024); % first row = first image 
% G=data(i,1025:2048);
% B=data(i,2049:3072);
% 
% A(:,:,1,i)=reshape(R,32,32);
% A(:,:,2,i)=reshape(G,32,32);
% A(:,:,3,i)=reshape(B,32,32); % this is of data type double 
% 
% end
% 
% i=30
% figure; 
% subplot(1,2,1)
% imshow(uint8(A(:,:,:,i))) % to imshow/image, must convert from double to uint8 
% subplot(1,2,2)
% imagesc(uint8(A(:,:,:,i)))
% 
% 
% img = A(:,:,:,i);


