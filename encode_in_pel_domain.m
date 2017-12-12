%% ENCODE_IN_PEL_DOMAIN

filename = 'Breakout_DeepMind.mp4';
video = load_video(filename);
first_frame = 100;
last_frame = 104;
% video_frames = get_frames(video, 1, Inf);
video_frames = get_frames(video, first_frame, last_frame);

for i=2:last_frame-first_frame+1
    
    [compensated_image_blocks(:,:,i), compensated_block_positions(:,:,i), mse_block_matrix(:,:,i)] = ... 
     generate_compensated_image(video_frames(:,:,:,i-1), video_frames(:,:,:,i), 10, 0);
    compensated_video(:,:,:,i) = blocks_to_image(compensated_image_blocks(:,:,i));

end

clearvars i 
%% SHOW COMPENSATED IMAGES AND PRINT RESULTS

% bits per pixel (bpp)
bits_pixel = 8;
[image_height, image_width, color] = size(video_frames(:,:,:,1));
image_pixels = image_height * image_width * color;
image_bits = image_pixels * bits_pixel;
fprintf('bits per image = %d\n', image_bits)
fprintf('bits per pixel = %d\n\ n', color*bits_pixel)

for i=2:last_frame-first_frame+1
    
    % show image
    imshow(compensated_video(:,:,:,i))

    % compensated image bits per pixel
    indices_bits = log2(1024);
    blocks_transmited = sum(sum(mse_block_matrix(:,:,i)==-1));
    transmited_indices = indices_bits * blocks_transmited;
    compensated_image_bits = blocks_transmited * bits_pixel * color + transmited_indices;
    compensated_image_bpp = compensated_image_bits / image_pixels;
    fprintf('blocks transmited in frame %d = %d\n', i, blocks_transmited)
    fprintf('bits per image %d = %d\n', i, compensated_image_bits)
    fprintf('bits per pixel in compensated image %d = %d\n\n', i, compensated_image_bpp)

    pause
end

close all
