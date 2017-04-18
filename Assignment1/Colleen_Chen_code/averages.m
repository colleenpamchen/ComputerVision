% averages.m 
% [] Compute the average image in grayscale. 
% [] resize each image to a fixed size (I suggest 300x215) "imresize" command.
% Compute the average image in color, by averaging per RGB channel.
% Compute the average image in color, but 
% [] randomly (with probability 0.5) mirror-flip each image horizontally before including it in the average.
% Display each of the above averages in your writeup for each image set (so six final images in total). In your write-up, briefly explain the results - why do the results from step (2) and (3) look different?
clc; close all; 

I=[];
color=[];
mfcolor = []; 

filelist = dir('images/avg/set1/*.jpg');
for i=1:length(filelist)
    imname = ['images/avg/set1/' filelist(i).name];
    nextim = imread(imname);
    
    A = imresize(nextim,[215 300]) ;
    color(:,:,:,i)= A ; 

    if randi(3)>1
        mfcolor(:,:,:,i) = fliplr(A)  ;
%         figure;
%         imshow(uint8(mfcolor(:,:,:,i)));
    end
    mfcolor(:,:,:,i) = A ;

    I(:,:,i) = rgb2gray(A);     
    %         imshow(uint8(I(:,:,i)))

end

      avgI = mean(I,3);
      figure;
      imshow(uint8(avgI));
      title('averaged gray scale image')
      avgI=uint8(avgI); 
      imwrite(avgI,'avg-gray.jpg')
      
      avgColor = mean(color,4); 
      figure; 
      imshow(uint8(avgColor));
      title('averaged RGB image')
      avgColor=uint8(avgColor); 
      imwrite(avgColor,'avg-rgb.jpg')
      
      
      flipColor = mean(mfcolor,4);
      figure;
      imshow(uint8(flipColor));
      title('averaged mirror flipped image')
      flipColor=uint8(flipColor);
      imwrite(flipColor,'avg-mf.jpg')
      
      
%%

I=[];
color=[];
mfcolor = []; 

filelist = dir('images/avg/set2/*.jpg');
for i=1:length(filelist)
    imname = ['images/avg/set2/' filelist(i).name];
    nextim = imread(imname);
    
    A = imresize(nextim,[215 300]) ;
    color(:,:,:,i)= A ; 

    if randi(3)>1
        mfcolor(:,:,:,i) = fliplr(A)  ;
%         figure;
%         imshow(uint8(mfcolor(:,:,:,i)));
    end
    mfcolor(:,:,:,i) = A ;

    I(:,:,i) = rgb2gray(A);     
    %         imshow(uint8(I(:,:,i)))

end

      avgI = mean(I,3);
      figure;
      imshow(uint8(avgI));
      avgI = uint8(avgI);
      title('averaged gray scale image')
      imwrite(avgI,'avg-gray-plane.jpg')
      
      avgColor = mean(color,4); 
      figure; 
      imshow(uint8(avgColor));
      title('averaged RGB image')
      avgColor=uint8(avgColor);
      imwrite(avgColor,'avg-rgb-plane.jpg')
      
      
      flipColor = mean(mfcolor,4);
      figure;
      imshow(uint8(flipColor));
      title('averaged mirror flipped image')
      flipColor=uint8(flipColor); 
      imwrite(flipColor,'avg-mf-plane.jpg')
      
      