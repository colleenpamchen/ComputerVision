% THIS SCRIPT will call 1) hog.m and return an orientation histogram
% 'ohist' as variable f. 
% 2) then call function detect.m which will use the patch template generated from ohist to 
% to cross correlate with test image and return [x,y] corrdiates of
% spectified number of detections. 

% load a training example image
Itrain = im2double(rgb2gray(imread('test1.jpg')));

%have the user click on some training examples.  
% If there is more than 1 example in the training image (e.g. faces), you could set nclicks higher here and average together
nclick = 1;
figure(1); clf;
imshow(Itrain);
[x,y] = ginput(nclick); %get nclicks from the user

%compute 8x8 block in which the user clicked
blockx = round(x/8);
blocky = round(y/8); 

% COMPUTE the template from user click: 
% the following code assumes the template is 128x128 pixels  
%   (16x16 hog blocks) so you will want to eventually modify
%   it to handle different sized templates.
%

%visualize image patches that the user clicked on
figure(2); clf;
for i = 1:nclick
  patch = Itrain(8*blocky(i)+(-63:64),8*blockx(i)+(-63:64));
  figure(2); subplot(3,2,i); imshow(patch);
end

% compute the hog features
f = hog(Itrain);

figure(3); clf; 
for i=1:size(f,3)
figure(3); subplot(3,3,i); imagesc(f(:,:,i))
end

% compute the average template for where the user clicked
template = zeros(16,16,9);
for i = 1:nclick
  template = template + f(blocky(i)+(-7:8),blockx(i)+(-7:8),:); 
end
template = template/nclick;
 
% for i=1:size(template,3)
% figure; imagesc(template(:,:,i))
% end
%
% load a test image
%
Itest= im2double(rgb2gray(imread('test2.jpg')));


% find top 5 detections in Itest
ndet = 5;
[x,y,score] = detect(Itest,template,ndet);

%display top ndet detections
figure(4); clf; imshow(Itest);
for i = 1:ndet
  % draw a rectangle.  use color to encode confidence of detection
  %  top scoring are green, fading to red
  hold on; 
  h = rectangle('Position',[x(i)-64 y(i)-64 128 128],'EdgeColor',[(i/ndet) ((ndet-i)/ndet)  0],'LineWidth',3,'Curvature',[0.3 0.3]); 
  hold off;
end
