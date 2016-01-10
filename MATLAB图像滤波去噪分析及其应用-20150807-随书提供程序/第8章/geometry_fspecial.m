function im2 = geometry_fspecial(im,m,n)
%����������ͼ����ж��ξ�ֵ�˲�
% ��������:
%           x�������άͼ�����
%           m,n���˲���Ĥ�ߴ�
% �������
%           im2�����ͼ���������������������ͬ

    if ~isa(im,'double')
        im1 = double(im)/255;
    else 
        im1 = im;
    end
    im2 = exp( imfilter(log(im1),ones(m,n),'replicate') ).^(1/m/n); % ���ξ�ֵ�˲�
    im2 = im2uint8(im2);   % ��������ת�� 
end