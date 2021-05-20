clc; clear; close all;
pkg load image
pkg load video


video_original="VIDEO.mp4";
video_pequeno="VIDEO_pequeno.mp4";
video_result = VideoWriter(video_pequeno);
V_original=VideoReader(video_original);
m_org=V_original.Height;
n_org=V_original.Width;
frames = V_original.NumberOfFrames;
for k=1:300
  Frame_k = readFrame(V_original);
  writeVideo(video_result, imresize(uint8(Frame_k), 0.5));
  k
endfor
close(video_result);