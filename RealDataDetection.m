% calls all the images in the real life dataset to perform detection
for i=1:27
    s = ['Images/HigherLevel/Datacluster_number_plates (',num2str(i),').jpg'];
    noPlate  = Plate_detection(s);
    disp("For sample: "+i+" Detected number: "+noPlate);
end