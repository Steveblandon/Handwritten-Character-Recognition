function [w1,b1,w2,b2] = SGD(trainingSet, epochs, batchSize, rate, 
inputLayerSize, outputLayerSize, w1, b1, w2, b2)

for i=1:epochs
  % shuffle data
  trainingSet = trainingSet(randperm(size(trainingSet,1)),:);
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
    [a, a_h] = feedForward(batch,w1,b1,w2,b2);
    delta = (a - y).*(a.*(1-a));
    delta_h = (w2*delta).*(a_h.*(1-a_h));
    w2 = w2 - ((rate/batchSize)*a_h*delta');
    b2 = b2 - ((rate/batchSize)*delta');
    w1 = w1 - ((rate/batchSize)*batch'*delta_h');
    b1 = b1 - ((rate/batchSize)*delta_h');
    clear batch labels y;
    disp(['batch ' num2str(i2) ' processed']);
  end
  
end