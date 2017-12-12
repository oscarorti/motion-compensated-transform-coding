function [ compensated_image_blocks, compensated_block_positions, mse_block_matrix ] = generate_compensated_image( frame1, frame2, mse_threshold, DCT )
% GENERATE_COMPENSATED_IMAGE
% Generates the compensated image and returns the image_blocks,
% block_positions and mse_block matrices.

mse_threshold = 10;

splitted_frame1 = image_to_blocks( frame1, 8, 8 );
splitted_frame2 = image_to_blocks( frame2, 8, 8 );

[height, width] = size(splitted_frame2);

if DCT == 1
   for i2=1:height
       for j2=1:width
           dct_frame1{i2,j2} = dct_transform(splitted_frame1{i2,j2});
           dct_frame2{i2,j2} = dct_transform(splitted_frame2{i2,j2});
       end
   end
end

% Initialize variables
compensated_image_blocks = cell(height, width);
compensated_block_positions = cell(height, width);
mse_block_matrix = ones(height, width);

% Generate image_blocks, block_positions and MSE_block matrix
for i=1:height
    for j=1:width
        block_indices = [i j];
        [compensated_image_blocks(i,j), compensated_block_positions{i,j}, mse_block_matrix(i,j)] = search_most_similar_block( splitted_frame2{i,j}, block_indices, splitted_frame1 );
        if mse_block_matrix(i,j) > mse_threshold
            compensated_image_blocks(i,j) = splitted_frame2(i,j);
            compensated_block_positions{i,j} = [-1 -1];
            mse_block_matrix(i,j) = -1;
        end
    end
end

end
