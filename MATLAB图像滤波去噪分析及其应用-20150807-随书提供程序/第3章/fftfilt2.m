function Z = fftfilt2(X,H)
% Ƶ���˲�
% �������룺
%       X������Ŀ���ͼ�����double����
%       H��Ƶ���˲�����һ��Ϊͼ��X��2��ʱ�Ϻ�
% ���������
%       Z������Ŀ���ͼ��ֳ��أ���������Ϊdouble����
 % ��ά����Ҷ�任
F = fft2(X,size(H,1),size(H,2)); 
% ����Ҷ���任
Z = H.*F; 
Z = ifftshift(Z);
Z = abs(ifft2(Z));
Z = Z(1:size(X,1),1:size(X,2));

