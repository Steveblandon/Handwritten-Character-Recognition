function [w1,b1,w2,b2,best] = SGD(trainingSet, testingSet, test, epochs, batchSize, rate, 
inputLayerSize, outputLayerSize, w1, b1, w2, b2)

for i=1:epochs
  % shuffle data
  %trainingSet_ = trainingSet(randperm(size(trainingSet,1)),:);
  
  %partition set into batches
  setSize = size(trainingSet,1);
  batches  = setSize/batchSize;
  for i2=1:batches
    batch_start = 1 + ((i2-1)*batchSize);
    batch_end = (i2*batchSize);
    if (batch_end > setSize)
      batch_end = setSize;
    end
    batchSize = batch_end - batch_start + 1;
    batch = trainingSet(batch_start:batch_end, 1:inputLayerSize);
    labels = trainingSet(batch_start:batch_end, inputLayerSize+1);
    y = getY(labels,outputLayerSize);
    
    %calculate errors
    [a, a_h] = feedForward(batch,w1,b1,w2,b2);
    delta = (a - y).*(a.*(1-a));
    delta_h = (w2*delta).*(a_h.*(1-a_h));
    
    %take a gradient step
    w2 = w2 - ((rate/batchSize)*a_h*delta');
    b2 = b2 - ((rate/batchSize)*sum(delta'));
    w1 = w1 - ((rate/batchSize)*batch'*delta_h');
    b1 = b1 - ((rate/batchSize)*sum(delta_h'));
    
    clear batch labels y a a_h delta delta_h;
  end
  
  %test neural network after each epoch to see if its improving
  if (test)
    labels = testingSet(:,inputLayerSize+1);
    setSize = size(testingSet,1);
    a = feedForward(testingSet(:,1:inputLayerSize),w1,b1,w2,b2);
    count = sum(classify(a) == labels');
    best = count/setSize;
    disp(['epoch ' num2str(i) ': ' num2str(count) '/' num2str(setSize)]);
    fflush(stdout);
  end
  
  clear labels a;
end