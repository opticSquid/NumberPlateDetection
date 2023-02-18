for i=1:15
    img = ['./Images/image',num2str(i),'.jpg'];
    [bnImg,grayImg] = (Color2binAndResize(img));
    [mserRegions,mserConnComp]=DetectTextRegionsMESR(grayImg);
    [mserRegions,mserStats] = RefiningDetectionWithRegionProps(mserRegions,mserConnComp);
    [expandedBBoxes,IExpandedBBoxes,xmax,xmin,ymax,ymin] = MergeTextRegions(grayImg,mserStats);
    [textBBoxes,ITextRegion] = ReduceTextBoxOverlap(grayImg,expandedBBoxes,xmax,xmin,ymax,ymin);
    subplot(5,3,i);
    imshow(ITextRegion);
    text = DetectText(grayImg,textBBoxes);
    disp("Image"+i+": "+text);
end 

