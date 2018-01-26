function  class  = KNN_Classifier(Training,Sample,k)

%Get last column of Training matrix that contains the class labels
classVector = Training(:,end);
%Create a classLabel that holds the unique values in classVector vector
classLabel = unique(classVector);
%Get total number of Training patterns
totalPatterns = size(Training,1);
%Repeat Sample vector totalPatterns times
testMatrix = repmat(Sample,totalPatterns,1);

%Euclidean distance%
%Calculate the difference between the Sample pattern and each pattern in
%the Training matrix, square the difference
sqrDiff = (Training(:,1:end-1) - testMatrix).^2;
%Get the square root of the difference matrix after sum it
dist = sqrt(sum(sqrDiff,2));

%Sort the distance vector and get the index of the k minimum distances
[~,I] = sort(dist);
neighborsIndex = I(1:k);
%Get the neighborsIndex values of classVector
neighbors = classVector(neighborsIndex);

%Create a Temp matrix which the first column holds the class labels and the
%second holds the frequencies of these labels to determine the major class
Temp = [classLabel,histc(neighbors,classLabel)];
%Get maximum value of the second column (Frequencies) of Temp matrix and 
%return the row index (I) that contains this value
[~,I] = max(Temp(:,2));
%The class of the Sample will be in the row (I) and first column (class
%labels) of the Temp matrix 
class = Temp(I,1);

end

