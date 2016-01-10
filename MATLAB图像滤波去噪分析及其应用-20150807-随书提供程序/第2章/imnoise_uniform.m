function R = imnoise_uniform(M, N, a, b)
% input:
%       uniform���������ͣ�
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

   % �������ȷֲ�����
   R = a + (b - a)*rand(M, N);
end
