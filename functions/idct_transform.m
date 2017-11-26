function [ image ] = idct_transform( dct_image )
% IDCT_TRANSFORM
%

[height, width, color_space_dimension] = size(dct_image);
image = ones(height, width, color_space_dimension);
for i=1:color_space_dimension
    image(:,:,i) = idct2(dct_image(:,:,i));
end
end
