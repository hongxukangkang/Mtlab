function R = imnoise_poission(im,M, N, lamda)
% input:
%       ����poission�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
if nargin < 4
   lamda = 0.5;
end
   % ����poission�ֲ�����
   for i = 1:M
       for j=1:N
           b=1;
           c = double( floor(im(i,j)/30)+1 );
           for k =1:c
               b=b*k;
           end
           R(i,j) = exp(-lamda).*lamda.^(c)./b;
       end
   end
end
