% calls all the images in the sample dataset to perform detection
for i=1:14
    s = ['Images/image',num2str(i),'.jpg'];
    noPlate = Detect(s);
    disp("Detected number: "+noPlate);
end
