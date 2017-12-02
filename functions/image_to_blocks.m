function [ splitted_image ] = image_to_blocks( image, block_height, block_width )
% DIVIDE_IMAGE_IN_BLOCKS
% Returns a cell array with the input image divided into blocks of
% dimension [block_height, block_width] and the same color space.

% Mirroring if necessary
[image_height, image_width, color] = size(image);
height_mod = mod(image_height, block_height);
width_mod = mod(image_width, block_width);

if height_mod > 0 || width_mod > 0
    image_pad = padarray(image,[height_mod width_mod], 'symmetric','both');
else
    image_pad = image;
    
% Define Block dimension
block_height_array = block_height * ones(image_height/block_height, 1);
block_width_array = block_width * ones(image_width/block_width, 1);

% Split image into blocks
splitted_image = mat2cell(image_pad, block_height_array, block_width_array, color);

end
