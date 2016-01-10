function im5 = freqfilter_gaussian_Hp(im,D0)
% ��˹��ͨ�˲���gaussian
% input:
%     M,N:Ƶ���˲����ĳߴ�
%     D0�������˲����Ľ�ֹƵ��
%     n ���״�
% output:
%       H��M x N�ľ��󣬱�ʾƵ���˲���������������Ϊdouble��
    if ~isa(im,'double')
        im1 = double(im)/255; 
    end
im2 = fft2(im1);      % ����Ҷ�任
im3 = fftshift(im2);  % ���Ļ�

[N1, N2] = size(im3);
n1 = fix(N1 / 2);
n2 = fix(N2 / 2);
for i = 1:N1
    for j = 2:N2
        D = sqrt((i-n1)^2+(j-n2)^2);
        h = 1- exp(-D.^2./2./D0./D0);  % ��˹��ͨ�˲���
        result(i,j) = h * im3(i,j);
    end
end
result = ifftshift(result);    % �����Ļ�
im4 = ifft2(result);           % ���任
im5 = im2uint8(real(im4));     % �˲�ͼ��
end
