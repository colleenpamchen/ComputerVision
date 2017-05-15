%% detect_template_ssd.m 
img = imread('dilbert1.jpg');
A = im2double(img);

train = A(50:50+16, 373:373+14); 
figure; imagesc(train)

response = conv2(A,train,'same');
figure;imagesc(response);
I=A;
T=train;

IT = conv2(I,T);
Tsquared = sum(sum(T.^2));
Isquared = conv2(I.^2,ones(size(T)));
squareddiff = (Isquared - 2*IT + Tsquared);
figure; imagesc(squareddiff)
squareddiff = -(squareddiff);

[i,j]=find(squareddiff==max(squareddiff(:)));

figure, imshow(A); hold on; 
rectangle('position',[j i 20 20],'curvature',[1,1],'edgecolor','r','linewidth',2);

