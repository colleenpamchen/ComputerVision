%% Homework 2 DFT #5 

fs = 10000;
t = 0:1/fs:1.5;
x1 = square(2*pi*10*t);
x2 = square(2*pi*20*t);
subplot(2,1,1)
plot(t,x1)
xlabel('Time (sec)')
ylabel('Amplitude') 
title('Square Periodic Wave')
subplot(2,1,2)
plot(t,x2)
xlabel('Time (sec)')
ylabel('Amplitude')
title('Square Periodic Wave')


m2=abs(fftshift(fft(x2)));
m1=abs(fftshift(fft(x1)));

figure;
subplot(2,1,1)
plot(t,m2)
subplot(2,1,2)
plot(t,m1)
title('Magnitude')

%% gaussians w sigma 1, 2 

x = 0:0.1:10;
y = normpdf(x,5,1);
subplot(2,1,1)
plot(x,y)
xlabel('sigma=1')

y2 = normpdf(x,5,2);
subplot(2,1,2)
plot(x,y2)
xlabel('sigma=2')

m1=abs(fftshift(fft(y)));
m2=abs(fftshift(fft(y2)));

figure;
subplot(2,1,1)
plot(x,m1)
subplot(2,1,2)
plot(x,m2)
title('Magnitude')


%% 2D DFT 
img1 = imread('dilbert1.jpg');
img2 = rgb2gray(imread('zebra1.jpg'));
img3 = rgb2gray(imread('zebra2.jpg'));
img4 = rgb2gray(imread('simpsons.jpg'));

img1=imresize(img1,[200,700]);
img2=imresize(img2,[550,700]);
img3=imresize(img3,[550,700]);
img4=imresize(img4,[550,700]);

subplot(1,2,1)
imagesc(img2); 

img1=img2; 
temp1 = zeros(size(img1)); 
f1 =  zeros(size(img1)); 
[n m]=size(img1); 
for i = (1:m)
    temp1(:,i) = fft(img1(:,i));
end

for j = (1:n)
    f1(j,:) = fft(temp1(j,:));
end
m1 = abs(f1);                               % Magnitude
p1 = unwrap(angle(f1));                     % Phase

subplot(1,2,2)
imagesc(img3);
img2=img3; 
temp2 = zeros(size(img2)); 
f2 =  zeros(size(img2)); 
[n m]=size(img2); 
for i = (1:m)
    temp2(:,i) = fft(img2(:,i));
end

for j = (1:n)
    f2(j,:) = fft(temp2(j,:));
end
m2 = abs(f2);                               % Magnitude
p2 = unwrap(angle(f2));                     % Phase

figure; plot(m2)

% m2 p1
img3=zeros(n,m); 
temp3 = zeros(size(img1)); 
for i = (1:m)
    temp3(:,i) = ifft(m2(:,i));
end
for j = (1:n)
    f3(j,:) = ifft(temp3(j,:));
end

temp4 = zeros(size(img1)); 
for i = (1:m)
    temp4(:,i) = ifft(p1(:,i));
end
for j = (1:n)
    f4(j,:) = ifft(temp4(j,:));
end

% plot(abs(f3));
% imagesc(abs(f3));
imshow(abs(f3));

