%% detect_edge.m 

img = imread('dilbert1.jpg');
A = im2double(img);


h = [1 zeros(1,20) 0.5 zeros(1,10)];
x = [0 1:10 5.*ones(1,5) zeros(1,40)];
y = conv(x,h);



% conv2('same') 
