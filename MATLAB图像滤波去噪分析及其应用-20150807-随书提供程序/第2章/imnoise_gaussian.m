function R = imnoise_gaussian(M, N, a, b)
% input:
%       gaussian�����������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
if nargin == 1
   a = 0; b = 1;
   M = 1; N = 1;
elseif nargin == 3
   a = 0; b = 1;
end
   % ������˹�ֲ�����--������
   R = a + b*randn(M, N);
end