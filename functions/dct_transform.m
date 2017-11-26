function [ image_dct ] = dct_transform( image )
% DCT_TRANSFORM
% Computes the DCT transformation from an image in all of it's color space
% dimensions and returns it.

% TODO: Commonly it is better to transform in YUV space domain instead RGB.
[height, width, color_space_dimension] = size(image);
image_dct = ones(height, width, color_space_dimension);
for i=1:color_space_dimension
    image_dct(:,:,i) = dct2(image(:,:,i));
end
end
