function [ frames ] = get_frames( video, first_frame, last_frame )
% GET_FRAMES 
% Returns a group of frames from a VideoReader object, 
% first frame and last frame.

frames = read(video, [first_frame last_frame]);

end

