function im3 = linear_sharpen_filter(im,w)
% �������˲���
% input:
%     im:ԭʼͼ�񣬴��˲�ͼ��
%     D0�������˲����Ľ�ֹƵ��
%     n ���״�
% output:
%       H��M x N�ľ��󣬱�ʾƵ���˲���������������Ϊdouble��
    if ~isa(im,'double')
        im1 = double(im)/255; 
    end
im2 = imfilter(im1,w,'replicate');   % �����񻯴���
im3 = im1-im2;                       % im3Ϊ�񻯺�ͼ��
end

