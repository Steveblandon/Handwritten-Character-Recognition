# Handwritten-Character-Recognition
A handwritten character recognition system using a 3-layer neural network learning with SGD and back-propagation. Has an Octave/Matlab learning component and an android application component.

MNISTDecoder.m
how to use MNISTDecoder:
[labels images] = MNISTDecoder(labelsfile, correspondingImagesFile);
output : labels is a vector of size n samples
output : images is a matrix of size n samples by m features (since MNIST images are 28by28, m would be 784)
