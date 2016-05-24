clear;
%initial setup, variables must be set up for other scripts to work
inputLayerSize = 784;
hiddenLayerSize = 100;
outputLayerSize = 10;
sampleCount = 0;            %set to zero to run entire training set
learningRate = 3;
batchSize = 20;
epochs = 5;
runTest = true;

%create 3-layer neural network
disp(["creating a new neural network of size: " num2str(inputLayerSize) "-" num2str(hiddenLayerSize) "-" num2str(outputLayerSize)]);
disp(["learning rate: " num2str(learningRate)]);
fflush(stdout);
[w1, b1, w2, b2] = createNet([inputLayerSize hiddenLayerSize outputLayerSize]);

%load data
disp("loading MNIST database...");
fflush(stdout);
[testingSet, trainingSet] = loadData(inputLayerSize);


%train neural network
if (sampleCount > 0)
  trainingSet = trainingSet(1:sampleCount,1:inputLayerSize+1);
end
disp("commencing training:");
fflush(stdout);
[w1,b1,w2,b2,best] = SGD(trainingSet, testingSet, runTest, epochs, batchSize, learningRate, 
inputLayerSize, outputLayerSize, w1, b1, w2, b2);


%feed forward network [check]
%in = trainingSet(1:4,1:inputLayerSize);
%[a, a_h] = feedForward(in,w1,b1,w2,b2);