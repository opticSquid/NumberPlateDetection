for i=1:15
    % creates the image file name
    img = ['./Images/image',num2str(i),'.jpg'];
    % converts the image to black and white and binary versions
    % and resizes them to 400x400 size
    [bnImg,grayImg] = (Color2binAndResize(img));
    % does basic detection of text regions 
    % gives rough coordinates of texts and related stats
    [mserRegions,mserConnComp]=DetectTextRegionsMESR(grayImg);
    % detections are fine tuned here
    % coordinates are more fine tuned here and stats are also fine tuned
    [mserRegions,mserStats] = RefiningDetectionWithRegionProps(mserRegions,mserConnComp);
    % This is a method under test so commented out
%     [mserRegions,mserStats] = DetectTextWithStrokeWidthVariation(mserRegions,mserStats);
    % all the text regions are drawn over the picture with boxes
    [expandedBBoxes,IExpandedBBoxes,xmax,xmin,ymax,ymin] = MergeTextRegions(grayImg,mserStats);
    % all the overlaping small boxes are made into a 
    % large box resembling a word and also gives 
    % proper coordinates of texts
    [textBBoxes,ITextRegion] = ReduceTextBoxOverlap(grayImg,expandedBBoxes,xmax,xmin,ymax,ymin);
    subplot(5,3,i);
    % images are displayed here
    imshow(ITextRegion);
    % text finally detected from images and printed 
    % in console here.
    text = DetectText(grayImg,textBBoxes);
    disp("Image"+i+": "+text);
end 

