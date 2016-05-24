function output = getAccuracy(testingSet,w1,b1,w2,b2)

inputLayerSize = 784;
labels = testingSet(:,inputLayerSize+1);
setSize = size(testingSet,1);
a = feedForward(testingSet(:,1:inputLayerSize),w1,b1,w2,b2);
count = sum(classify(a) == labels');
accuracy = (count/setSize)*100;
output = [num2str(accuracy) '%' '     error rate:' num2str(100-accuracy) '%'];
