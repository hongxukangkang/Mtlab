function im_ret = Lee( im, w_size, out_size, NL, bound, flag )
%   im：SAR影像
%   w_size：窗口大小，奇数 3 5 7 9等
%   out_size：输出图像的大小，可以是'same'或者'full'
%   NL：number of Looks，等效视数
%   bound：边缘扩展模式，分为'symmetric'，'replicate','circular'。
%   flag：计算时是否包含中心像素，0为不包含，1为包含。 
%
%   bound和flag主要是给im_mean_var用的 :)
% 函数输出：
%   im_ret：滤波结果

if ~isa(im,'double')
    im = double(im)/255;
end
[im_Mean, im_Var] = im_mean_var(im, w_size, out_size, bound, flag); % 求均值和方差
im_Std = sqrt(im_Var);  % 开方
Ci = im_Std ./ im_Mean; % 变差系数
Cu = sqrt(1/NL);        % 噪声变差系数
tmp = 2*log(Cu) - 2.*log(Ci+0.1);
tmp = exp(tmp);
W = 1 - tmp;
im_ret = im .* W + im_Mean .* (1 - W);  % 滤波结果

