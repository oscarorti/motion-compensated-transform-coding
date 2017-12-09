%% ENCODE_IN_DCT_DOMAIN 

filename = 'Breakout_DeepMind.mp4';
video = load_video(filename);
% video_frames = get_frames(video, 1, Inf);
video_frames = get_frames(video, 1, 4);

for i=2:4
    
    [compensated_image_blocks(:,:,i), compensated_block_positions(:,:,i), mse_block_matrix(:,:,i)] = ... 
     generate_compensated_image(video_frames(:,:,:,i-1), video_frames(:,:,:,i), 10, 1);

end

% Compute IDCT of each compensated image
for i2=1:heigh
   for j2=1:width
       compensated_image_blocks_pixel{i2,j2} = idct_transform(compensated_image_blocks(i2,j2,3));
   end
end

%% RESULTS PER FRAME

frame = 4;

% bits per pixel (bpp)
bits_pixel = 8;
[image_height, image_width, color] = size(video_frames(:,:,:,frame));
image_pixels = image_height * image_width * color;
image_bits = image_pixels * bits_pixel;
fprintf('bits per image = %d\n', image_bits)
fprintf('bits per pixel = %d\n\n', color*bits_pixel)

% compensated image bits per pixel
indices_bits = log2(1024);
blocks_transmited = sum(sum(mse_block_matrix(:,:,frame)==-1));
transmited_indices = indices_bits * blocks_transmited;
compensated_image_bits = blocks_transmited * bits_pixel * color + transmited_indices;
compensated_image_bpp = compensated_image_bits / image_pixels;
fprintf('bits per compensated image %d = %d\n', frame, compensated_image_bits)
fprintf('bits per pixel in compensated image %d = %d\n\n', frame, compensated_image_bpp)

clearvars image_height image_width color