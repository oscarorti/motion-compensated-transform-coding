function [ most_similar_block, most_similar_block_position, mse_error ] = search_most_similar_block( reference_block, splitted_image )
% SEARCH_MOST_SIMILAR_BLOCK 
% Searches the most similar block to reference_block in a splitted_image
% then returns the most_similar_block, position and it's MSE error

mse_error = 10000;
[height, width] = size(splitted_image);

% TODO: Try to avoid loops... To much indention in this part!
for i=1:height
    for j=1:width
        temporal_mse_error = compute_mse( reference_block, splitted_image{i,j} );
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

