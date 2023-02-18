function [text] = DetectText(grayImage,textBBoxes)
%DETECTTEXT Detects the text from the given textbox coordinates
ocrtxt = ocr(grayImage, textBBoxes);
text = [ocrtxt.Text];
end

