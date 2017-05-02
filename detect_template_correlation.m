%% detect_template_correlation.m 
img = imread('dilbert1.jpg');
A = im2double(img);

figure; imagesc(A);
% manually crop out an object as the training set 
train = A(48:48+20, 371:371+50); 
figure;imagesc(train)
[n,m]=size(train);

B = imfilter(A,train);

figure;imagesc(B); 
colormap default

c = normxcorr2(train,A);
figure; imagesc(c); colormap default
[max_c, imax] = max(abs(c(:)));
[ypeak, xpeak] = ind2sub(size(c),imax(1));
corr_offset = [(xpeak-size(train,2)) (ypeak-size(train,1))];
figure, imshow(A); hold on; 
rectangle('position',[corr_offset(1) corr_offset(2) 50 50],'curvature',[1,1],'edgecolor','r','linewidth',2);


