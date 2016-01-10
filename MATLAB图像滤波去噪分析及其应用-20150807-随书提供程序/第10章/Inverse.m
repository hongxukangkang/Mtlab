function resim = Inverse(ifbl, LEN, THETA)
% 逆滤波器
%函数输入: 
%         ifbl:  输入的图像矩阵
%         THETA: 模糊旋转角
%         LEN:   模糊旋转长度，模糊的像素个数
%函数输出: 
%         resim: 重构滤波图像
if ~isa(ifbl,'double')
    ifbl = double(ifbl)/255;
end
% 转化到频域
fbl = fft2(ifbl);  % 傅里叶变换
% 点扩展函数PSF
PSF = fspecial('motion',LEN,THETA); 
% 转化PSF函数到期望的维数 光传递函数OTF
OTF = psf2otf(PSF, size(fbl));
% 检测是否存在0值，若为0，则置为0.000001
for i = 1:size(OTF, 1)
    for j = 1:size(OTF, 2)
        if OTF(i, j) == 0
            OTF(i, j) = 0.000001;
        end
    end
end
% 使用逆滤波器重构图像
fdebl = fbl./OTF;
% 使用逆傅里叶变换得到重构图像 IFFT
resim = ifft2(fdebl);
