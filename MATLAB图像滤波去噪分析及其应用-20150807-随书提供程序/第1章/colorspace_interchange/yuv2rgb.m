function im1 = yuv2rgb(im)
% ת������
T = [0.299,0.587,0.114;
    -0.147,-0.289,0.436;
    0.615,-0.515,-0.100]; % ����ϵ��
Ta = [0;0;0];

TT = inv(T);   % �������
Tb = TT*Ta;

Y = im(:,:,1);  % Y
U = im(:,:,2);  % U
V = im(:,:,3);  % V
% Y = im2double(Y); % ת��Ϊdouble����
% U = im2double(U); % ת��Ϊdouble����
% V = im2double(V); % ת��Ϊdouble����

R = -Tb(1,1) + TT(1,1).* Y + TT(1,2).*U + TT(1,3).*V;
G = -Tb(2,1) + TT(2,1).* Y + TT(2,2).*U + TT(2,3).*V;
B = -Tb(3,1) + TT(3,1).* Y + TT(3,2).*U + TT(3,3).*V;
% R = mat2gray(R); % �Ҷ�ֵ ת��Ϊ 0 - 1֮�� 
% G = mat2gray(G); % �Ҷ�ֵ ת��Ϊ 0 - 1֮�� 
% B = mat2gray(B); % �Ҷ�ֵ ת��Ϊ 0 - 1֮�� 
im1(:,:,1) = R;  
im1(:,:,2) = G;
im1(:,:,3) = B;
% im1 = min(max(im1,0),1);
% im1 = im2uint8(im1);  % ����ת��
