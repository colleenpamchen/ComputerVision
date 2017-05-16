function [h1,v1,h2,v2,h4,v4,g42,g21] = filterBank(imageData)

[h1, v1] = computeDerivImages(imageData,1);
[h2, v2] = computeDerivImages(imageData,2);
[h4, v4] = computeDerivImages(imageData,4);
g42 = computeGaussDiff(imageData,1,2);
g21 = computeGaussDiff(imageData,2,4);

figure
subplot(2,4,1)
imshow(h1,[])
title('Horiz,sigma=1');

subplot(2,4,2)
imshow(h2,[])
title('Horiz,sigma=2');

subplot(2,4,3)
imshow(h4,[])
title('Horiz,sigma=4');

subplot(2,4,4)
imshow(g42,[])
title('G_4-G_2');

subplot(2,4,5)
imshow(v1,[])
title('Vert,sigma=1');

subplot(2,4,6)
imshow(v2,[])
title('Vert,sigma=2');

subplot(2,4,7)
imshow(v4,[])
title('Vert,sigma=4');

subplot(2,4,8)
imshow(g21,[])
title('G_2-G_1');


end


