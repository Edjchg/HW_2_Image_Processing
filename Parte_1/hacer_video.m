clc;clear;close all;

pkg load image
pkg load video


%{

A=imread("1.PNG");
B=imread("2.PNG");
C=imread("3.PNG");

[m_c n_c k_c]=size(C);

A=imresize(A, [m_c n_c]);
B=imresize(B, [m_c n_c]);

imagen1=zeros(m_c, n_c*3, 3);
imagen1(:,1:n_c,:)=A;
imagen1(:,1+n_c:2*n_c,:)=B;
imagen1(:,1+n_c*2:n_c*3,:)=C;
imagen1=uint8(imagen1);
%imagen=uint8(imagen1(:,:,1));
%imagen=imnoise(uint8(imagen1),"salt & pepper", 0.2);
video_result = VideoWriter("video_prueba.mp4");
for k=1:150
  writeVideo(video_result, imagen1);
endfor
close(video_result)
%}



%Hacer el video:

video_1=VideoReader("1.mp4");%Es el video mas pequeño.
video_2=VideoReader("2.mp4");
video_3=VideoReader("3.mp4");

m=518;
n=391;
frames=video_1.NumberOfFrames;
video_result=VideoWriter("VIDEO_v2.mp4");
frame_new=zeros(m,n*3,3);
for k=1:frames
  frame_k_1=imresize(readFrame(video_1), [m n]);
  frame_k_2=imresize(readFrame(video_2), [m n]);
  frame_k_3=imresize(readFrame(video_3), [m n]);
  frame_new(:,1:n,:)=frame_k_1;
  frame_new(:,1+n:2*n,:)=frame_k_2;
  frame_new(:,1+2*n:3*n,:)=frame_k_3;
  writeVideo(video_result, uint8(frame_new));
  k
endfor
close(video_result);

