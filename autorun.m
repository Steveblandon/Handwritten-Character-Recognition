%initial setup, variables must be set up for other scripts to work
inputLayerSize = 784;
hiddenLayerSize = 20;
outputLayerSize = 10;
sampleCount = 8;
learningRate = 0.1;
batchSize = 4;
epochs = 1;


%create 3-layer neural network
[w1, b1, w2, b2] = createNet([inputLayerSize hiddenLayerSize outputLayerSize]);

%load data
[trainingSet, testingSet] = loadData(inputLayerSize);


%train neural network
trainingSet = trainingSet(1:sampleCount,1:inputLayerSize+1);
[w1,b1,w2,b2] = SGD(trainingSet, epochs, batchSize, learningRate, 
inputLayerSize, outputLayerSize, w1, b1, w2, b2);


%feed forward network [check]
%in = trainingSet(1:4,1:inputLayerSize);
%[a, a_h] = feedForward(in,w1,b1,w2,b2);