function [w1,b1,w2,b2, accuracy] = loadNet(filename)
%neural net to be loaded needs to be in the neuralNets directory
filePath = ["neuralNets/" filename];
load(filePath);
accuracy = parameters{1};
w1 = parameters{2};
b1 = parameters{3};
w2 = parameters{4};
b2 = parameters{5};