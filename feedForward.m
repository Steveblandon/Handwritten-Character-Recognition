function [a,a_h]  = feedForward(in, w1, b1, w2, b2)
%input: sample(s) and a neural network's weights
%output: output layer's activation values, additionally the hidden layer's if needed

a_h = sigmoid(in*w1 + b1);
a = sigmoid(a_h*w2 + b2)';
a_h = a_h';