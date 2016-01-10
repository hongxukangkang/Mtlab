function z = harmonymean_filter(x,m,n)
% г����ֵ�˲�
% ��������:
%         x�������άͼ�����
%         m,n���˲���Ĥ�ߴ�
% �������:
%         z�����ͼ���������������������ͬ
if ~isa(x,'double')
    x = double(x)/255;
end

z = m*n./imfilter(1./(x+eps),ones(m,n),'replicate'); % г����ֵ�˲�
z = im2uint8(z);                                     % ����ת��

end

