function im1 = ycbcr2rgb(im)
% ת������
T = [65.481,128.553,24.966;
    -37.797,-74.203,112.0;
    112.0,-93.786,-18.214];  % ����ϵ��
Ta = [16;128;128];

TT = inv(T);   % �������
Tb = TT*Ta;

Y = im(:,:,1);   % Y
Cb = im(:,:,2);  % Cb
Cr = im(:,:,3);  % Cr
Y = im2double(Y);   % ת��Ϊdouble����
Cb = im2double(Cb); % ת��Ϊdouble����
Cr = im2double(Cr); % ת��Ϊdouble����

R = -Tb(1,1) + TT(1,1).* Y + TT(1,2).*Cb + TT(1,3).*Cr;
G = -Tb(2,1) + TT(2,1).* Y + TT(2,2).*Cb + TT(2,3).*Cr;
B = -Tb(3,1) + TT(3,1).* Y + TT(3,2).*Cb + TT(3,3).*Cr;
R = mat2gray(R); % �Ҷ�ֵ ת��Ϊ 0 - 1֮�� 
G = mat2gray(G); % �Ҷ�ֵ ת��Ϊ 0 - 1֮�� 
B = mat2gray(B); % �Ҷ�ֵ ת��Ϊ 0 - 1֮�� 
im1(:,:,1) = R;  
im1(:,:,2) = G;
im1(:,:,3) = B;
im1 = im2uint8(im1);  % ����ת��


