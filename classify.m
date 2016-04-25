function out = classify(a)
%input: activation values matrix (or vector if its just one sample)
%output: vector of indices corresponding to each class

[val out] = max(a);