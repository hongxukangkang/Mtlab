function R = imnoise_rayleigh(M, N, a,b)
% input:
%       ����rayleigh�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
   % ���������ֲ�����
   R = a + (-b*log(1 - rand(M, N))).^0.5;
end