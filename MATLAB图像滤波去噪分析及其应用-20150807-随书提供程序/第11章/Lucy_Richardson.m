function resim = Lucy_Richardson(ifbl, LEN, THETA, iterations)
% Lucy_Richardson滤波器
%函数输入: 
%         ifbl:  输入的图像矩阵
%         LEN:   模糊旋转长度，模糊的像素个数
%         THETA: 模糊旋转角
%         iterations: 迭代次数
%函数输出: 
%         resim: 重构滤波图像
if ~isa(ifbl,'double')
    ifbl = double(ifbl);
end

ifbl = medfilt2(abs(ifbl)); %中值滤波
est = ifbl; % 初始化模糊图像赋值操作
% 点扩展函数PSF
PSF = fspecial('motion',LEN,THETA);
% 转化PSF函数到期望的维数 光传递函数OTF
OTF = psf2otf(PSF,size(ifbl));
i = 1;
while i<=iterations
    fest = fft2(est);    % 转化到频域
    fblest = OTF.*fest;  % 频率相乘
    ifblest = ifft2(fblest); % 傅里叶反变换，转换到时域
    % 计算模糊前的图像 与 去模糊后的图像 的比值
    iratio = ifbl./(ifblest+eps);
    firatio = fft2(iratio);   % 转化到频域
    corrvec = OTF .* firatio; % 计算相关性向量
    icorrvec = ifft2(corrvec);% 傅里叶反变换，转换到时域
    % 计算估计的去模糊图像矩阵
    aftercorr = icorrvec.*est;
    est = aftercorr;
    i = i+1;
end
resim = abs(est); % 重构滤波图像



