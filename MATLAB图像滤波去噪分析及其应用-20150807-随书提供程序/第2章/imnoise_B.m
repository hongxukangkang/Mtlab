function R = imnoise_B(im,M, N, b)
% input:
%       ����ʽB�ֲ������������ͣ�
%       M,N���������ͼ�����Ĵ�С
%       a,b�����������ķֲ�����
% output:
%       R: ���������ͼ�������������Ϊdouble��
% �趨Ĭ��ֵ
% ���ǵ�floor(a/2)������
if nargin < 4
   b = 0.5;
end
   % ��������ʽ�ֲ�����
    for i = 1:M
        for j=1:N
           a = double( floor(im(i,j)/30)+1 );
           R(i,j) = nchoosek(a,floor(a/2)) * b.^(floor(a/2)) .* (1-b).^(a- floor(a/2));
        end
    end
end
