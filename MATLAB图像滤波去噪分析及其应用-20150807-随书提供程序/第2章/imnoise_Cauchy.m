function R = imnoise_Cauchy(M, N, a,b)
% input:
%       ����Cauchy�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
if nargin < 4
   a= 0.0; b=1.0;
end
b=1;
   % ��������Cauchy�ֲ�����
   R = b./(pi*( b.^2 + ( rand(M,N) - a ).^2 ));
end
