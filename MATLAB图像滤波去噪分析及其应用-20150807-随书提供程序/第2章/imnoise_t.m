function R = imnoise_t(M, N, a)
% input:
%       t�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
if nargin < 1
   a = 1;
end
   % ����F�ֲ�����
   R1=zeros(M,N);
   R2=zeros(M,N);
   for i=1:a
        R1 = 5*randn(M, N).^2;
        R2 = 5*randn(M, N).^2;
        R = R1./sqrt(R2./a);
   end
end