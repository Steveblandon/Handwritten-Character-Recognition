function output = feedForwardNN(Vin, Mw1, Vb1, n, Mw2, Vb2, m)
% this is a MLP, only one hidden layer (i.e. 3 layers)
% input:   Vin = input Neurons Vector
%          Mw1 = weights between input layer and hidden layer matrix
%          Vb1 = bias weights between input layer and hidden layer vector
%          n = number of hidden nuerons
%          Mw2 = weights between hidden layer and output layer matrix
%          Vb2 = bias weights between hidden layer and output layer
%          m = number of output neurons

% make sure parameters are correct
if (size(Vin,1) > 1 && size(Vin,2) == 1) Vin = Vin'; end
if (size(Vin,1) ~= 1)
  disp('input needs to be a vector');
  return;
end
if (size(Vb1,1) > 1 && size(Vb1,2) == 1) Vb1 = Vb1'; end
if (size(Vb1,1) ~= 1)
  disp('Vb1 needs to be a vector');
  return;
end
if (size(Vb2,1) > 1 && size(Vb2,2) == 1) Vb2 = Vb2'; end
if (size(Vb2,1) ~= 1)
  disp('Vb2 needs to be a vector');
  return;
end
if (length(Vb1) ~= n)
  disp('invalid Vb1');
  return;
end
if (length(Vb2) ~= m)
  disp('invalid Vb2');
  return;
end
if (sum(size(Mw1) == [length(Vin) n]) ~= 2)
  disp('invalid Mw1 matrix dimensions');
  return;
end
if (sum(size(Mw2) == [n m]) ~= 2)
  disp('invalid Mw2 matrix dimensions');
  return;
end

% calculate hidden layer output a = Vin * Mw1
output = sigmoid((Vin * Mw1) + Vb1);
output = sigmoid((output * Mw2) + Vb2);