function a = feedForward(in, w1, b1, w2, b2)
%feeds forward an input, returns the output layer's activation value vector

a = sigmoid(in*w1 + b1);
a = sigmoid(a*w2 + b2)';