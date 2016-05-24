function output = identify(sample, w1,b1,w2,b2)
a = feedForward(sample,w1,b1,w2,b2);
output = ["is it a " num2str(classify(a)) "?"];