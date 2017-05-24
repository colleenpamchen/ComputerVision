function [mag,ori] = mygradient(I)
%
% compute image gradient magnitude and orientation at each pixel
%

h = [1 -1];
v = [1;-1];

dx = imfilter(I,h);
dy = imfilter(I,v); 
complexImage = dx + dy*sqrt(-1) ;

mag = abs(complexImage);
ori = angle(complexImage);

end
