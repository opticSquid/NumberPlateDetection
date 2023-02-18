function [mserRegions,mserConnComp] = DetectTextRegionsMESR(bwImg)
%DETECTTEXTREGIONSMESR Detecting text features in an image using 
% built-in detectMSERFeatures function does almost the job but some 
% unwanted areas also get selected 
% threshold value is kept 15 by trying on different scenarios it becomes a
% bit slow but increases accuracy significantly
[mserRegions, mserConnComp] = detectMSERFeatures(bwImg, 'RegionAreaRange',[200 8000],'ThresholdDelta',10);
end

