function resim = Lucy_Richardson(ifbl, LEN, THETA, iterations)
% Lucy_Richardson�˲���
%��������: 
%         ifbl:  �����ͼ�����
%         LEN:   ģ����ת���ȣ�ģ�������ظ���
%         THETA: ģ����ת��
%         iterations: ��������
%�������: 
%         resim: �ع��˲�ͼ��
if ~isa(ifbl,'double')
    ifbl = double(ifbl);
end

ifbl = medfilt2(abs(ifbl)); %��ֵ�˲�
est = ifbl; % ��ʼ��ģ��ͼ��ֵ����
% ����չ����PSF
PSF = fspecial('motion',LEN,THETA);
% ת��PSF������������ά�� �⴫�ݺ���OTF
OTF = psf2otf(PSF,size(ifbl));
i = 1;
while i<=iterations
    fest = fft2(est);    % ת����Ƶ��
    fblest = OTF.*fest;  % Ƶ�����
    ifblest = ifft2(fblest); % ����Ҷ���任��ת����ʱ��
    % ����ģ��ǰ��ͼ�� �� ȥģ�����ͼ�� �ı�ֵ
    iratio = ifbl./(ifblest+eps);
    firatio = fft2(iratio);   % ת����Ƶ��
    corrvec = OTF .* firatio; % �������������
    icorrvec = ifft2(corrvec);% ����Ҷ���任��ת����ʱ��
    % ������Ƶ�ȥģ��ͼ�����
    aftercorr = icorrvec.*est;
    est = aftercorr;
    i = i+1;
end
resim = abs(est); % �ع��˲�ͼ��



