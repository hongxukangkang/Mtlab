function im1 = yiq2rgb(im)
% ת������
T = [0.299,0.587,0.114;
    0.595716,-0.274453,-0.321263;
    0.211456,-0.522591,0.311135]; % ����ϵ��
Ta = [0;0;0];

TT = inv(T);   % �������
Tb = TT*Ta;

Y = im(:,:,1);  % Y
I = im(:,:,2);  % I
Q = im(:,:,3);  % Q
% Y = im2double(Y); % ת��Ϊdouble����
% I = im2double(I); % ת��Ϊdouble����
% Q = im2double(Q); % ת��Ϊdouble����

R = -Tb(1,1) + TT(1,1).* Y + TT(1,2).*I + TT(1,3).*Q;
G = -Tb(2,1) + TT(2,1).* Y + TT(2,2).*I + TT(2,3).*Q;
B = -Tb(3,1) + TT(3,1).* Y + TT(3,2).*I + TT(3,3).*Q;
% R = mat2gray(R); % �Ҷ�ֵ ת��Ϊ 0 - 1֮�� 
% G = mat2gray(G); % �Ҷ�ֵ ת��Ϊ 0 - 1֮�� 
% B = mat2gray(B); % �Ҷ�ֵ ת��Ϊ 0 - 1֮�� 
im1(:,:,1) = R;  
im1(:,:,2) = G;
im1(:,:,3) = B;
% im1 = min(max(im1,0),1);
% im1 = im2uint8(im1);  % ����ת��

