function [class] = KNNClassifier( train, test, knn, y_train) 
% Colleen Chen
% this function classifies the ith-subject using K-Nearest Neighbor method 
% take the difference between the test point and training data points, sort
% and find the most frequent index of the lowest difference. These
% will be the nearest neighbors, then put a mask on the knn number of
% neighbors to compare and vote for the class. 

% % attach the class label to training data
% training(:,2) = y; 
% 
% % compute difference between training data with test point
% difference = abs(training - test);
% 
% % sort the differences in increasing order and store the array index.
% % because we will need the original indices later to get the neighbors. 
% [~, index] = sort(difference);
% 
% % prescribing a "mask" or boundary for defining the neighbors
% neighbors = training(index(1:knn));
% % now use the mode() function to find the most frequent class label for
% % these neighbors
% class = mode(training(index(1:knn),2)) ; 




% attach the class label to training data
% training(:,:,1) = y'; 

% compute difference between training data with test point
difference = abs(train - test);

l1_dist = sum(difference,2); 



% pdist( , 'spearman')

% sort the differences in increasing order and store the array index.
% because we will need the original indices later to get the neighbors. 
[~, index] = sort(l1_dist); 

% prescribing a "mask" or boundary for defining the neighbors
neighbors = train(index(1:knn),:);
% now use the mode() function to find the most frequent class label for
% these neighbors
class = mode(y_train(index(1:knn))) ; 





end