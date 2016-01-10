function R = imnoise_geometry(im,M, N, b)
% input:
%       ����geometry�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
if nargin < 3
   b = 0.5;
end
   % �������ηֲ�����
  for i = 1:M
    for j=1:N
       a = double( floor(im(i,j)/30)+1 );
       R(i,j) = b .* (1-b).^(a-1);
    end
  end
end
