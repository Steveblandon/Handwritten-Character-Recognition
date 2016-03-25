function out = sigmoid(in)
%input : in = vector or single integer
n = length(in);
out = zeros(1, n);
for i=1:n
  out(i) = 1.0 / (1.0 + exp(-in(i)));
end