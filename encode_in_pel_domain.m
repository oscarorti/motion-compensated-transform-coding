function [ ] = encode_in_pel_domain( filename )
% ENCODE_IN_PEL_DOMAIN 

video = load_video(filename);
% video_frames = get_frames(video, 1, Inf);
video_frames = get_frames(video, 1, 20);

end

