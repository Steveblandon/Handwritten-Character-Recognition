function [labels images] = MNISTDecoder(labelsFile, ImagesFile)

fid = fopen(labelsFile,'r','b');
if (fread(fid, 1, 'int32') ~= 2049), 
  disp('wrong labels file')
  return
end
count = fread(fid, 1, 'int32');
labels = fread(fid, count, 'char');
fclose(fid);


fid = fopen(ImagesFile,'r','b');
if (fread(fid, 1, 'int32') ~= 2051)
  disp('wrong images file')
  return
end
if (fread(fid, 1, 'int32') ~= count)
  disp('images file is incompatible with labels file, check sizes')
  return
end

w = fread(fid, 1, 'int32');
h = fread(fid, 1, 'int32');
images = fread(fid, inf, 'uint8');
images = reshape(images, [count w*h]); 
#uncomment line below to rescale pixel values to be between 0 and 1
#images = double(images) / 255;
fclose(fid);