function resim = Wiener(ifbl, LEN, THETA, SNR)
% Wiener滤波器
%函数输入: 
%         ifbl:  输入的图像矩阵
%         LEN:   模糊旋转长度，模糊的像素个数
%         THETA: 模糊旋转角
%         SNR：信噪比
%函数输出: 
%         resim: 重构滤波图像

ifbl = medfilt2(abs(ifbl));%中值滤波
fbl = fft2(ifbl); % 转化到频域
% 点扩展函数PSF
PSF = fspecial('motion',LEN,THETA);
% 转化PSF函数到期望的维数 光传递函数OTF
OTF = psf2otf(PSF,size(fbl));
OTFC = conj(OTF);   % 共轭操作
modOTF = OTF.*OTFC; % 平方 
% 检测是否存在0值，若为0，则置为0.000001
for i = 1:size(OTF, 1)
    for j = 1:size(OTF, 2)
        if OTF(i, j) == 0
            OTF(i, j) = 0.000001;
        end
    end
end
% 使用Wiener滤波器公式，去模糊图像
debl = ((modOTF./(modOTF+SNR))./(OTF)).*fbl;
lbed = ifft2(debl);    % 傅里叶反变换
resim = lbed;          % 重构滤波图像

