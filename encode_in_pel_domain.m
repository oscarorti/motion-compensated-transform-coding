function [compensated_image_blocks, compensated_block_positions, mse_block_matrix] = encode_in_pel_domain(filename)
% ENCODE_IN_PEL_DOMAIN 

video = load_video(filename);
% video_frames = get_frames(video, 1, Inf);
video_frames = get_frames(video, 1, 4);

% TODO: Preallocate variables!

% TODO: Process frame 1!

for i=2:4
    
    [compensated_image_blocks(:,:,i), compensated_block_positions(:,:,i), mse_block_matrix(:,:,i)] = ... 
     generate_compensated_image(video_frames(:,:,:,i-1), video_frames(:,:,:,i), 10);

end

end