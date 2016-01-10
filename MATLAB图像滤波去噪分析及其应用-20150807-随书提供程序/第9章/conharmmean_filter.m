function im = conharmmean_filter(x,m,n,q)
% ��г����ֵ�˲�
% ��������:
%         x�������άͼ�����
%         m,n���˲���Ĥ�ߴ�
% �������:
%         im�����ͼ���������������������ͬ
if ~isa(x,'double')
    x = double(x)/255;
end

im = imfilter(x.^(q+1),ones(m,n),'replicate');
im = im./(imfilter(x.^q,ones(m,n),'replicate')+eps);   % ��г����ֵ�˲�
im = im2uint8(im);                                     % ����ת��
end
