function R = imnoise_X2(M, N, a)
% input:
%       ����X2�����������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
if nargin < 1
   a = 1;
end
   % ���������ֲ�����
   R=zeros(M,N);
   for i=1:a
        R = R + 5*randn(M, N).^2;
   end
end

   
   