function [testingSet, trainingSet] = loadData(inputLayerSize)
%this function decodes and loads MNIST data
%each set has 784 features, the 785th column is the class each sample belongs to
trainingSet = 'MNIST/train-images-idx3-ubyte';
trainingSetLabels = 'MNIST/train-labels-idx1-ubyte';
testingSet = 'MNIST/t10k-images-idx3-ubyte';
testingSetLabels = 'MNIST/t10k-labels-idx1-ubyte';

if (!(exist(trainingSet)*exist(trainingSetLabels)*
exist(testingSet)*exist(testingSetLabels))) 
  disp('ERROR: missing data files'); 
  return;
end

[xinput, ylabel] = MNISTDecoder(trainingSet,trainingSetLabels);
clear trainingSet trainingSetLabels;
trainingSet = [xinput ylabel];
clear xinput ylabel;

[xinput, ylabel] = MNISTDecoder(testingSet,testingSetLabels);
clear testingSet testingSetLabels;
testingSet = [xinput ylabel];
clear xinput ylabel;

%each sample's label should be an index, since its just digits only 0 needs 
%to be changed to 10 since matrices are 1-indexed.
labels = trainingSet(:,inputLayerSize+1);
labels(labels == 0) = 10;
trainingSet(:,inputLayerSize+1) = labels;
clear labels;
labels = testingSet(:,inputLayerSize+1);
labels(labels == 0) = 10;
testingSet(:,inputLayerSize+1) = labels;
clear labels;