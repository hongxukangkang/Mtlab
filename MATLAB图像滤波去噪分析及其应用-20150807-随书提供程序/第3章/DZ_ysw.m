clc,clear,close all
warning off
feature jit off
D0 = 50; % ×èÖ¹µÄÆµÂÊµãÓëÆµÓòÖĞĞÄµÄ¾àÀë
W = 3;  % ´ø¿í
im = imread('coloredChips.png');           % Ô­Í¼Ïñ
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + °×ÔëÉù
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + °×ÔëÉù
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + °×ÔëÉù
im = cat(3,R,G,B);                         % Ô­Í¼Ïñ + °×ÔëÉù
H = freqfilter_ideal(2*size(R,1),2*size(R,2),D0,W);
R1 = fftfilt2(R,H);
G1 = fftfilt2(G,H);
B1 = fftfilt2(B,H);
im1 = cat(3,R1,G1,B1);
im1 = uint8(im1);
figure('color',[1,1,1])
subplot(121),imshow(im,[]); title('Ô­Ê¼Í¼Ïñ')
subplot(122),imshow(im1,[]); title('´ø×èÂË²¨Í¼Ïñ')


