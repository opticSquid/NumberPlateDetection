function [expandedBBoxes,IExpandedBBoxes,xmax,xmin,ymax,ymin] = MergeTextRegions(grayImage,mserStats)
%MERGETEXTREGIONS Summary of this function goes here
%   Detailed explanation goes here
% Get bounding boxes for all the regions
bboxes = vertcat(mserStats.BoundingBox);

% Convert from the [x y width height] bounding box format to the [xmin ymin
% xmax ymax] format for convenience.
xmin = bboxes(:,1);
ymin = bboxes(:,2);
xmax = xmin + bboxes(:,3) - 1;
ymax = ymin + bboxes(:,4) - 1;

% Expand the bounding boxes by a small amount.
expansionAmount = 0.02;
xmin = (1-expansionAmount) * xmin;
ymin = (1-expansionAmount) * ymin;
xmax = (1+expansionAmount) * xmax;
ymax = (1+expansionAmount) * ymax;

% Clip the bounding boxes to be within the image bounds
xmin = max(xmin, 1);
ymin = max(ymin, 1);
xmax = min(xmax, size(grayImage,2));
ymax = min(ymax, size(grayImage,1));

% Show the expanded bounding boxes
expandedBBoxes = [xmin ymin xmax-xmin+1 ymax-ymin+1];
IExpandedBBoxes = insertShape(grayImage,'rectangle',expandedBBoxes,'LineWidth',3);

% figure
% imshow(IExpandedBBoxes)
title('Detected Text Region')
end

