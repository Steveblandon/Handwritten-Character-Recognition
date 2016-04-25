%simply run the script to save the neural net currently in the workspace

dir = "neuralNets";
if (!exist(dir))
  mkdir(dir);
end
filePath = [dir "/neuralNet"];
path = "";
i = 0;
while(true)
  clear path;
  path = [filePath num2str(i)];
  if(!exist(path))
    break;
  end
  i++;
end

parameters = {["accuracy:" num2str(best)],w1,b1,w2,b2};

save(path,"parameters");