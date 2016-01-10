function R = imnoise_lognormal(M, N, a,b)
% input:
%       ������̬lognormal�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
   % ����������̬�ֲ�����
   if nargin <= 3
      a = 1; b = 0.25;
   end
   x = log(randn(M, N));
   R = a*exp(b*x);
end