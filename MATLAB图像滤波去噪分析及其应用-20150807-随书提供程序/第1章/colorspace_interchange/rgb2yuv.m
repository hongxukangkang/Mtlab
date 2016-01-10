function im1 = rgb2yuv(im)
% ת������
T = [0.299,0.587,0.114;
    -0.147,-0.289,0.436;
    0.615,-0.515,-0.100]; % ����ϵ��
Ta = [0;0;0];

R = im(:,:,1);  % R
G = im(:,:,2);  % G
B = im(:,:,3);  % B
% R = im2double(R); % ת��Ϊdouble����
% G = im2double(G); % ת��Ϊdouble����
% B = im2double(B); % ת��Ϊdouble����
R = double(R)/255; % ת��Ϊdouble����
G = double(G)/255; % ת��Ϊdouble����
B = double(B)/255; % ת��Ϊdouble����

Y = Ta(1,1) + T(1,1).* R + T(1,2).*G + T(1,3).*B;
U = Ta(2,1) + T(2,1).* R + T(2,2).*G + T(2,3).*B;
V = Ta(3,1) + T(3,1).* R + T(3,2).*G + T(3,3).*B;
im1(:,:,1) = Y;
im1(:,:,2) = U;
im1(:,:,3) = V;
% im1 = im2uint8(im1);  % ����ת��
