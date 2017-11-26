function [  ] = analyze_frame( frames, frame_number )
% ANALYZE_FRAME
% Prints and show frame information, from a frames array and the desired
% frame to analyze

frame_size = size(frames);

fprintf('Frame height: %d\n', frame_size(1))
fprintf('Frame width: %d\n', frame_size(2))
fprintf('Color space dimension: %d\n', frame_size(3))

imshow(frames(:,:,:,frame_number))

end

