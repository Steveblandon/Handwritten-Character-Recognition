function y = getY(labels, outputSize)

len = length(labels);
y = zeros(outputSize, len);
for i=1:len
  y(labels(i),i) = 1;
end