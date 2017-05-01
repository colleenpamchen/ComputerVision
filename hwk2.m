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


m2=abs(fft(x2));
m1=abs(fft(x1));

figure;
subplot(2,1,1)
plot(t,m2)
title('Magnitude')
subplot(2,1,2)
plot(t,m1)
title('Magnitude')

%% gaussians w sigma 1, 2 

x = 0:0.1:10;
y = normpdf(x,5,1);
subplot(2,1,1)
plot(x,y)
xlabel('sigma=2')

y2 = normpdf(x,5,2);
subplot(2,1,2)
plot(x,y2)
xlabel('sigma=1')

m1=abs(fft(y));
m2=abs(fft(y2));

figure;
subplot(2,1,1)
plot(x,m1)
subplot(2,1,2)
plot(x,m2)
title('Magnitude')


%%
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
for i = (1:m)
    temp3(:,i) = ifft(m2(:,i));
end

for j = (1:n)
    f3(j,:) = ifft(temp3(j,:));
end

plot(abs(f3));
imagesc(abs(f3));
imshow(abs(f3));


%%

f1 = (0:length(y)-1)*100/length(y);        % Frequency vector

subplot(2,1,1)
plot(f1,m)
title('Magnitude')
ax = gca;
ax.XTick = [15 40 60 85];

subplot(2,1,2)
plot(f1,p*180/pi)
title('Phase')
ax = gca;
ax.XTick = [15 40 60 85];

n = 512;
y = fft(x,n);
m = abs(y);
p = unwrap(angle(y));
f1 = (0:length(y)-1)*100/length(y);

subplot(2,1,1)
plot(f1,m)
title('Magnitude')
ax = gca;
ax.XTick = [15 40 60 85];

subplot(2,1,2)
plot(f1,p*180/pi)
title('Phase')
ax = gca;
ax.XTick = [15 40 60 85];

t = 0:1/255:1;
x = sin(2*pi*120*t);
y = real(ifft(fft(x)));

figure
plot(t,x-y)


