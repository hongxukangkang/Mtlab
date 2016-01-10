function resim = Wiener(ifbl, LEN, THETA, SNR)
% Wiener�˲���
%��������: 
%         ifbl:  �����ͼ�����
%         LEN:   ģ����ת���ȣ�ģ�������ظ���
%         THETA: ģ����ת��
%         SNR�������
%�������: 
%         resim: �ع��˲�ͼ��

ifbl = medfilt2(abs(ifbl));%��ֵ�˲�
fbl = fft2(ifbl); % ת����Ƶ��
% ����չ����PSF
PSF = fspecial('motion',LEN,THETA);
% ת��PSF������������ά�� �⴫�ݺ���OTF
OTF = psf2otf(PSF,size(fbl));
OTFC = conj(OTF);   % �������
modOTF = OTF.*OTFC; % ƽ�� 
% ����Ƿ����0ֵ����Ϊ0������Ϊ0.000001
for i = 1:size(OTF, 1)
    for j = 1:size(OTF, 2)
        if OTF(i, j) == 0
            OTF(i, j) = 0.000001;
        end
    end
end
% ʹ��Wiener�˲�����ʽ��ȥģ��ͼ��
debl = ((modOTF./(modOTF+SNR))./(OTF)).*fbl;
lbed = ifft2(debl);    % ����Ҷ���任
resim = lbed;          % �ع��˲�ͼ��

