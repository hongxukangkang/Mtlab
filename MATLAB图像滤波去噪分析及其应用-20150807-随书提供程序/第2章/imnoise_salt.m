% ��ͼ���������
function Z = imnoise_salt(X,a)
% input��X�������άͼ�������������Ϊuint8����
%          a����������Ũ��
% output: Z : ����������ͼ��
[m,n] = size(X);
R = rand(m,n);
c = find(R<=a);
Z=X ;
Z(c) = 255;