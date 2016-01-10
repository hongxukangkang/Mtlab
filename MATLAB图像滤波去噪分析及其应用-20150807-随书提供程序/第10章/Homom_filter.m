function im_e = Homom_filter(im,d,rL,rH)
% 同态滤波
%函数输入: 
%         im:  输入的二维图像矩阵
%         d:   截止频率
%         rL   低频增益
%         rH   高频增益
%函数输出: 
%         im_e: 重构滤波图像

if ~isa(im,'double')
    im = double(im);
end

[r c]=size(im); % 输入图像维数
% 高斯高通滤波
A=zeros(r,c);
for i=1:r
    for j=1:c
        A(i,j)=(((i-r/2).^2+(j-c/2).^2)).^(.5);
        B(i,j)=A(i,j)*A(i,j);
        H(i,j)=(1-exp(-((B(i,j)).^2/d.^2)));  % 传递函数
    end
end

% 同态滤波器传递函数：
H=((rH-rL).*H)+rL;
% 取对数
im_l=log2(im + 1e-5);
% 离散傅里叶变换
im_f=fft2(im_l);
% 滤波
im_nf=H.*im_f;
% DFT反变换
im_n=abs(ifft2(im_nf));
% 指数变换，消除取对数
im_e = exp(im_n);  % 滤波矩阵
im_e = uint8(im_e);
