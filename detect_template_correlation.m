%% detect_template_correlation.m 
img = imread('dilbert1.jpg');
A = im2double(img);

figure; imagesc(A);


figure;imagesc(A(48:48+10, 371:371+20 ))

B=imfilter(A,H)


L = (x(2:end-1) > x(1:end-2)) % bigger than our neighbor to the left?
R = (x(2:end-1) > x(3:end)) % bigger than our neighbor to the right?
T = x(2:end-1) > threshold %above detection threshold?
maxima = R & L & T


%fliplr/flipud

% conv2('same') 

% take derivative with respect to time 
% computational motion model
% velocity from image to real world and vice versa
% heading toward the wall, z (distance between the camera to the wall), the
% value of z would decrease as you get closer to the wall 
% reihart detector 
% with dvs video, if edge moving along at some velocity 
% v = dx/dt, dy/dt   as edge sweeps across sensor, 



