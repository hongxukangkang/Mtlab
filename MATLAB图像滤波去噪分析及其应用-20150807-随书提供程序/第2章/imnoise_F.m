function R = imnoise_F(M, N, a, b)
% input:
%       F�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
if nargin < 4
   a = 1;b=1;
end
   % ����F�ֲ�����
   R1=zeros(M,N);
   R2=zeros(M,N);
   for i=1:a
        R1 = R1 + 5*randn(M, N).^2;
        R2 = R2 + 5*randn(M, N).^2;
        R = R1./R2;
   end
end
