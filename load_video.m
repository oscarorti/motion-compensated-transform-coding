function [ video_object ] = load_video( video_path )
% VIDEO_READER 
% returns a VideoReader object from the path of a video file

video_object = VideoReader(video_path);

end

