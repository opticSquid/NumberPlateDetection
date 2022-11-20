% calls all the images in the sample dataset to perform detection
for i=1:15
    s = ['Images/image',num2str(i),'.jpg'];
    noPlate = Plate_detection(s);
    disp("For sample: "+i+" Detected number: "+noPlate);
end