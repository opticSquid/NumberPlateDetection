function [mserRegions,mserStats] = RefiningDetectionWithRegionProps(mserRegions,mserConnComp)
%REFININGDETECTIONWITHREGIONPROPS Summary of this function goes here
%   Detailed explanation goes here
% Use regionprops to measure MSER properties
mserStats = regionprops(mserConnComp, 'BoundingBox', 'Eccentricity', ...
    'Solidity', 'Extent', 'Euler', 'Image');
% Compute the aspect ratio using bounding box data.
bbox = vertcat(mserStats.BoundingBox);
w = bbox(:,3);
h = bbox(:,4);
aspectRatio = w./h;

% Threshold the data to determine which regions to remove. These thresholds
% may need to be tuned for other images.
filterIdx = aspectRatio' > 1; 
filterIdx = filterIdx | [mserStats.Eccentricity] > .995 ;
filterIdx = filterIdx | [mserStats.Solidity] < .3;
filterIdx = filterIdx | [mserStats.Extent] < 0.2 | [mserStats.Extent] > 0.9;
filterIdx = filterIdx | [mserStats.EulerNumber] < -2;

% Remove regions
mserStats(filterIdx) = [];
mserRegions(filterIdx) = [];

% Show remaining regions
% figure
% imshow(I)
% hold on
% plot(mserRegions, 'showPixelList', true,'showEllipses',false)
% title('After Removing Non-Text Regions Based On Geometric Properties')
% hold off
end

