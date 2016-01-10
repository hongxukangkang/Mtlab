function resim = Inverse(ifbl, LEN, THETA)
% ���˲���
%��������: 
%         ifbl:  �����ͼ�����
%         THETA: ģ����ת��
%         LEN:   ģ����ת���ȣ�ģ�������ظ���
%�������: 
%         resim: �ع��˲�ͼ��
if ~isa(ifbl,'double')
    ifbl = double(ifbl)/255;
end
% ת����Ƶ��
fbl = fft2(ifbl);  % ����Ҷ�任
% ����չ����PSF
PSF = fspecial('motion',LEN,THETA); 
% ת��PSF������������ά�� �⴫�ݺ���OTF
OTF = psf2otf(PSF, size(fbl));
% ����Ƿ����0ֵ����Ϊ0������Ϊ0.000001
for i = 1:size(OTF, 1)
    for j = 1:size(OTF, 2)
        if OTF(i, j) == 0
            OTF(i, j) = 0.000001;
        end
    end
end
% ʹ�����˲����ع�ͼ��
fdebl = fbl./OTF;
% ʹ���渵��Ҷ�任�õ��ع�ͼ�� IFFT
resim = ifft2(fdebl);
