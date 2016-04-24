function a = sigmoid(in)
%input : input vector or matrix (can handle multiple samples)
%output: activation value (as a vector or matrix, depending on input)

a = 1 + exp(-in);
a = a.^-1;
