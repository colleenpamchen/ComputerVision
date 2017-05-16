function [resp,meanResp,imagePatch] = filterDistribution( imageData,centerX,centerY,radius )

imagePatch = imageData( (centerY-radius/2):(centerY+radius/2),(centerX-radius/2):(centerX+radius/2) );

resp = zeros(radius+1,radius+1,8);
[resp(:,:,1),resp(:,:,2),resp(:,:,3),resp(:,:,4),resp(:,:,5),resp(:,:,6),resp(:,:,7),resp(:,:,8)] = ...
filterBank(imagePatch);

meanResp = zeros(1,8);
for i=1:8
    meanResp(i) = mean(mean(abs(resp(:,:,i))));
end

    figure
    bar(meanResp);
    set(gca,'XTickLabel',{'Horiz_Sigma1', 'Vert_Sigma1',...
        'Horiz_Sigma2', 'Vert_Sigma2', 'Horiz_Sigma4',...
        'Vert_Sigma4', 'Sigma4-Sigma2', 'Sigma2-Sigma1'});
    ylabel('Response');


end