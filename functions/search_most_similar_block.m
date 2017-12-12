function [ most_similar_block, most_similar_block_position, mse_error ] = search_most_similar_block( reference_block, reference_block_indices, splitted_image )
% SEARCH_MOST_SIMILAR_BLOCK 
% Searches the most similar block to reference_block in a splitted_image
% then returns the most_similar_block, position and it's MSE error


mse_error = Inf;
[height, width] = size(splitted_image);
maximum_displacement = 16;


if (reference_block_indices(1) - maximum_displacement) < 1
    height_start_block = 1;
else
    height_start_block = reference_block_indices(1) - maximum_displacement;
end

if (reference_block_indices(1) + maximum_displacement) > height
    height_end_block = height;
else
    height_end_block = reference_block_indices(1) + maximum_displacement;
end

if (reference_block_indices(2) - maximum_displacement) < 1
    width_start_block = 1;
else
    width_start_block = reference_block_indices(2) - maximum_displacement;
end

if (reference_block_indices(2) + maximum_displacement) > width
    width_end_block = width;
else
    width_end_block = reference_block_indices(2) + maximum_displacement;
end


for i=height_start_block:height_end_block
    for j=width_start_block:width_end_block
        temporal_mse_error = compute_mse(reference_block, splitted_image{i,j});
        if temporal_mse_error < mse_error
            most_similar_block = splitted_image(i,j);
            mse_error = temporal_mse_error;
            index_height = i;
            index_width = j;
        end
    end
end

most_similar_block_position = [index_height, index_width];

end
