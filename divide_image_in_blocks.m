function [ splitted_image ] = divide_image_in_blocks( image, block_height, block_width )
% DIVIDE_IMAGE_IN_BLOCKS
% Returns a cell array with the input image divided into blocks of
% dimension [block_height, block_width] and the same color space.

% Define Block dimension
[image_height, image_width, color] = size(image);
block_height_array = block_height * ones(image_height/block_height, 1);
block_width_array = block_width * ones(image_width/block_width, 1);

% Split image into blocks
splitted_image = mat2cell(image, block_height_array, block_width_array, color);

end
